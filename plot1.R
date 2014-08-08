##############
#File: plot1.R
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
#figure1
png("./plot1.png",width = 480, height = 480, units = "px")
hist(data_new[,2],col="red",xlim=c(0.0,6.0),ylim=c(0.0,1200.0),axes=F,main="Global Active Power",xlab="Global active power (kilowatts)",ylab="Frequency")
axis(1,at=seq(0,6,2),     labels=T)
axis(2,at=seq(0,1200,200),labels=T)
dev.off()
