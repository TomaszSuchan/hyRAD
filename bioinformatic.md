# Bioinformatic pipeline to process hyRAD datasets

## Demultiplexing

Paired multiplexed reads were sorted by individual barcodes with FastqMultx from ea-utils package (https://code.google.com/p/ea-utils/wiki/FastqMultx):

```
fastq-multx -l in.barcodes R1.fastq -o R1.%.fq R2.fastq -o R2.%.fq
```

where `in.barcodes` is a text file with barcodes, `R1.fq` and `R2.fq` are fastq files with multiplexed reads.

## Cleaning

Reads' cleaning and filtering was provided by Trimmomatic-0.30 tool:

```
java -jar trimmomatic-0.30.jar PE -threads 4 -phred33 inR1.fq inR2.fq outR1.trim.fq outR1.unpaired.fq outR2.trim.fq outR2.unpaired.fq ILLUMINACLIP:contamination.fa:2:30:10 SLIDINGWINDOW:4:15 LEADING:20 TRAILING:20 HEADCROP:20 CROP:100 MINLEN:70 > trimming_log.out.txt
```

where `contamination.fa` is a fasta file containg a list of all technical contaminants and barcode sequences,  `inR1.fq` and `outR1.fq` are the input files with paired reads demultiplexed by barcodes.

## Quality check

Quality of reads was evaluated by FastQC (http://www.bioinformatics.babraham.ac.uk/projects/fastqc/):

```
fastqc in.fq
```

## Search clustering of _RAD-ref_ reference

Vsearch clustering (https://github.com/torognes/vsearch) was provided with the main command:

```
vsearch  --centroids output/centroids.fasta  --cluster_fast input/in.fasta  --id 0.97
```

where `–id` is a chosen similarity threshold

First, we run vsearch clustering on probes merged by barcodes. Second, we kept only clusters covered at least 3x times for each sample. Third, we merged clusters coming from individual samples and re-clustered them with vsearch (second round clustering). Because of the difference in similarity levels similarity threshold must be assessed separately when dealing with samples merged by barcodes and all samples together.

## Building _RAD-ref-ext_ reference

Extention of the obtained loci was provided by PriceTI tool:

```
PriceTI –fp R1.fq R2.fq 550 –icf loci.fa 1 1 5 –nc 30 –mol 30 –tol 20 –o extended_loci.fa –o extension.priceq –a 22
```

where `R1.fq` and `R2.fq` are fastq files with paired cleaned reads for one of individual.

## Building _assembly-ref_ reference

De novo assembly was provided with just first reads in pairs of fresh sonicated sample (`in.fq`) by Newbler assembler (http://www.454.com/products/analysis-software/):

```
newbler2.9/bin/runAssembly -o run3 -force -notrim -a 50 -ace -ar -cpu 20 -het -large -ml 30 -s 1000 -sc 1 -sio -sl 16 -ss 12 -p in.fq
```


## Mapping and SNP calling

Reference sequence fasta files were indexed with bowtie2-build command:

```
bowtie2-build reference.fasta prefix
```

Mapping was processed by the bowtie2 (http://bowtie-bio.sourceforge.net/bowtie2/index.shtml):

```
bowtie2 -x reference.fasta -1 R1.trim.fq -2 R2.trim.fq -S out.sam > mapping_log.txt
```

Output file in sam format was converted to bam by “view” command of samtools (http://samtools.sourceforge.net/samtools.shtml):

```
samtools view -bS -F 4 out.sam > out.bam
```

To evaluate the level of postmortal DNA damage and to rescale bam files we used mapDamage package (http://ginolhac.github.io/mapDamage/):

```
mapDamage  -i in.bam  -r reference.fasta  -d output  --rescale
```

Files were then sorted and indexed by samtools package:

```
samtools sort out.bam out.s
samtools index out.s.bam
```

SNPs were called for all samples at once:

```
samtools mpileup -g -f reference.fasta out1.s.bam … outN.s.bam > outMULTI.raw.bcf
bcftools view -bvcg outMULTI.raw.bcf > outMULTI.var.bcf
bcftools view outMULTI.var.bcf | vcfutils.pl varFilter - > outMULTI.var.final.vcf
```

