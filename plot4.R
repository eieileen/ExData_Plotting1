## Begin by downloading and unzipping the file from the url below into your 
## working directory:
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Then run the R code.
data <- read.table("./household_power_consumption.txt", 
                   sep =";", 
                   header = TRUE, 
                   stringsAsFactors = TRUE, 
                   na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, data$Date == "2007/02/01" | data$Date == "2007/02/02")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

png(file = "plot4.png")

par(mfrow = c(2,2), mar = c(4,4,2,1))

plot(Global_active_power ~ DateTime, 
     data = data, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

plot(Voltage ~ DateTime, 
     data = data, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

plot(Sub_metering_1 ~ DateTime, 
     data= data, 
     type = "l", 
     ylab = "Energy sub metering")
points(Sub_metering_2 ~ DateTime, 
       data = data, 
       type = "l", 
       col = "red")
points(Sub_metering_3 ~ DateTime, 
       data = data, 
       type = "l", 
       col = "blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       lwd = c(1,1,1),
       col = c("black","red","blue"))

plot(Global_reactive_power ~ DateTime, 
     data = data, 
     type = "l", 
     xlab = "datetime")

dev.off()