BiocManager::install("circos")
library(circos)

setwd("path/Cly.circos")
#data
db.test<-read.table("goat.circos.db.txt",header=T);head(db.test);dim(db.test)

anagen_mCG<-read.table("anagen_mCG.txt",header = F);head(anagen_mCG);dim(anagen_mCG)
anagen_mCHG<-read.table("anagen_mCHG.txt",header = F);head(anagen_mCHG);dim(anagen_mCHG)
anagen_mCHH<-read.table("anagen_mCHH.txt",header = F);head(anagen_mCHH);dim(anagen_mCHH)
telgen_mCG<-read.table("telgen_mCG.txt",header = F);head(telgen_mCG);dim(telgen_mCG)
telgen_mCHG<-read.table("telgen_mCHG.txt",header = F);head(telgen_mCHG);dim(telgen_mCHG)
telgen_mCHH<-read.table("telgen_mCHH.txt",header = F);head(telgen_mCHH);dim(telgen_mCHH)
anagen_gene<-read.table("anagen_gene.txt",header = F);head(anagen_gene);dim(anagen_gene)

colors<-rainbow(10, alpha=0.5 )
library(circlize)
f1=colorRamp2(breaks=c(75,87,100),color=c("#FFFFFF","#EDF5E8","#72BF75"))
f2=colorRamp2(breaks=c(2,2.25,2.6),color=c("#FDF7AF","#F1903D","#68ADD6"))
f3=colorRamp2(breaks=c(1.9,2.2,2.5),color=c("#FDF7AF","#F1903D","#68ADD6"))
f4=colorRamp2(breaks=c(1.7,2.1,2.4),color=c("#FDF7AF","#F1903D","#68ADD6"))
f5=colorRamp2(breaks=c(1,70,140),color=c("#FDF7AF","#F1903D","#68ADD6"))
f6=colorRamp2(breaks=c(1,70,140),color=c("#FFFFFF","#68ADD6","#3F90C6"))


library(circos)
par(mar=c (2 , 2 , 2 , 2) ) 
plot(c (1 ,800) , c (1 ,800) , type="n" , axes=FALSE, xlab="" , ylab="" , main="")
circos(R=380,cir=db.test,type="chr",colors, print.chr.lab=TRUE, W=4, scale=TRUE,col="black")

circos(R=330,cir=db.test,W=40,mapping=anagen_mCG, col.v=3, type="b3", B=FALSE,lwd=1.5,scale=TRUE,
       col=f1(anagen_mCG$V4));min(anagen_mCG$V4);max(anagen_mCG$V4)
circos(R=300,cir=db.test,W=40,mapping=telgen_mCG, col.v=3, type="b3", B=FALSE,lwd=1.5,scale=TRUE,
       col=f1(telgen_mCG$V4));min(telgen_mCG$V4);max(telgen_mCG$V4)

circos(R=270,cir=db.test,W=40,mapping=anagen_mCHG, col.v=3, type="b3", B=FALSE,lwd=1.3,scale=TRUE,
       col=f2(anagen_mCHG$V4));min(anagen_mCHG$V4);max(anagen_mCHG$V4)
circos(R=240,cir=db.test,W=40,mapping=telgen_mCHG, col.v=3, type="b3", B=FALSE,lwd=1.3,scale=TRUE,
       col=f2(telgen_mCHG$V4));min(telgen_mCHG$V4);max(telgen_mCHG$V4)

circos(R=210,cir=db.test,W=40,mapping=anagen_mCHH, col.v=3, type="b3", B=FALSE,lwd=1.2,scale=TRUE,
       col=f3(anagen_mCHH$V4));min(anagen_mCHH$V4);max(anagen_mCHH$V4)
circos(R=180,cir=db.test,W=40,mapping=telgen_mCHH, col.v=3, type="b3", B=FALSE,lwd=1.2,scale=TRUE,
       col=f4(telgen_mCHH$V4));min(telgen_mCHH$V4);max(telgen_mCHH$V4)

circos(R=150,cir=db.test,W=40,mapping=anagen_gene, col.v=3, type="b3", B=TRUE,lwd=0.8,scale=TRUE,
       col=f6(anagen_gene$V4));min(anagen_gene$V4);max(anagen_gene$V4)


#Lengend
x<-read.table("clipboard",header = F)
data1<-runif(6, min = min(x$V1), max = max(x$V1))
data2<-runif(6, min = min(x$V1), max = max(x$V1))
data3<-runif(6, min = min(x$V1), max = max(x$V1))
data4<-runif(6, min = min(x$V1), max = max(x$V1))
data5<-runif(6, min = min(x$V1), max = max(x$V1))
data6<-runif(6, min = min(x$V1), max = max(x$V1))
data<-cbind(data1,data2,data3,data4,data5);head(data);dim(data)
data1<-data.frame(data);head(data1);dim(data1)

pheatmap(data1,cluster_rows =T, cluster_cols =F ,border_color= "white",#scale="row",
         fontsize_row = 10, fontsize_col = 8 ,
         show_rownames = F, show_colnames = T,
         color=colorRampPalette(c(c("#FFFFFF","#68ADD6","#3F90C6")))(500)
)
