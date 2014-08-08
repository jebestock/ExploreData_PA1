##############
#File: plot2.R
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
#figure2
l<-length(data_new[,2])
png("./plot2.png",width = 480, height = 480, units = "px")
plot(seq(0,l-1,1),data_new[,2],col="black",bty="o",ylim=c(0.0,8.0),axes=F,main="",ylab="Global active power (kilowatts)",xlab="",lty=1,type="l")
box()
axis(2,at=seq(0,6,2),labels=T)
axis(1,at=c(0,l/2,l),labels=c("Thu","Fri","Sat"))
dev.off()
