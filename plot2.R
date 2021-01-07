getwd()
setwd("/Users/liwe4z/testing/coursera/")
all<-read.csv(file="household_power_consumption.txt",sep=";",header=TRUE)
head(all)
nrow(all)

data <- subset(all, Date =="1/2/2007" | Date == "2/2/2007")
head(data)
#nrow(data)
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

data$Global_active_power<- as.numeric(data$Global_active_power) 

png(filename = "plot2.png", width = 480, height = 480)
with(data,plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
