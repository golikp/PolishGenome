library(plinkQC)
extdir <- system.file("extdata", package="plinkQC")
name <- 'study'
refname <- '1KG'
qcdir <- './study'
prefixMergedDataset <- paste(name, ".", refname, sep="")
pdf("ancestry_1000G.pdf")
exclude_ancestry <-
    evaluate_check_ancestry(indir=qcdir, name=name,
                            prefixMergedDataset=prefixMergedDataset,
                            refSamplesFile=paste(extdir, "/Genomes1000_ID2Pop.txt",
                                                 sep=""), 
                            refColorsFile=("Genomes1000_PopColors.txt"),
                            interactive=TRUE)
dev.off()
