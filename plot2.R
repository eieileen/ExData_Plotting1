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

png(file = "plot2.png")

plot(Global_active_power ~ DateTime, 
     data = data, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

dev.off()