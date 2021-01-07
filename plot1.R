getwd()
setwd("/Users/liwe4z/testing/coursera/")

all<-read.csv(file="household_power_consumption.txt",sep=";",header=TRUE)
head(all)
nrow(all)
#all$Date<- as.Date(all$Date,"%d/%m/%Y") # date format now 'yyyy-mm-dd'

data <- subset(all, Date =="1/2/2007" | Date == "2/2/2007")
head(data)
data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Global_active_power<- as.numeric(data$Global_active_power) 

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col = "red",main="Global Active Power", xlab = "Global Active Power (kilowatts)") 
dev.off()
