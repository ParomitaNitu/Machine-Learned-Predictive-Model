
p.values=read.table("C:/Users/Paromita/Desktop/myBioStat/HWEData_p.values/HWEpvalue.numeric.txt", sep = "\t",header=T)
p.values=p.values$pvalue.numeric
data.p=data.frame(snp.rs.id,snp.chromosome,snp.position,p.values)

data.numeric= data.p[order(p.values),]
data.factor= data.p[order(p.values),]
###########################
### Common SNPs
snp.common=intersect(data.factor$snp.rs.id[1:100],data.numeric$snp.rs.id[1:100] )
p.values_factor= data.factor$p.values[data.factor$snp.rs.id %in% snp.common]
p.values_numeric= data.numeric$p.values[data.numeric$snp.rs.id %in% snp.common]
data.common=data.frame(snp.common,p.values_factor,p.values_numeric)

write.table(data.common, file = "C:/Users/Paromita/Desktop/Research with Dr. Maadooliat/Results_Plots & tables/Autosome_data/common.SNPs_Autosome_data.txt", sep = "\t",row.names = FALSE,col.names = T)

###########################
### Visual representation: SNPs with extreme p values
data_track=data.factor[1:16,]
truck_snp_pvalue=data_track$p.values
truck_snp.rs.id=data_track$snp.rs.id
truck_geno=geno.mat[,truck_snp.rs.id]

###########################
### Visual representation: SNPs with extreme p values
par(mfrow=c(4,4))
for (i in 1:dim(data_track)[1]){ 
  t2p_truck_snp=table(truck_geno[,i])
  barplot(t2p_truck_snp,xlab=c("p_value:",truck_snp_pvalue[i]),main =truck_snp.rs.id[i])}
par(mfrow=c(1,1))
