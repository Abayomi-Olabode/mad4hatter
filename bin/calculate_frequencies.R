#!/usr/bin/env Rscript

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
alleledata <- args[1]

# Read allele data
data <- read.table(alleledata, header=TRUE, sep="\t")

# Calculate frequencies per locus
result <- aggregate(Reads ~ Locus + ASV, data=data, FUN=sum)
result$Freq <- ave(result$Reads, result$Locus, FUN=function(x) x/sum(x))

# Select required columns
result <- result[, c("Locus", "ASV", "Freq")]

# Write output
write.table(result, "allele_frequencies.tsv",
sep="\t", row.names=FALSE, quote=FALSE)
