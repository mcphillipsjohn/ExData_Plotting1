# NOTE: this requires that the file is in the same directory as the script
#Take only the rows we need to make the data set smaller
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
hpc <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip = 66637, nrows = 2880)
colnames(hpc) <- unlist(header)


  
hpc$Date <- as.Date(as.character(hpc$Date), "%d/%m/%Y")

############
## Plot 1 ##
############

hist(hpc$Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png")
dev.off()
