#initialize the filehandle to the file name
filehandle <- file("household_power_consumption.txt")
#reading only the first 2 days of Feb 2007 into the ba
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(filehandle), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#casting globalActivePower as numeric
globalActivePower <- as.numeric(ba$Global_active_power)
# defining the plot size
png("plot1.png", width=480, height=480)
#creating the plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#turning off the plot graphics device
dev.off()