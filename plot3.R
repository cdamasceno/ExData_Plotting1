## plot1.R head(x)


library(lubridate)
library(dplyr)
x <- read.table ( "household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE, na.strings="?")
x1 <- mutate ( x, Date = dmy(Date),Time = hms(Time))
x3 <- subset(x1, Date == ymd("2007-02-02") | Date == ymd("2007-02-01")) 
x4 <- mutate (x3, Global_active_power = as.numeric(Global_active_power))
x5 <- mutate ( x4, DateTime = Date + Time)
Sys.setlocale(category = "LC_TIME", locale = "C") 
png ( filename = "plot3.png" , width = 480, height = 480)
plot(x5$DateTime,x5$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "" )

lines(x5$DateTime, x5$Sub_metering_1, col = "black")
lines(x5$DateTime, x5$Sub_metering_2, col = "red")
lines(x5$DateTime, x5$Sub_metering_3, col = "blue")
legend("topright", pch = c("-", "-", "-"), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


