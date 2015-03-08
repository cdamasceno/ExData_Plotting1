## plot1.R head(x)
## read data

## library(lubridate)
x <- read.table ( "household_power_consumption.txt", sep = ";", header= TRUE, stringsAsFactors = FALSE, na.strings="?")
x1 <- mutate ( x, Date = dmy(Date),Time = hms(Time))
x3 <- subset(x1, Date == ymd("2007-02-02") | Date == ymd("2007-02-01")) 
x4 <- mutate (x3, Global_active_power= as.numeric(Global_active_power))
png ( filename = "plot1.png" , width = 480, height = 480)
hist(x4$Global_active_power, xlab = "Global Active Power( kilowatts) ", ylab = "Frequency",
     col = "red", main = paste ( "Global Active Power"))
dev.off()


