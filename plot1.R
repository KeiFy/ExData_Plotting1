#load data
data <- read.table("household_power_consumption.txt",sep=";",skip=0,nrows=100000,header=T)
data <- data[which(data$Date==c("1/2/2007","2/2/2007")),]
DateTime <- paste(data$Date, data$Time)
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime,data)

#Plot 1
par(mfrow=c(1,1))
hist(as.numeric(levels(data[,4]))[data[,4]],xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off

