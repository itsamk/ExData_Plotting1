a<- read.table("./household_power_consumption.txt", sep = ";", nrows=1)
b <- grep("1/2/2007", readLines("./household_power_consumption.txt"))
data <- read.table("./household_power_consumption.txt", sep=";", skip = b-1, nrows = 48*60)

t <- lapply(a[1,], as.character)
colnames(data) <- t;

data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab= "")

plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab= "datetime")

plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab= "")
lines(data$DateTime, data$Sub_metering_2, type = "l", ylab = "Energy sub metering", xlab= "", col= "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", ylab = "Energy sub metering", xlab= "", col= "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab= "datetime")
dev.off()


