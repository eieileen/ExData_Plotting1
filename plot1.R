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

png(file = "plot1.png")

par(mar = c(4,4,2,2))
hist(data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
     
dev.off()