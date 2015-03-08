## plot1.R head(x)
## read data

library(lubridate)
x <- read.table ( "household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE, na.strings="?")
x1 <- mutate ( x, Date = dmy(Date),Time = hms(Time))
x3 <- subset(x1, Date == ymd("2007-02-02") | Date == ymd("2007-02-01")) 
x4 <- mutate (x3, Global_active_power = as.numeric(Global_active_power))
x5 <- mutate ( x4, DateTime = Date + Time)
Sys.setlocale(category = "LC_TIME", locale = "C") 
png ( filename = "plot2.png" , width = 480, height = 480)
plot ( x = x5$DateTime, y = x5$Global_active_power , type = "l", 
       ylab =  "Global Active Power( kilowatts) ", xlab = "")

dev.off()


