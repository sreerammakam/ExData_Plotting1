#initialize the filehandle to the file name
filehandle <- file("household_power_consumption.txt")

#reading only the first 2 days of Feb 2007 into the ba vector
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(filehandle), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#defining datetime typecasting
datetime <- strptime(paste(ba$Date, ba$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(ba$Global_active_power)

#initializing the variables for labels
subMetering1 <- as.numeric(ba$Sub_metering_1)
subMetering2 <- as.numeric(ba$Sub_metering_2)
subMetering3 <- as.numeric(ba$Sub_metering_3)

#defining the plot3 dimensions and plotting and annotating the plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#turning off the graphics device
dev.off()
