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

# Plot 3 - save to png
png("plot3.png",width=480,height=480,units="px")
Sys.setlocale("LC_TIME", "English")
plot(subhhset[,10],as.numeric(as.character(subhhset$Sub_metering_1)),type="l", xlab="", ylab="Energy sub metering")
lines(subhhset[,10],as.numeric(as.character(subhhset$Sub_metering_2)),type="l",col="red")
lines(subhhset[,10],as.numeric(as.character(subhhset$Sub_metering_3)),type="l",col="blue")
legend("topright", col=c("black","red","blue"),lwd=1,legend=c(colnames(subhhset[,7:9])))
dev.off()

