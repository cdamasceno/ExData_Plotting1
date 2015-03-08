## plot4.R head(x)


library(lubridate)
library(dplyr)
x <- read.table ( "household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE, na.strings="?")
x1 <- mutate ( x, Date = dmy(Date),Time = hms(Time))
x3 <- subset(x1, Date == ymd("2007-02-02") | Date == ymd("2007-02-01")) 
x4 <- mutate (x3, Global_active_power = as.numeric(Global_active_power))
x5 <- mutate ( x4, DateTime = Date + Time)
Sys.setlocale(category = "LC_TIME", locale = "C") 

png ( filename = "plot4.png" , width = 480, height = 480)
par(mfrow = c(2,2))
## plot 1
plot ( x = x5$DateTime, y = x5$Global_active_power , type = "l", 
       ylab =  "Global Active Power( kilowatts) ", xlab = "")
## plot 2
plot ( x = x5$DateTime, y = x5$Voltage , type = "l", 
 ylab =  "Voltage ", xlab = "datetime")
## plot 3
plot(x5$DateTime,x5$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "" )

lines(x5$DateTime, x5$Sub_metering_1, col = "black")
lines(x5$DateTime, x5$Sub_metering_2, col = "red")
lines(x5$DateTime, x5$Sub_metering_3, col = "blue")
legend("topright", pch = c("-", "-", "-"), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## plot 4
plot ( x = x5$DateTime, y = x5$Global_reactive_power , type = "l", 
       ylab =  "Global reactive power ", xlab = "datetime")
                                                  
dev.off()
