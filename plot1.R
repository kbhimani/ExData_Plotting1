## Read the data file into a variable

power_data <- read.csv("./household_power_consumption.txt", sep = ";")

## read the subset for Feb 1 and Feb 2, 2007
x<-subset(power_data, as.Date(power_data$Date, "%d/%m/%Y")=="2007-02-01" | as.Date(power_data$Date, "%d/%m/%Y")=="2007-02-02")
write.csv(x, file="./power_data_subset.txt", row.names = FALSE, quote=FALSE)
x<- read.csv("./power_data_subset.txt")

## Draw the histogram
par(mfrow=c(1,1))
hist(x$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

## copy the chart into the file
dev.copy(png, file="./plot1.png")
dev.off()

