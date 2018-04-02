# NOTE: this requires that the file is in the same directory as the script
#Take only the rows we need to make the data set smaller
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
hpc <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880)
colnames(hpc) <- unlist(header)


head(hpc)
#Convert the Date field to a Date data type
hpc$Date <- as.Date(as.character(hpc$Date), "%d/%m/%Y")

#Add a field which combines the date and time to make a full date field
hpc <- cbind(hpc, DateTime = as.POSIXct(paste(hpc$Date, hpc$Time), "%d/%m/%Y HH:mm:ss"))


############
## Plot 4 ##
############

par(mfrow = c(2,2))
with(hpc, {
  plot(x = DateTime, y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(x = DateTime, y = Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(x = DateTime, y = Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(x = DateTime, y = Sub_metering_2, col = "red", type = "l")
  points(x = DateTime, y = Sub_metering_3, col = "blue", type = "l")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, border = 0)
  plot(x = DateTime, y = Global_reactive_power, type = "l",  xlab = "datetime")
})

dev.copy(png, file = "plot4.png")
dev.off()
