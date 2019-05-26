## plot4.R

## Creates several plots based
## on the Electric Power Consumption dataset for the period for a two day period
## in February 2007.

source("common.R")
#Note: common.R defines loadData, which is reused in all the plot<X>.R scripts
powerDF<-loadData()
png("plot4.png", width=480, height=480)

# set up a 2x2 plot grid
par(mfrow=c(2,2))

# find where to break the x axis for using day of weeks ticks
firstFriday<-min(which(powerDF$Date=="2/2/2007"))
lastSpot<-length(powerDF$Global_active_power)

# plot upper-left graph
# ---------------------
plot(powerDF$Global_active_power, type='l', xlab='', 
     ylab="Global Active Power (kilowatts)", xaxt="n")

# Adds the x-axis based on dates
axis(1, at=c(0, firstFriday, lastSpot), labels=c('Thu', 'Fri', 'Sat'))

# plot upper-right graph
# ---------------------
plot(powerDF$Voltage, type='l', xlab='', 
     ylab="Voltage", xaxt="n")

# Adds the x-axis based on dates
axis(1, at=c(0, firstFriday, lastSpot), labels=c('Thu', 'Fri', 'Sat'))
title(xlab="datetime")

# plot the lower-left graph
# -------------------------

# plot the first time series
plot(powerDF$Sub_metering_1, type='l', xlab='', 
     ylab="Global Active Power (kilowatts)", xaxt="n")
# plot the next time series
lines(powerDF$Sub_metering_2, col="red")
# plot the last time series
lines(powerDF$Sub_metering_3, col="blue")

# create the proper x axis changing the observation to the week day
axis(1, at=c(0,firstFriday, lastSpot), labels=c('Thu', 'Fri', 'Sat'))

# add a legend
legTxt<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legTxt, col = c("black", "red", "blue"), lty=c(1,1,1))

# plot lower-right graph
# ---------------------
plot(powerDF$Global_reactive_power, type='l', ylab="Global_reactive_power",
     xlab='', xaxt="n")

# Adds the x-axis based on dates
axis(1, at=c(0, firstFriday, lastSpot), labels=c('Thu', 'Fri', 'Sat'))
title(xlab="datetime")
dev.off()