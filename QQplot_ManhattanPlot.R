########## Upload p.values Data
p.values=read.table("C:/Users/Paromita/Desktop/myBioStat/Data_p.values/pvalue.numeric.txt", sep = "\t",header=T)
p.values=p.values$pvalue.numeric
data.p=data.frame(snp.rs.id,snp.chromosome,snp.position,p.values)

data.numeric= data.p[order(p.values),]

########## QQ-plot & Manhattan plot 
install.packages("qqman")
library(qqman)

########## QQ Plot
qq(data.p$p.values, main="QQ plot:HWE Removed Matrix (Numeric)")
qq(data.numeric$p.values, main="QQ plot:HWE Removed Matrix (Numeric)")

########## Notes:
#### Annotate name of the SNP of interest using the annotatePval:
###  SNPs below this p-value will be annotated on the plot
##   suggestiveline = -log10(1e-05), genomewideline = -log10(5e-08)
#    legend('topright', c("suggestiveline = -log10(1e-05)", "genomewideline = -log10(5e-08)") , lty=1, col=c('red', 'blue'), bty='n', cex=.75)

manhattan(data.p, chr="snp.chromosome", bp="snp.position", snp="snp.rs.id", p="p.values",
          col=c("grey", "skyblue"),annotatePval=5e-08,annotateTop = F,
          main="Manhattan plot: Autosome Genomic Matrix (Numeric)")

