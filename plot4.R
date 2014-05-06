#Load data
data <- read.table("household_power_consumption.txt",sep=";",skip=0,nrows=100000,header=T)
data <- data[which(data$Date==c("1/2/2007","2/2/2007")),]
DateTime <- paste(data$Date, data$Time)
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
data <- cbind(DateTime,data)

#Plot 4
par(mfrow=c(2,2))
plot(data[,1],as.numeric(levels(data[,4]))[data[,4]],type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(data[,1],as.numeric(levels(data[,6]))[data[,6]],type="l",ylab=names(data)[6],xlab="datetime")
plot(data[,1],as.numeric(levels(data[,8]))[data[,8]],type="l",ylab="Energy Sub Metering",xlab="")
lines(data[,1],as.numeric(levels(data[,9]))[data[,9]],col="red")
lines(data[,1],data[,10],col="blue")
legend("topright", legend = names(data)[8:10], col = c("black", "red","blue"),lty = 1)
plot(data[,1],as.numeric(levels(data[,5]))[data[,5]],type="l",ylab=names(data)[5],xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off

