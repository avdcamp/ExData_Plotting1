setwd("C:\\Users\\acamp002\\Documents\\Data science\\Exploratory Data Analysis\\Week 1")
# Read data
hhset <- read.csv2("household_power_consumption.txt",na.strings = "?")
hhset[,1] <- as.Date(hhset[,1],"%d/%m/%Y")
hhset[,2] <- strptime(hhset[,2],"%H:%M:%S")

# Set thresholds
lowerdate <- as.Date("01/02/2007","%d/%m/%Y")
higherdate <- as.Date("02/02/2007","%d/%m/%Y")

# Subset data
subhhset <- hhset[hhset$Date >= lowerdate & hhset$Date <= higherdate,]                  

# Plot 1 - save to png
png("plot1.png",width=480,height=480,units="px")
hist(as.numeric(as.character(subhhset[,3])), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

