## plot3.R

## Creates an line plot of energy sub-metering based
## on the Electric Power Consumption dataset for the period for a two day period
## in February 2007.

source("common.R")
#Note: common.R defines loadData, which is reused in all the plot<X>.R scripts
powerDF<-loadData()
png("plot3.png", width=480, height=480)
plot(powerDF$Sub_metering_1, type='l', xlab='', 
     ylab="Global Active Power (kilowatts)", xaxt="n")
lines(powerDF$Sub_metering_2, col="red")
lines(powerDF$Sub_metering_3, col="blue")
firstFriday<-min(which(powerDF$Date=="2/2/2007"))
axis(1, at=c(0,firstFriday, length(powerDF$Global_active_power)), 
     labels=c('Thu', 'Fri', 'Sat'))
legTxt<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legTxt, col = c("black", "red", "blue"), lty=c(1,1,1))
dev.off()