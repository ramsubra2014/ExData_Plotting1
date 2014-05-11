# Read file and prepare data
power <- read.table("c:/Users/ram/downloads/power/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
power <- na.omit(power)
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
head(unique(power$Date), 50)
power$Date <- as.Date(power$Date, format= "%d/%m/%Y")
power1 <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02") )
power1$DateTime <- as.POSIXct(power1$DateTime)

# Plot 1
png(filename = "Plot 1.png", width = 480, height = 480)
hist(power1$Global_active_power, axes = F, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
axis(2) 
axis(1, seq(0,5,1))
dev.off()