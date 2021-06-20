# Ancestry control by PCA
The combined dataset was divided into the samples from present study (./study), and the 1000genomes samples (in ./reference). <br>
The file containing regions of high linkage disequilibrium come from the [plinkQC](https://meyer-lab-cshl.github.io/plinkQC/articles/AncestryCheck.html) R package.<br>This kept *587247* of the original *1399489* SNP variants.
The Genomes1000_PopColors.txt file was edited as a local copy to give more readable color palette.<br>
The analysis steps can be found in *ancestry.sh*, R code for plotting is in *ancestry.R*.<br>
The results look like this:
![PCA plot](https://github.com/golikp/PolishGenome/blob/main/PCA_All/ancestry_1000G.jpg)<p>
Similar clustering performed with all the *1399489* SNP variants gives essentially the same result:
![PCA plot](https://github.com/golikp/PolishGenome/blob/main/PCA_All/ancestry_1000G_unpruned.jpg)<p>  
