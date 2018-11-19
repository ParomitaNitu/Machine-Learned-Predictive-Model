########## Function to extract p values
lmp=function (modelobject) {
  f=summary(modelobject)$fstatistic
  #pf:probability distribution of F (vector of quantiles,df1, df2)
  p=pf(f[1],f[2],f[3],lower.tail=F)
  return(p)}

ind=which((p.IL17<=0),arr.ind=T)
p.IL17_t=p.IL17[-ind[,1],]

########## Simple Linear Regression
n=length(snp.id)
p.values.n=vector(mode="numeric", length=n)
for (i in 1:n){
  fit.n=lm(p.IL17~(geno.mat[,i]))
  p.values.n[i]=lmp(fit.n)}
  #fit.nt=lm(log(p.IL17_t)~(geno.mat[-ind[,1],i]))
  #p.values.nt[i]=lmp(fit.nt)}
  
  ########## FACTOR design
  #fit.f=lm(p.IL17~as.factor(geno.mat[,i]))
  #p.values.f[i]=lmp(fit.f)}
  #fit.ft=lm(log(p.IL17_t)~as.factor(geno.mat[-ind[,1],i]))
  #p.values.ft[i]=lmp(fit.ft)}

p.values.n=data.frame(snp.rs.id,p.values.n)
write.table( p.values.n,file = "C:/Users/Paromita/Desktop/Marquette University/myBio/Data_p.values/pvalue.numeric.txt", sep = "\t",row.names = FALSE)




