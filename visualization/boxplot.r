######data format
#Apr	12	14.66666667	10	13.33333333	15	13
#May	14.5	12.6	12.3	15	13.2	13.52
#Jun	14.66666667	11.33333333	14.75	14	13.5	13.65
#Jul	15.6	16.3	12.5	13.4	14.8	14.52
#Aug	20	17.33333333	16.33333333	14.5	15.33333333	16.7
#Sep	16.5	15.8	16.9	18.9	16.3	16.88
#Oct	18.33333333	19	16.5	22	15.66666667	18.3
#Nov	15.33333333	17.66666667	15	14	16	15.6
#Dec	14.66666667	16.66666667	14	15	14.5	14.96666667
#Jan	14.7	15.5	13	14	15	14.44
#Feb	12.66666667	12.5	16.33333333	13.66666667	17	14.43333333
#Mar	13	12	8.75	11	10	10.95
######


library(ggplot2)
mydata<-read.table("clipboard",header=FALSE)
head(mydata);dim(mydata)
mydata1<-as.matrix(mydata[,c(2:6)])
head(mydata1,n=10);dim(mydata1)
dim(mydata1)<- c(12*5,1)
mege_name<-data.frame(rep(mydata$V1,length(mydata1[,1])/length(mydata$V1)))
merge_number<-data.frame(mydata1)
merge_data<-cbind(mege_name,merge_number);head(merge_data,n=10)
colors<-c("black","black","black","black",
          "black","black","black","black",
          "black","black","black","black")
#颜色按照图例的顺序给（图例扽顺序是按字母的先后顺序排列）
positions<-head(merge_data[,1],n=length(mydata[,1]))
library(ggplot2)
qplot(mege_name,mydata1,  data=merge_data,geom = "boxplot",
      col=mege_name,outlier.colour = NA,
      ylim = c(min(merge_data[,2]),25))+
  scale_x_discrete(limits = positions)+
  labs(x=" ",y=" S/P ratio ",title = " ") +
  scale_color_manual(values = colors)+ theme_bw()+theme(
    title = element_text(vjust = 0.5,size = 15, color = "black"),
    axis.title.y = element_text(vjust = 0.5, angle = 90,size =12),
    axis.title.x = element_text(hjust = 0.5, angle = 0, size = 15)) + 
  theme(axis.text.x = element_text(size=10,angle=0,color="black"))+ ##调整x轴标签的角度
  theme(axis.text.y = element_text(size=10,angle= 0,color="black"))+
  #theme(legend.key.size=unit(0.5,'cm'),legend.title=element_blank())+
  theme(panel.grid.minor=element_blank())+theme(panel.grid.major=element_blank())+
  theme(legend.position='none')