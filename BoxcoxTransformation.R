###########################
########## Manually lambda selection
#ind=which((p.IL17<=0),arr.ind=T)
#y=p.IL17[-ind[,1],]
p.IL17_zt=p.IL17
y=replace(p.IL17_zt, p.IL17_zt==0, 0.0001)


########## Geometric mean
gm_mean = function(y, na.rm=TRUE){
  exp(sum(log(y[y > 0]), na.rm=na.rm) / length(y))}

########## Boxcox transformation
f=function(y,lambda){
  if(lambda!=0){y_prime=(y^lambda-1)/(lambda*gm_mean(y))}
  if(lambda==0){y_prime=log(y)*(gm_mean(y))^(lambda-1)}
  return(y_prime)}

lambda=seq(-2,2,.1)
n=length(lambda)
ssRes=vector(mode="numeric", length=n)

########## Model fitting
for (i in 1:n){
  y_prime=f(y,lambda[i])
  #fit.w=lm(y_prime~geno.mat[-c(87,261),9])
  fit.w=lm(y_prime~geno.mat[,9])
  ssRes[i]=anova(fit.w)["Residuals", "Sum Sq"]}
ssRes

########## lambda for minimum residual
plot(lambda,ssRes, xlim=c(-3,3),ylim=c(-10,max(ssRes)),lty=2, main="Trancated Data")
data=cbind.data.frame(lambda,ssRes)
data= data[order(ssRes),] 
data$lambda[1]
head(data)
########## Boxcox transformation
library(MASS)

n=length(y)
bc_lambda=vector(mode="numeric", length=n)
for (i in 1:n){
  #bc=boxcox(lm(y~geno.mat[,i]))
  bc=boxcox(lm(y~geno.mat[-ind[,1],i]))
  bc_lambda[i]=bc$x[which(bc$y==max(bc$y))]}

lambda=unique(bc_lambda)
lambda=-0.1010101
fit=vector(mode="numeric", length=n)

fit=lm(y~geno.mat[,9])
fit_t=lm(log(y)~geno.mat[,9])
fit_ln=lm(log(y[c(-87,-261),])~geno.mat[c(-87,-261),9])

par(mfrow=c(1,3))
plot(fit, which=2, main="Protein data")
plot(fit_t, which=2, main="log_trancated")
plot(fit_ln, which=2, main="log tranformed")
par(mfrow=c(1,1))



