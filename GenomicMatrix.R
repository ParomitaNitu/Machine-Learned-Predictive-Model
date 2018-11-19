#########################################
########## r-memory-management
memory.limit(size=56000) 
library(gdsfmt)
library(SNPRelate)

########## Genomic Matrix 
Data_GWAS_HWE=("C:/Users/Paromita/Desktop/Research with Dr. Maadooliat/Large Data/Genomic_data/GWAS_TH17_3.gds")
genofile=snpgdsOpen(Data_GWAS_HWE, allow.duplicate = T)

geno.mat=read.gdsn(index.gdsn(genofile,"genotype"))
sample.id=read.gdsn(index.gdsn(genofile, "sample.id"))
snp.id=read.gdsn(index.gdsn(genofile, "snp.id"))
snp.rs.id=read.gdsn(index.gdsn(genofile,"snp.rs.id"))
snp.chromosome=read.gdsn(index.gdsn(genofile, "snp.chromosome"))
snp.position=read.gdsn(index.gdsn(genofile, "snp.position"))

########## Check/Look for missing values in genomic matrix
length(which(geno.mat==3))
m.ind=which((geno.mat==3), arr.ind=TRUE)

########## Replacing missing entries with NA
geno.mat[geno.mat==3]=NA
geno.mat[980:985,3]

########## Genomic matrix without NA
na.indx=unique(m.ind[,2])
geno.NA= geno.mat[,-na.indx]
snp.id.na= snp.id[-na.indx]
snp.rs.id.na=snp.rs.id[-na.indx]
snp.chromosome.na=snp.chromosome[-na.indx]
snp.position.na=snp.position[-na.indx]



