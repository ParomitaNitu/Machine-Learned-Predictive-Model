########## Protein Data
library(readxl)
proteinData=read_excel("C:/Users/Paromita/Desktop/Research with Dr. Maadooliat/Large Data/Protein_data/1000_GWASset_cytokine_concentrations_BSA.xlsx")
names(proteinData)

########## Protein Data: IL-17A BSA-adj calc pg/mL
protein.IL17=proteinData$`IL-17A BSA-adj calc pg/mL`
Seq_ID= proteinData$`Seq ID Imported`
data.work=data.frame(Seq_ID,protein.IL17,sample.id)

########## Search for snp.id wise matching samples:
data.work$p.IL17=data.work$protein.IL17[match(data.work$sample.id,data.work$Seq_ID)]
p.IL17=as.matrix(data.work$p.IL17)

########## Check for mathching protien 
data.work$p.IL17[1:10]
data.work$protein.IL17[data.work$Seq_ID %in% data.work$sample.id[1:10]]

