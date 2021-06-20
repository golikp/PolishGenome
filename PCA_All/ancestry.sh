#!/bin/bash
#Inspired by https://meyer-lab-cshl.github.io/plinkQC/articles/AncestryCheck.html

refdir='./reference'
qcdir='./study'
#1000genomes samples from the combined dataset
refname='1KG'
#our samples from the combined dataset
name='study'

#Find the appropriate high LD file in the directory given by file.path(find.package('plinkQC'),'extdata','high-LD-regions.txt') in R and copy to $refdir
#plinkQC has to be installed in R

highld='high-LD-regions-hg38-GRCh38.txt'

#LD prune
plink --bfile  $qcdir/$name --exclude range  $refdir/$highld --indep-pairwise 50 5 0.2 --out $qcdir/$name
plink --bfile $qcdir/$name --extract $qcdir/$name.prune.in --make-bed --out $qcdir/$name.pruned

#Filter 1000genomes reference to use LD pruned SNPs
plink --bfile  $refdir/$refname --extract $qcdir/$name.prune.in --make-bed --out $refdir/$refname.pruned 

#merge filtered
plink --bfile $qcdir/$name.pruned --bmerge $refdir/$refname.pruned.bed $refdir/$refname.pruned.bim $refdir/$refname.pruned.fam --make-bed --out $qcdir/$name.merge.$refname 

#PCA
plink --bfile $qcdir/$name.merge.$refname --pca --out $qcdir/$name.$refname
