dataFile <- "~/Data Science Specialization/Data Science repo/Coursera_data/household_power_consumption.txt"
power_data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet_powerData <- power_data[power_data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSet_powerData)
datetime <- strptime(paste(subSet_powerData$Date, subSet_powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_Active_Power <- as.numeric(subSet_powerData$Global_active_power)
global_Reactive_Power <- as.numeric(subSet_powerData$Global_reactive_power)
voltage <- as.numeric(subSet_powerData$Voltage)
subMetering1 <- as.numeric(subSet_powerData$Sub_metering_1)
subMetering2 <- as.numeric(subSet_powerData$Sub_metering_2)
subMetering3 <- as.numeric(subSet_powerData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_Active_Power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
