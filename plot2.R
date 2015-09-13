#initialize the filehandle to the file name
filehandle <- file("household_power_consumption.txt")

#reading only the first 2 days of Feb 2007 into the ba
ba <- read.table(text = grep("^[1,2]/2/2007", readLines(filehandle), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#defining datetime typecasting
datetime <- strptime(paste(ba$Date, ba$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#defining globalActivePower as numeric
globalActivePower <- as.numeric(ba$Global_active_power)

#defining plot2 dimensions
png("plot2.png", width=480, height=480)

#creating the plot2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#turning off the graphic device for plot
dev.off()
