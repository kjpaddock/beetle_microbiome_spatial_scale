# Functions for microbial ecology

library("phyloseq")
library("microbiome")
library("vegan")
library("tidyverse")
library("ggplot2")
library("plotrix")
library("iNEXT")
library("purrr")
library("EcolUtils")


nonbact_filter <- function(phylo_data) {
bdf <- subset_taxa(phylo_data, (Order!="Chloroplast") | is.na(Order)) # 48 taxa
bdf2 <- subset_taxa(bdf, (Family!="Mitochondria") | is.na(Family)) # 41 taxa
bdf3 <- subset_taxa(bdf2, (Kingdom != "Archaea") | is.na(Kingdom)) # 23 taxa
bdf4 <- subset_taxa(bdf3, !is.na(Phylum)) # 34 taxa
}

prevalence_table <- function(phylo_data) {
  prevalence_table_sample = apply(X = otu_table(phylo_data),
                                MARGIN = 1,
                                FUN = function(x){sum(x > 0)})
  
  prevalence_table_sample2 = data.frame(Prevalence = prevalence_table_sample,
                                     TotalAbundance = taxa_sums(phylo_data),
                                     tax_table(phylo_data))
  
  prevalence_table_sample2_sort <- prevalence_table_sample2 %>% arrange(desc(Prevalence))
  
  return(prevalence_table_sample2_sort)
}



low_read_filter <- function(phylo_data, prev_table, read_depth){
  
  filter_otus <- prev_table%>% 
    filter(TotalAbundance > read_depth) %>%
    dplyr::select(OTU)
  filter_otus <- as.vector(filter_otus[,1])
  
  data2 <- prune_taxa(filter_otus, phylo_data)
  
  return(data2)
}

