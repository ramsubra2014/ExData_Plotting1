# Read file and prepare data
power <- read.table("c:/Users/ram/downloads/power/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
power <- na.omit(power)
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
head(unique(power$Date), 50)
power$Date <- as.Date(power$Date, format= "%d/%m/%Y")
power1 <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02") )
power1$DateTime <- as.POSIXct(power1$DateTime)

# Plot 2
png(filename = "Plot 2.png", width = 480, height = 480)
plot(power1$DateTime, power1$Global_active_power, type = "n", axes = F, ylab = " Global Active Power (kilowatts)", xlab = NA)
lines(power1$DateTime, power1$Global_active_power)
axis(2)
axis(1, at=c(min(power1$DateTime), min(power1$DateTime)+86400,  min(power1$DateTime)+2*86400),labels=c("Thu", "Fri", "Sat"))
box(which = "plot", lty = "solid")
dev.off()