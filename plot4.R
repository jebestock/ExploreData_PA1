##############
#File: plot4.R
##############
#
# reading data
# reading data
setwd("C:/Users/jb/Documents/GitHub/ExData_Plotting1")
#myfile<-"C:/Users/jb/Documents/Coursera_DataScience/Course_03_GettingCleaningData/PA1/household_power_consumption.txt"
myfile<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp<- tempfile()
download.file(myfile,temp)
con <- unz(temp, "household_power_consumption.txt")
#data_short<-read.table(con,comment.char="", nrows=3, sep=";")


col_class<-c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table(con,na.strings="?",comment.char="", sep=";",colClasses=col_class,header=T)
unlink(temp)

indices<-(data[,1]=="1/2/2007")|(data[,1]=="2/2/2007")
data_ext<-data[indices,]
dt<-paste(data_ext[,1],data_ext[,2])
dt_new<-dt_new<-strptime(dt,"%d/%m/%Y %H:%M:%S")
data_new<-cbind(dt_new,data_ext[,3:9])
####

#figure4

l<-length(data_new[,1])
png("./plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
par(lwd=0.2)
#subfig1
l<-length(data_new[,2])
plot(seq(0,l-1,1),data_new[,2],col="black",bty="o",ylim=c(0.0,8.0),axes=F,main="",ylab="Global active power",xlab="",lty=1,type="l")
box()
axis(2,at=seq(0,6,2),labels=T)
axis(1,at=c(0,l/2,l),labels=c("Thu","Fri","Sat"))
#subfig2
plot(seq(0,l-1,1),data_new[,4],col="black",bty="o",ylim=c(233.5,246.5),axes=F,main="",ylab="Voltage",xlab="datetime",lty=1,type="l")
box()
axis(2,at=seq(234,246,2),labels=T)
axis(1,at=c(0,l/2,l),labels=c("Thu","Fri","Sat"))
#mtext("datetime",side=1)
#subfig3
plot( seq(0,l-1,1),data_new[,6],col="black",ylim=c(0.0,40.0),axes=F,lty=1,type="l",main="",ylab="Energy sub metering",xlab="")
lines(seq(0,l-1,1),data_new[,7],col="red")
lines(seq(0,l-1,1),data_new[,8],col="blue")    
box()
axis(2,at=seq(0,30,10),     labels=T)
axis(1,at=c(0,l/2,l),       labels=c("Thu","Fri","Sat"))
plot_colors <- c("black", "red", "blue")
text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",legend = text, col=plot_colors,lty=c(1,1,1), lwd=c(1.0,1.0,1.0))
#subfig4
plot(seq(0,l-1,1),data_new[,3],col="black",bty="o",ylim=c(-0.02,0.52),axes=F,main="",ylab="Global_reactive_power",xlab="datetime",lty=1,type="l")
box()
axis(2,at=seq(0,0.5,0.1),labels=T,cex.axis=.7)
axis(1,at=c(0,l/2,l),labels=c("Thu","Fri","Sat"))
dev.off()
##test
