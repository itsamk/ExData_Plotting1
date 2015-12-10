a<- read.table("./household_power_consumption.txt", sep = ";", nrows=1)
b <- grep("1/2/2007", readLines("./household_power_consumption.txt"))
data <- read.table("./household_power_consumption.txt", sep=";", skip = b-1, nrows = 48*60)

t <- lapply(a[1,], as.character)
colnames(data) <- t;

#data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "Plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab= "")
dev.off()

