getwd()
setwd("/Users/liwe4z/testing/coursera/")
all<-read.csv(file="household_power_consumption.txt",sep=";",header=TRUE)
head(all)
nrow(all)

data <- subset(all, Date =="1/2/2007" | Date == "2/2/2007")
head(data)
#nrow(data)
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
names(data)
data$Global_active_power<- as.numeric(data$Global_active_power) 
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)

with(data,plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data,lines(datetime, Sub_metering_2, type="l", col="red"))
with(data,lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright",lty=1,lwd=1, col =c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
dev.off()





