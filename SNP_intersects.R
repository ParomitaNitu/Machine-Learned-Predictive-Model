########## Upload Data ( Traditional & Factor design)
p.values.numeric=read.table("C:/Users/Paromita/Desktop/myBioStat/HWEData_p.values/HWEpvalue.numeric.txt", sep = "\t",header=T)
p.values=p.values.numeric$pvalue.numeric
data.numeric=data.frame(snp.rs.id,snp.chromosome,snp.position,p.values)
data.numeric= data.numeric[order(p.values),]

p.values.factor=read.table("C:/Users/Paromita/Desktop/myBioStat/HWEData_p.values/HWEpvalue.factorDesign.txt", sep = "\t",header=T)
p.values=p.values.factor$pvalue.factor
data.factor=data.frame(snp.rs.id,snp.chromosome,snp.position,p.values)
data.factor= data.factor[order(p.values),]

########## Common SNPs
snp.common=intersect(data.factor$snp.rs.id[1:2500],data.numeric$snp.rs.id[1:2500] )
p.values_factor= data.factor$p.values[data.factor$snp.rs.id %in% snp.common]
p.values_numeric= data.numeric$p.values[data.numeric$snp.rs.id %in% snp.common]
SNP.Intersect=data.frame(snp.common,p.values_factor,p.values_numeric)
write.table(SNP.Intersect, file = "C:/Users/Paromita/Desktop/MyBioStat/HWEdata_SNP.intersect/SNP.Intersect(numeric2factor).txt", sep = "\t",row.names = FALSE,col.names = T)

########## Upload Data (log transformed Traditional & Factor design)
p.values.nLogT=read.table("C:/Users/Paromita/Desktop/myBioStat/HWEData_p.values/HWEpvalue.numeric.LogTransformed.txt", sep = "\t",header=T)
p.values=p.values.nLogT$pvalue.numeric
data.nLogT=data.frame(snp.rs.id,snp.chromosome,snp.position,p.values)
data.nLogT= data.nLogT[order(p.values),]

p.values.FlogT=read.table("C:/Users/Paromita/Desktop/myBioStat/HWEData_p.values/HWEpvalue.factor.LogTransformed.txt", sep = "\t",header=T)
p.values=p.values.FlogT$p.values.factor_Tranc
data.FlogT=data.frame(snp.rs.id,snp.chromosome,snp.position,p.values)
data.FlogT= data.FlogT[order(p.values),]

########## Common SNPs
snp.common.LogT=intersect(data.FlogT$snp.rs.id[1:2500],data.nLogT$snp.rs.id[1:2500] )
p.values.fLogT= data.FlogT$p.values[data.FlogT$snp.rs.id %in% snp.common.LogT]
p.values.nLogT= data.nLogT$p.values[data.nLogT$snp.rs.id %in% snp.common.LogT]
SNP.Intersect.LogT=data.frame(snp.common.LogT,p.values.fLogT,p.values.nLogT)
write.table(SNP.Intersect.LogT, file = "C:/Users/Paromita/Desktop/myBioStat/HWEdata_SNP.intersect/SNP.Intersect(LogTransformed_numeric2factor).txt", sep = "\t",row.names = FALSE,col.names = T)
