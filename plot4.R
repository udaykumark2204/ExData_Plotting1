data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
par(mfrow=c(2,2))
plot(data1$Datetime, data1$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(data1$Datetime, data1$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(data1$Datetime, data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data1$Datetime, data1$Sub_metering_2, type="l", col="blue")
lines(data1$Datetime, data1$Sub_metering_3, type="l", col="red")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
 bty = "n",lwd=2, cex=0.5, col= c("black","red","blue"), lty=1)
plot(data1$Datetime, data1$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
