## Read the data file into a variable

power_data <- read.csv("./household_power_consumption.txt", sep = ";")

## read the subset for Feb 1 and Feb 2, 2007
x<-subset(power_data, as.Date(power_data$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(power_data$Date, "%d/%m/%Y")=="2007-02-02")
write.csv(x, file="./power_data_subset.txt", row.names = FALSE, quote=FALSE)
x<- read.csv("./power_data_subset.txt")

## Draw the chart
par(mfrow=c(1,1))
plot(x=as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S"), y=x$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(x=as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S"), y=x$Sub_metering_2, col="red", xlab="", ylab="Energy sub metering", type="l")
lines(x=as.POSIXct(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S"), y=x$Sub_metering_3, col="blue", xlab="", ylab="Energy sub metering", type="l")
legend("topright", lty = 1, lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## copy the chart into the file
dev.copy(png, file="./plot3.png")
dev.off()

