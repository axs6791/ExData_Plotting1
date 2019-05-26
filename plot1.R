## plot1.R

## Defines the script to create an histogram of the global active power based
## on the Electric Power Consumption dataset for the period for a two day period
## in February 2007.

source("common.R")
#Note: common.R defines loadData, which is reused in all the plot<X>.R scripts
powerDF<-loadData()
png("plot1.png", width=480, height=480)
hist(powerDF$Global_active_power, col = "red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()