## plot2.R

## Creates an line plot of the global active power based
## on the Electric Power Consumption dataset for the period for a two day period
## in February 2007.

source("common.R")
#Note: common.R defines loadData, which is reused in all the plot<X>.R scripts
powerDF<-loadData()
png("plot2.png", width=480, height=480)
plot(powerDF$Global_active_power, type='l', xlab='', 
     ylab="Global Active Power (kilowatts)", xaxt="n")

# Adds the x-axis based on dates
firstFriday<-min(which(powerDF$Date=="2/2/2007"))
axis(1, at=c(0,firstFriday, length(powerDF$Global_active_power)), 
     labels=c('Thu', 'Fri', 'Sat'))
dev.off()