setwd("C:\\Users\\acamp002\\Documents\\Data science\\Exploratory Data Analysis\\Week 1")
# Read data
hhset <- read.csv2("household_power_consumption.txt",na.strings = "?")

times <- strptime(paste(hhset[,1],hhset[,2]),"%d/%m/%Y %H:%M:%S")
hhset[,1] <- as.Date(hhset[,1],"%d/%m/%Y")
hhset <- cbind(hhset,times)
# Set thresholds
lowerdate <- as.Date("01/02/2007","%d/%m/%Y")
higherdate <- as.Date("02/02/2007","%d/%m/%Y")

# Subset data
subhhset <- hhset[hhset$Date >= lowerdate & hhset$Date <= higherdate,]                  

# Plot 2 - save to png
png("plot2.png",width=480,height=480,units="px")
Sys.setlocale("LC_TIME", "English")
plot(subhhset[,10],as.numeric(as.character(subhhset[,3])),type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

