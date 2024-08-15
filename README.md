# Exosomal_miRNA
This project aims to characterize the role of exosomal miRNAs in cancer metastasis.

In this study, we aimed to characterize the role of exomiRs in influencing the pre-metastatic niche (PMN) across 7 tumor types. We extracted high-confidence exomiRs (Log FC >= 2 in exosomes relative to control) and their targets (experimentally identified and targeted by at least 2 exomiRs) in 4 cancer-derived cell lines as well as directly from patient’s. Subsequently, we identified enriched pathways and selected the top 100 high-confidence exomiR targets based on the frequency of their appearance in the enriched pathways. These top 100 targets were consistently used throughout the analysis.




### Running Codes

### Creating Venn Diagram ###
Create a comma separated file to generate venn diagram. Sample input file is provided "venn_input.csv"
Code is present in the "code" folder

Code usage:

# /usr/local/bin/Rscript venn_diag.r #

### Creating Boxplot ###
Create a comma separated file to generate boxplot. Sample input file is provided "boxplot_input.csv"
Code is present in the "code" folder

Code usage:

# /usr/local/bin/Rscript boxplot.r #

### Creating Barplot ###
Create a comma separated file to generate barplot. Sample input file is provided "barplot_input.csv"
Code is present in the "code" folder

Code usage:

# /usr/local/bin/Rscript barplot.r #

### Creating DotPlot ###

Create a comma separated file to generate Dotplot. Sample input file is provided "dotplot_input.csv" and the generated output is a jpg image "Dotplot.jpg"
Code is present in the "code" folder

Code usage:

# /usr/local/bin/Rscript dotplot.r #

### Creating Enrichment Plot among GO terms ###

Clusterprofiler package was used for creating enrichment plots among GO terms. Code used is provided in the folder "code" Run the command as

# /usr/local/bin/Rscript BP_clusterprofiler.r #

Note that above code can be used to identify molecular functions. User need to change ont="BP" to ont="MF"

### Predicting Non-responder using SVM based model ###

SVM model was trained on GSE41998 dataset to predict non-responder to a given neoadjuvant chemotherapy using 21 gene signature expression as a feature. User can use this model to predict whether a patient will respond to the treatment or not (positive label classify as non-responder). Input file is provided by the name "ml_test.csv". Model is provided by the name TNBC_finalized_model.sav. All the 3 files (code, test file and model is present in the maiin directory)

# Code usage: python SVM_predict.py #
