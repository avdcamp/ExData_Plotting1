setwd("C:\\Users\\acamp002\\Documents\\Data science\\Exploratory Data Analysis\\Week 1")
# Read data
hhset <- read.csv2("household_power_consumption.txt",na.strings = "?")

times2 <- strptime(paste(hhset[,1],hhset[,2]),"%d/%m/%Y %H:%M:%S")
hhset[,1] <- as.Date(hhset[,1],"%d/%m/%Y")
hhset <- cbind(hhset,times2)
# Set thresholds
lowerdate <- as.Date("01/02/2007","%d/%m/%Y")
higherdate <- as.Date("02/02/2007","%d/%m/%Y")

# Subset data
subhhset <- hhset[hhset$Date >= lowerdate & hhset$Date <= higherdate,]                  

# Plot 4 - save to png
png("plot4.png",width=480,height=480,units="px")
Sys.setlocale("LC_TIME", "English")
par(mfcol=c(2,2))
with(subhhset, {
plot(times2,as.numeric(as.character(Global_active_power)),type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(times2,as.numeric(as.character(Sub_metering_1)),type="l", xlab="", ylab="Energy sub metering")
lines(times2,as.numeric(as.character(Sub_metering_2)),type="l",col="red")
lines(times2,as.numeric(as.character(Sub_metering_3)),type="l",col="blue")
legend("topright", col=c("black","red","blue"),lwd=1,legend=c(colnames(subhhset[,7:9])))
plot(times2,as.numeric(as.character(Voltage)),xlab="datetime",ylab="Voltage",type="l",lwd=.1)
plot(times2,as.numeric(as.character(Global_reactive_power)),xlab="datetime",ylab="Global_reactive_power",type="l",lwd=.1) })
dev.off()

