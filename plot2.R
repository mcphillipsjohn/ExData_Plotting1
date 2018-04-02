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
## Plot 2 ##
############


plot(x = hpc$DateTime, y = hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")
#axis.POSIXct(1, at=seq(hpc$Date[1], hpc$Date[[length(hpc)]] by="day"), format = "%a")

dev.copy(png, file = "plot2.png")
dev.off()
