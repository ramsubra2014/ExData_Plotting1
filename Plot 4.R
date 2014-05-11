# Read file and prepare data
power <- read.table("c:/Users/ram/downloads/power/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
power <- na.omit(power)
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
head(unique(power$Date), 50)
power$Date <- as.Date(power$Date, format= "%d/%m/%Y")
power1 <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02") )
power1$DateTime <- as.POSIXct(power1$DateTime)

# Plot 4

png(filename = "Plot 4.png",width = 480, height = 480 )
par(mfrow = c(2,2))

# vs Global Active Power
power1$DateTime <- as.POSIXct(power1$DateTime)
plot(power1$DateTime, power1$Global_active_power, type = "n", axes = F, ylab = " Global Active Power (kilowatts)", xlab = NA)
lines(power1$DateTime, power1$Global_active_power)
axis(2)
axis(1, at=c(min(power1$DateTime), min(power1$DateTime)+86400,  min(power1$DateTime)+2*86400),labels=c("Thu", "Fri", "Sat"))
box(which = "plot", lty = "solid")

# vs Voltage
plot(power1$DateTime, power1$Voltage, type = "n", axes = F, ylab = " Voltage", xlab = "datetime")
lines(power1$DateTime, power1$Voltage)
axis(2)
axis(1, at=c(min(power1$DateTime), min(power1$DateTime)+86400,  min(power1$DateTime)+2*86400),labels=c("Thu", "Fri", "Sat"))
box(which = "plot", lty = "solid")

# vs Energy Sub Metering
plot(power1$DateTime, power1$Sub_metering_1, axes =FALSE, ylab ="Energy sub metering", type = "n", xlab = NA)
lines(power1$DateTime, power1$Sub_metering_1, col = "black")
lines(power1$DateTime, power1$Sub_metering_2, col = "red")
lines(power1$DateTime, power1$Sub_metering_3, col = "blue")
axis(2)
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at=c(min(power1$DateTime), min(power1$DateTime)+86400,  min(power1$DateTime)+2*86400),labels=c("Thu", "Fri", "Sat"))
box(which = "plot", lty = "solid")

# vs Global Reactive power
plot(power1$DateTime, power1$Global_reactive_power, type = "n", axes = F, ylab = " Global_reactive_power", xlab = "datetime")
lines(power1$DateTime, power1$Global_reactive_power)
axis(2)
axis(1, at=c(min(power1$DateTime), min(power1$DateTime)+86400,  min(power1$DateTime)+2*86400),labels=c("Thu", "Fri", "Sat"))
box(which = "plot", lty = "solid")

dev.off()