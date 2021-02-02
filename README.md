# Scripts for manual and automatic sleep scoring

## Manual scoring files:
1. sleep_scorer_andres.m
2. TheStateEditor.m
3. manualScoringSpikegadget.m

1-2) Written by Dr. Andres Grosmark. 3) Written by PhD candidate Abdel Rayan.

## Automatic scoring:
1. PCA_sleep_scorer.m
Currently only scores NREM and REM. Initially designed for anaesthesia signals by Tugdual Adam.
Written for OpenEphys .continuous files. Should be adapted to SpikeGadgets format.

# Manual scoring SpikeGadget:
1. To use the manual scoring for SpikeGadger data please make sure that you have the following toolboxes added to your MATLAB directory; Trodes_1-9-1_Windows10 and TrodesToMatlab6-30-2017. You can find the both toolboxes in under the following link https://bitbucket.org/mkarlsso/trodes/downloads/ 
2. To extract the binary files please use the modified extractLFPBinaryFilesAbdel, this will make sure that the data is not downsampled. 
