#initialize the filehandle to the file name
filehandle <- file("household_power_consumption.txt")

#reading only the first 2 days of Feb 2007 into the ba vector
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(filehandle), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#defining datetime typecasting
datetime <- strptime(paste(ba$Date, ba$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#defining globalActivePower for plot1
globalActivePower <- as.numeric(ba$Global_active_power)
#defining voltage for plot2
voltage <- as.numeric(ba$Voltage)
#defining lables for plot3
subMetering1 <- as.numeric(ba$Sub_metering_1)
subMetering2 <- as.numeric(ba$Sub_metering_2)
subMetering3 <- as.numeric(ba$Sub_metering_3)
#defining globalReactivePower for plot4
globalReactivePower <- as.numeric(ba$Global_reactive_power)

#defining the dimensions of the plot
png("plot4.png", width=480, height=480)
#defining 4 plots in the same output using par and mfrow functions
par(mfrow = c(2, 2))

#plot1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()