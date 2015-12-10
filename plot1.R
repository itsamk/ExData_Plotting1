a<- read.table("./household_power_consumption.txt", sep = ";", nrows=1)
b <- grep("1/2/2007", readLines("./household_power_consumption.txt"))
data <- read.table("./household_power_consumption.txt", sep=";", skip = b-1, nrows = 48*60)

t <- lapply(a[1,], as.character)
colnames(data) <- t;

png(filename = "Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main= "Global Active Power")
dev.off()