# beetle_microbiome_spatial_scale
Data and code for manuscript "Determinants of microbiome composition vary across spatial scales in a specialist insect"


# Data
Data is designed to be read directly into corresponding code published here. As such, they are all in .csv format. To build a working phyloseq objec to be used in both of the R Markdowns (rmd), users will use the ASV_table, meta_data_table, and taxonomy_tables at the beginning of each script. Downstream analysis will be done from there. The only other data sets required for analyses are distance matrices to perform mantel tests in the code focused on environmental effects on microbiome composition. 

# Code
The rmd files contain analyses for each of the questions posed in the publication. First we ask how does species identity affect microbiome composition. Secondly, we ask how the location insects are collected from influence microbiome composition. The code is divided as such. To ensure proper package loading and use of developer produced package, make sure to also source the code entitled 'Microbe_functions'. 