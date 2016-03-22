# Wetlab protocol for hyRAD

Use filter tips and dedicated equipment for low-content DNA work, separate pre- and post-PCR areas, frequently clean your bench and equipment using 10% bleach solution. To ensure reliable results, follow [Illumina best practices](https://support.illumina.com/content/illumina-support/us/en/sequencing/sequencing\_kits/truseq\_rna\_access\_library\_prep\_kit/best\_practices.html).

The volumes in the mixes are provided for one sample. Multiply by the number of samples plus additional volume to account for pipetting errors (e.g. multiply by 1.1). Prepare one master mix for all the samples processed to avoid pipetting errors.

Do not add barcoded adaptors to the master mix, these should be added to each sample separately (each sample = unique barcode)! Also remember to prepare separately one master mix per indexing primer in the indexing PCR step.

## 1 Equipment needed, reagents and solutions to prepare		

### 1.1 Special equipment needed

Except the standard lab equipment (thermocycler, vortex, centrifuge, gel electrophoresis system, etc.), you need a magnetic rack for AMPure cleanup. You might try a do-it-yourself approach by fixing strong neodymium magnets on some base if you are on a budget.

The rest of the equipment, listed below, is not neccesary but greatly facilitates library preparations and quality checks:

- Pippin Prep or Blue Pippin (Sage Science),
- Tapestation, Bioanalyzer (Agilent Technologies) or Fragment Analyzer (Advanced Analytical),
- Qubit fluorometer (ThermoFisher) or other fluorometric quantification kit, such as Quant-iT Picogreen (ThermoFisher).

### 1.2 Reagents, buffers and kits needed

NB: The reagents listed below are the ones we tested. You are welcome to try other suppliers; if you do so, please share your feedback.

| reagent                                | producer         | serial #      | remarks                      |
|----------------------------------------|------------------|---------------|------------------------------|
|BST polymerase, large fragment (8 U/μL) |NEB               |M0275S, M0275L |supplied with buffer          |
|Klenow fragment (3'->5' exo-) (5 U/μL)  |NEB               |M0212S, M0212L |supplied with buffer          |
|Q5 hot-start DNA polymerase (2 U/μL)    |NEB               |M0493S, M0493L |supplied with buffer          |
|T4 DNA ligase (400 U/μL)                |NEB               |M0202S, M0202L |supplied with buffer          |
|T4 DNA polymerase (3 U/μL)              |NEB               |M0203S, M0203L |supplied with buffer and BSA  |
|T4 Polynucleotide kinase (PNK) (10U/μL) |NEB               |M0201S, M0201L |supplied with buffer          |
|Terminal transferase (TdT) (20 U/μL)    |NEB               |M0315S, M0315L |supplied with buffer and CoCl<sub>2</sub>|
|MseI restriction enzyme (10 000 U/ml)   |NEB               |R0525          |                              |
|SbfI-HF restriction enzyme (20 000 U/ml)|NEB               |R3642          |supplied with CutSmart buffer |
|dNTP mix (25 mM each)                   |any               |               |                              |
|GTP (100 mM)                            |Life Technologies | R1461         |                              |
|NEBuffer 4 (10x)                        |NEB               | B7004S        |                              |
|ThermoPol reaction buffer (10x)         |NEB               | B9005S        |                              |
|Denhardt’s solution  (50x)              |Life Technologies | 750018        |                              |
|Biotin Nick Translation Mix             |Life Technologies | 11745824910   |                              |
|Dynabeads® M-280 Streptavidin           |Life Technologies | 11205D, M-270 |                              |
|SSC Buffer Concentrate (20x)            |Life Technologies | 00-8400       |                              |
|Agencourt AMPure XP                     |Beckman Coulter   | A63881        |possible to use cheaper alternative, see Appendix|

Solutions to prepare:

- 10 mM Tris-HCl pH 8.5 or PCR-grade water
- EDTA 500 mM
- SDS 10%
- TEN (10 mM Tris-HCl pH 7.5, 1 mM EDTA, 1M NaCl)
- 1x SSC / 0.1% SDS
- 0.5x SSC / 0.1% SDS
- 0.1x SSC / 0.1% SDS

### 1.3 Oligonucleotides needed

Before starting, prepare oligonucleotide working solutions and anneal adapters. Keep frozen until use.

Symbols used:

- x = barcode sequence in the adaptors; these barcode sequences can be designed using published scripts [(Meyer & Kircher 2010)](https://bioinf.eva.mpg.de/multiplex/)
- I = inosine in the region complementary to the barcode in blocking oligonucleotides sequences.

#### RAD P1 adaptors, SbfI-compatible (RAD-P1)

|name     |sequence                                       |
|---------|-----------------------------------------------|
|RAD-P1.1 | ACACTCTTTCCCTACACGACGCTCTTCCGATCTxxxxxxCCTGCA |
|RAD-P1.2 | GGxxxxxxAGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT     |

The adapters above are compatible with SbfI restriction enzyme overhang. The overhang is followed by 6-bp long barcode sequence, so each pair of the oligos that will be annealed together should have reverse-complementary barcode region. These barcode sequences can be designed using published scripts [(Meyer & Kircher 2010)](https://bioinf.eva.mpg.de/multiplex/). To prepare 10 μM working solution, mix 10 μL of the RAD-P1.1 and RAD-P1.2 oligos (100 μM stock) with 80 μL of water to obtain 100 μL of working solution. Adapters have to be annealed as follows: heat to 95°C for 1 minute and slowly bring to 20°C with a ramp of 0.1°C/s.

#### RAD P2 adaptor, MseI-compatible (RAD-P2)

|name     |sequence                                       |
|---------|-----------------------------------------------|
|RAD-P2.1 | GTGACTGGAGTTCAGACGTGTGCTCTTCCGATCT            |
|RAD-P2.2 | TAAGATCGGAAGAGCGAGAACAA                       |

The adapters above are compatible with MseI restriction enzyme overhang. These are not barcoded, and thus one universal RAD-P2 adapter is used for all the probes. To prepare 10 μM working solution, mix 100 μL of the RAD-P2.1 and RAD-P2.2 oligos (100 μM stock) with 800 μL of water to obtain 1000 μL of working solution. Adapter has to be annealed as follows: heat to 95°C for 1 minute and bring to 20°C with a ramp of 0.1°C/s.

#### Shotgun library P1 adaptors

|name     |sequence                                       |
|---------|-----------------------------------------------|
|P1.1     | ACACTCTTTCCCTACACGACGCTCTTCCGATCTxxxxxx       |
|P1.2     | xxxxxxAGATCGGAAGAGC                           |

These adapters are barcoded in a similar way as RAD-P1 adapters. Prepare 25 μM working solution to as many PCR wells as P1 barcoded adapters are needed. Mix 25 μl of each oligo from the pair (100 μM stock) with 50 μL of water to obtain 100 μL working solution. Adapters have to be annealed as follows: heat to 95°C for 1 minute and bring to 20°C with a ramp of 0.1°C/s. Keep them organized in  PCR strips with individually capped tubes for convenient usage. Make sure not to cross-contaminate the barcoded adapters when pipetting.

#### Shotgun library P2 oligonucleotide P2

|name     |sequence                                       |
|---------|-----------------------------------------------|
|P2-CCCCC | GTGACTGGAGTTCAGACGTGTGCTCTTCCGATCTCCCCC       |

From 100 μM stock, prepare aliquots of P2-CCCC at 15 μM.

#### PCR primers

|name        |sequence                                               |
|------------|-------------------------------------------------------|
|ILLPCR1     | AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTT   |
|ILLPCR2\_01 | CAAGCAGAAGACGGCATACGAGATCGTGATGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_02 | CAAGCAGAAGACGGCATACGAGATACATCGGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_03 | CAAGCAGAAGACGGCATACGAGATGCCTAAGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_04 | CAAGCAGAAGACGGCATACGAGATTGGTCAGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_05 | CAAGCAGAAGACGGCATACGAGATCACTGTGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_06 | CAAGCAGAAGACGGCATACGAGATATTGGCGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_07 | CAAGCAGAAGACGGCATACGAGATGATCTGGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_08 | CAAGCAGAAGACGGCATACGAGATTCAAGTGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_09 | CAAGCAGAAGACGGCATACGAGATCTGATCGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_10 | CAAGCAGAAGACGGCATACGAGATAAGCTAGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_11 | CAAGCAGAAGACGGCATACGAGATGTAGCCGTGACTGGAGTTCAGACGTGTGC |
|ILLPCR2\_12 | CAAGCAGAAGACGGCATACGAGATTACAAGGTGACTGGAGTTCAGACGTGTGC |

Primer working solutions consist of a mix of ILLPCR1 (1 unique primer) and one of ILLPCR2\_(1-12) barcoded primers. As the procedure is based on a double-indexing approach, each series of P2 adaptor-barcoded librairies has to be enriched using a different indexing primer mix during the PCR step.

Each primer mix consists of universal forward and indexing reverse primer, each at 5 μM. To prepare it, mix 50 μl of the 100 μM stock ILLPCR1 and ILLPCR2\_(1-12) oligos with 900 μl of water to obtain 1000 μl of a working solution.
			
Primer choice:		
You first have to choose how many P1 adaptors and indexes you will combine for the double indexing. For instance, when working with 32 samples, use 16 P1 adaptors and 2 different indexing primers. Keep in mind that all samples in one hybridization-capture pool should have the same index, but different barcodes (this way they can be amplified using the same indexing primer during the final PCR -library enrichement- but recognized thanks to the unique barcode). In the above example with 32 samples, 2 captures would have to be performed.		
Second, as recommended in Illumina sequencing procedure, P1 adaptors and indexes should be choosn in order to keep the base balance between barcodes (see [Illumina pooling guidelines](http://support.illumina.com/content/dam/illumina-support/documents/documentation/chemistry_documentation/samplepreps_truseq/truseqsampleprep/truseq-library-prep-pooling-guide-15042173-01.pdf) for the indexed primers and the [available scripts for barcode selection](https://bioinf.eva.mpg.de/multiplex/)).

#### Blocking oligonucleotides

|name       |sequence                                                          |
|-----------|------------------------------------------------------------------|
| BO1.P5.F  | AATGATACGGCGACCACCGAGATCTACACTCTTTCCCTACACGACGCTCTTCCGATCT       |
| BO2.P5.R  | AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT       |
| BO3.P7.F  | CAAGCAGAAGACGGCATACGAGATIIIIIIGTGACTGGAGTTCAGACGTGTGCTCTTCCGATCT |
| BO4.P7.R  | AGATCGGAAGAGCACACGTCTGAACTCCAGTCACIIIIIIATCTCGTATGCCGTCTTCTGCTTG |

Keep these as 100 μM solutions.

## 2 Preparation of RAD probes

Probes were prepared using double-digestion RAD approach (Peterson et al. 2012; Mastretta-Yanes et al. 2014; A. Brelsford, personal communication), with further modifications.

**Literature:**

Mastretta-Yanes A, Arrigo N, Alvarez N, Jorgensen TH, Piñero D, Emerson BC (2015) Restriction site-associated DNA sequencing, genotyping error estimation and de novo assembly optimization for population genetic inference. Molecular Ecology Resources 15(1): 28–41. doi:10.1111/1755-0998.12291

Peterson BK, Weber JN, Kay EH, Fisher HS, Hoekstra HE (2012) Double Digest RADseq: An Inexpensive Method for De Novo SNP Discovery and Genotyping in Model and Non-Model Species. PLoS ONE 7(5): e37135. doi:10.1371/journal.pone.0037135

### 2.1 Restriction digestion

Choose three fresh samples coming from different populations populations (if possible spanning the entire range of interest). The DNA samples should be diluted to equimolar ratios, and should ideally be at a concentration of 20-50 ng/μl.

Prepare master mix A1:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 1.9         |
| CutSmart buffer (10x)                  | 0.9         |
| MseI (10,000 U/ml)                     | 0.1         |
| SbfI-HF (20,000 U/ml)                  | 0.1         |

Mix 6 μl of DNA with 3 μl of master mix A1 (total volume = 10 μl).

Incubate 3 hours at 37°C, hold at 4°C.

Perform AMPure cleanup with the beads:sample ratio 2:1 according to the manufacturer's instructions (see appendix). Elute in 10 μl of 10 mM Tris or water.

### 2.2 Adapter ligation

Prepare barcoded RAD-P1 adapters (see chapter 1.3). Each sample should be mixed with a different adapter!

Prepare master mix A2:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 5.0         |
| T4 ligase buffer                       | 1.0         |
| T4 DNA ligase (400 U/μl)               | 1.0         |
| RAD-P2 adaptor (10 μM)                 | 2.0         |

Mix 20 μl of digested DNA with 1 μl of P1-RAD barcoded adapter and 9 μl of master mix A2.

Incubate 3 hours at 16°C, heat-inactivate the enzyme for 10 min at 65°C, hold at 4°C.

Pool the ligation products together. Perform AMPure cleanup with the beads:sample ratio 1:1 according to the manufacturer's instructions. Resuspend in 30 μl of 10 mM Tris or water.

### 2.3 Size selection

Perform Pippin Prep size selection at 270 bp peak ("narrow peak" settings) according to the instructions. You obtain 40 μl of the size selected sample. Measure concentration and check the profile of the sample using Fragment Analyzer/Tapestation/Bioanalyzer. It is also possible to size-select the product using agarose gel extraction.

### 2.4 PCR amplification

Prepare indexed primer solutions (see chapter 1.3).

Perform PCR reaction in as many replicates as possible, given the available template.

Prepare master mix A3:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 3.62        |
| Q5 polymerase buffer (5x)              | 2.0         |
| dNTP mix (25 mM each)                  | 0.08        |
| RAD primer mix (5 μM each)             | 1.2         | 
| Q5 hot-start polymerase                | 0.1         |

Mix 3 μl of the size selected ligation product with 7 μl of master mix A3.

PCR program: initial denaturation 30 s at 98°C; 30 cycles of 10 s denaturation at 98°C and 20 s annealing at 60°C, 25 s elongation at 72°C; 180 s elongation at 72°C; hold at 4°C.

Pool the PCR products. Perform AMPure cleanup with the beads:sample ratio 1:1 according to the manufacturer's instructions. Elute in 30 μl plus small volume for library quantification (1 μl) and volume for the sequencing if you do so (see below).

Quantify the library concentration using Qubit. You should calculate around 500-1000 ng of RAD library per capture. If not enough of probes is obtained, the PCR product can be re-amplified.

At this stage an aliquot of RAD library can be saved for Illumina sequencing. Although not neccesary, this might help with the assembly of captured shotgun libraries.

### 2.5 Adapter removal

Prepare mix A4:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 13.25       |
| CutSmart buffer (10x)                  | 5.0         |
| MseI (10,000 U/ml)                     | 0.5         |
| SbfI-HF (20,000 U/ml)                  | 1.25        |

Mix 20 μl of the mix A4 with 30 μl of the pooled and purified RAD library.

Incubate for 3 hours at 37°C.

Purify using AMPure, with the beads:sample ratio 1.5:1 according to the manufacturer's instructions in order to remove the digested adapters. Resuspend in 20 μl of 10 mM Tris or water, plus an aliquot for quality check on agarose gel or Fragment Analyzer/Tapestation/Bioanalyzer. Verify that no digested adaptors are left after the purification.

### 2.6 Biotinylation of the probes

In this step Biotin Nick Translation Mix (Life Technologies) is used.


Prepare the mix A5:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 15.0        |
| dNTP mix (10x)                         | 5.0         |
| enzyme mix                             | 5.0         |

Mix 20 μl of the probes with 25 μl of the A5 mix.

Incubate for 2 hours at 16°C.

Purify using AMPure, with the beads:sample ratio 1.5:1 according to the manufacturer's instructions in order to remove the digested adapters. Resuspend in 10 mM Tris or water. Volume needed depends on the number of captures. Calculate 10 μl per capture plus an aliquot for checking the probes concentration using Qubit.

Biotinylated probes can be stored at -20°C in 10 mM Tris for at least one year.

## 3. Preparation of whole genome libraries from museum specimens

Shotgun libraries are prepared from the fresh and museum specimens based on a published protocol for degraded DNA samples (Tin et al. 2014), modified in order to incorporate adapter design of Meyer & Kircher (2010). Start with 8 μl of extracted DNA, always include a blank (no DNA, just buffer) sample in parallel to the normal samples.

NB: Alternatively, you may follow the standard Tin et al. (2014) protocol or any other library preparation protocol (including commercial kits) to prepare libraries for the capture.

**Literature:**

Meyer M, Kircher M (2010) Illumina sequencing library preparation for highly multiplexed target capture and sequencing. Cold Spring Harb Protoc 2010(6): t5448. doi:10.1101/pdb.prot5448

Tin MM-Y, Economo EP, Mikheyev AS (2014) Sequencing Degraded DNA from Non-Destructively Sampled Museum Specimens for RAD-Tagging and Low-Coverage Shotgun Phylogenetics. PLoS ONE 9(5): e96793. doi:10.1371/journal.pone.0096793


### 3.1 Phosphorylation

Prepare master mix B1:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| T4 PNK (10U/μl)                        | 1.0         |
| T4 ligase buffer                       | 1.0         |

Denature 8 μl of DNA by incubating for 5 min at 95°C and quickly chilling on ice. Add 2 μl of master mix B1 (total volume = 10 μl).

Incubate for 30 min at 37°C, heat-kill the enzymes for 20 at 65°C.

Perform AMPure cleanup with the beads:sample ratio 2:1 according to the manufacturer's instructions. Resuspend in 10 μl of 10 mM Tris or water.

### 3.2 Guanidine tailing

Prepare master mix B2 (assemble at room temperature, can precipitate when on ice):

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 4.7         |
| NEBuffer 4 (10x)                       | 2.0         |
| CoCl<sub>2</sub> (2.5 mM)              | 2.0         |
| GTP (100 mM)                           | 0.8         |
| TdT (20 U/μl)                          | 0.5         |


Denature DNA by incubating for 5 min at 95°C and quickly chilling on ice. Add 10 μl of the B2 mix to the DNA (total volume = 20 μl).

Incubate for 30 min at 37°C, heat-kill the enzymes for 10 min at 70°C.

### 3.3 Second DNA strand synthesis

Prepare master mix B3:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 5.4         |
| NEBuffer 4 (10x)                       | 1.0         |
| dNTP mix (25 mM each)                  | 0.6         |
| P2-CCCCC oligo (15 mM)                 | 1.0         |
| Klenow fragment (3'->5' exo-) (5 U/μl) | 2.0         |

Add 10 μl of the master mix B3 to 20 μl of the DNA (total volume = 30 μl).

Incubate at room temperature for 3 hours, heat-kill enzymes for 20 min at 75°C, hold at 4°C.

### 3.4 Blunt-end reaction

Prepare master mix B4:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 3.95        |
| NEBuffer 4 (10x)                       | 0.5         |
| BSA (10 mg/μl)                         | 0.35        |
| T4 DNA polymerase (3 U/μl)             | 0.2         |

Add 5 μl of the master mix B4 to 30 μl of the DNA (total volume = 35 μl). Keep on ice when assembling the reaction.

Incubate for 15 min at 12°C.

Perform AMPure cleanup with the beads:sample ratio 2:1 according to the manufacturer's instructions. Resuspend in 10 μl of 10 mM Tris or water.

### 3.5 Ligation of P1 adapters

Prepare barcoded P1 adapters (see chapter 1.3). Each sample should be mixed with a different adapter!

Prepare master mix B5:

| reagent                                | volume [μl] |
| -------------------------------------- | ----------- |
| water                                  | 6.0         |
| T4 ligase buffer (10x)                 | 2.0         |
| T4 DNA ligase (400 U/μl)               | 1.0         |

Add 1 μl of the barcoded adapter to 10 μl of the DNA. Add 9 μl of the B5 mix to each sample (total volume = 20 μl).

Incubate at 16°C overnight.

Perform AMPure cleanup with the beads:sample ratio 1:1 according to the manufacturer's instructions. Resuspend in 10 μl of 10 mM Tris or water.

### 3.6 Adapter fill-in

Prepare master mix B6:

| reagent                                 | volume [μl] |
| --------------------------------------- | ----------- |
| water                                   | 7.05        |
| ThermoPol reaction buffer (10x)         | 2.0         |
| dNTP mix (25 μM each)                   | 0.2         |
| BST polymerase, large fragment (8 U/μl) | 0.75        |

Add 10 μl of the master mix B6 to 10 μl of the DNA (total volume = 10 μl).

Incubate for 20 min at 37°C.

Perform AMPure cleanup with the beads:sample ratio 2:1 according to the manufacturer's instructions. Resuspend in 20 μl of 10 mM Tris or water (or more, depending on the number of PCR replicates in the next step).

### 3.7 PCR amplification

Prepare indexed primer solutions (see chapter 1.3).

Perform each PCR reaction in at least two replicates to account for the stochasticity of fragment amplification.

Prepare master mix B7:

| reagent                                 | volume [μl] |
| --------------------------------------- | ----------- |
| water                                   | 7.05        |
| Q5 polymerase buffer (5x)               | 5.0         |
| dNTP mix (25 mM each)                   | 0.2         |
| Indexing primer mix (5 μM each)         | 2.5         |
| Q5 hot-start DNA polymerase (2 U/μl)    | 0.25        |

Add 15 μl of the master mix B7 to 10 μl of the template (total volume = 25 μl).

PCR program: denaturation 30 s at 98°C; 25 cycles of 10 s denaturation at 98°C, 20 s annealing at 60°C and 25 s elongation at 72°C; 180 s elongation at 72°C; hold at 4°C.

Optional: verify individual sample profiles using gel electorphoresis.

Pool the samples amplified using the same indexed primer together. If the variation in amplification success is large, estimate concentrations and pool the samples in equimolar ratios. This can be done using some gel documentation systems or Fragment Analyzer/Tapestation/Bioanalyzer. Alternatively, concentrations can be measured using Qubit/Picogreen but the samples have to be purified using AMPure beads before quantification (in order to remove primer-dimers).

After pooling, perform AMPure cleanup in order to remove primer-dimers, with the beads:sample ratio 0.7:1 according to the manufacturer's instructions. Resuspend in 15 μl of 10 mM Tris or water.

Verify the probes profile and proper primer-dimer removal using gel electrophoresis, or Fragent Analyzer/Tapestation.

## 4 Hybridization capture and library re-amplification

The hybridization capture and library enrichment steps described below are based on [previously published protocols](http://openwetware.org/wiki/Hyb_Seq_Prep) with some modifications.

### 4.1 Hybridization capture

Test the tubes and caps used for evaporation before starting by filling with known amount of water and keeping at 65°C for 48 hours.

Remember to perform one capture per pool of the libraries amplified with the same Illumina indexed primer.

Prepare the hybridization mix. Probes and blocking oligos are used in excess. So far, we used 500-1000 ng of the Illumina library and the same amount of the probes.

| reagent                        | volume [μl] |
| ------------------------------ | ----------- |
| water                          | 4.0         |
| SSC (20x)                      | 12.0        |
| EDTA (500 mM)                  | 0.4         |
| SDS (10%)                      | 0.4         |
| Denhardt’s solution (50x)      | 1.6         |
| BO.1 blocking oligo (200 μM)   | 0.4         |
| BO.2 blocking oligo (200 μM)   | 0.4         |
| BO.3 blocking oligo (200 μM)   | 0.4         |
| BO.4 blocking oligo (200 μM)   | 0.4         |
| prepared Illumina library      | 14.0        |
| probes                         | 10.0        |

Incubate at 95°C for 10 minutes, then at 65°C for 48 hours. Mix from time to time. The best is to use rotor in the hybridization oven, but it is also possible to use a standard PCR machine.

### 4.2 Preparation of Dynabeads

1. Resuspend well Dynabeads M-280 (10 mg/ml).
2. Dispense 10 μl of beads in a PCR tube.
3. Wash:
    - magnetize, remove and discard supernatant,
    - resuspend in 200 μl of TEN.

4. Perform previous step 3 times in total.
5. Store in 200 μl of TEN at room temperature until use.
					
NB: If more captures are expected, increase the initial amount of beads accordingly, transfer the final resupension into an eppendorf tube and add the appropriate volume of TEN (10 μl of beads should be resuspended in 200 μl of TEN).
					
### 4.3 Washes

1. Add 40 μl of the hybridization mixture to 200ul of Dynabeads	
Mix, incubate 30 min at room temperature.	
	
2. Put on the magnet; remove supernatant (= wash 1).	
Resuspend beads in 200 μl of 65°C 1x SSC / 0.1% SDS. Mix well.	
Mix, incubate for 15 min, 65°C.	
	
3. Put on the magnet; remove supernatant  (= wash 2).	
Replace with 200 μl of 65°C 1x SSC / 0.1% SDS. Mix well.	
Mix, incubate for 10 min, 65°C.	
	
4. Put on the magnet; remove supernatant (= wash 3).	
Replace with 200 μl of 0.5x SSC / 0.1% SDS. Mix well.	
Mix, incubate for 10 min, 65°C.	
	
5. Put on the magnet; remove supernatant (= wash 4).	
Replace with 200 μl of 0.1x SSC / 0.1% SDS	
Mix, incubate for 10 min, 65°C.	
	
6. Put on the magnet; remove supernatant (= wash 5).	
Add 30 μl of 80°C water. Mix well	
Mix, incubate for 10 min, 80°C.
	
7. Put on the magnet; remove and RETAIN supernatant.	
This supernatant contains the hybridization-enriched products!	

8. Discard the beads.						

NB: You can keep supernatant after washes 1-5 in case of DNA loss. 

### 4.4 Library re-amplification

Prepare re-amplification master mix. The volumes are per captured library:

| reagent                                 | volume [μl] |
| --------------------------------------- | ----------- |
| water                                   | 19.1        |
| Q5 polymerase buffer (5x)               | 10.0        |
| dNTP mix (25 mM each)                   | 0.4         |
| Q5 hot-start DNA polymerase (2 U/μl)    | 0.5         |

Mix 30 μl of the master mix with 5 μl of indexing primer mix (use the same index as used in the indexing PCR of historical library preparation, see chapter 3.7) and 15 μl of the captured libraries.

PCR program: denaturate 30 s at 98°C; 15 cycles of 10 s denaturation at 98°C, 20 s annealing at 60°C and 25 s elongation at 72°C; 180 s elongation at 72°C; hold at 4°C.

Purify with AMPure using beads:sample ratio 1:1, elute in 30 μl of 10 mM Tris or water.

Verify the profile and molarity using Fragment Analyzer/Tapestation/Bioanalyzer. Libraries can now be pooled in equimolar ratios.

Your libraries are now ready to be sent for sequencing, congratulations!

## 5 Appendix

### 5.1 AMPure purification

It is possible to use "homemade" substitute of AMPure for significant savings. Preparation protocols can be found online:
[Faircloth & Glenn 2011](http://openwetware.org/images/1/17/Serapure_bead_recipe.pdf), [Jolivet & Foley 2015](http://openwetware.org/images/f/f8/SPRI_buffers_v2_2.pdf).

Other reagents and tools needed:

- freshly prepared 70% ethanol,
- 10 mM Tris-HCl pH 8.5 or PCR-grad water for elution,
- magnetic rack for PCR plates (or for 1.5 ml tubes if working on pooled samples).

The purification protocol:

1. Remove beads from the fridge, equilibrate to the room temperature, mix thoroughly by vortexing.
2. Add desired ratio of AMPure beads to the purified sample and mix well by pipetting.
3. Incubate 5 minutes.
4. Place on the magnetic rack.
5. Let it stand for 5 minutes on the rack, aspirate and discard supernatant.
6. Add 200 μl of freshly prepared 70% EtOH, incubate 30 seconds, aspirate and discard EtOH.
7. Repeat the wash, aspirate and discard EtOH.
8. Wait until it dries out completely.
9. Add desired volume of Tris 10 mM or water (add 1 μl to the final volume to avoid pipetting out the beads), remove from rack.
10. Resuspend by pipetting or vortexing.
11. Incubate 5 minutes.
12. Place on the rack.
13. Let it stand for 5 minutes, pippete out and save supernatant. The eluted DNA is in the supernatant, do not discard it!
