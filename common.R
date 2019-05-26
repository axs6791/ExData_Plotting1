## File loading script shared between the plot scripts

library(data.table)

#' loadData prepares a dataframe to be used for the plot scrits.
#' It will download the data if necessary, uncompress it, load it into a 
#' dataframe, and fiter it to only include teh dates for 02/01/2007 and 
#' 02/02/2007.
loadData<-function()
{
    zipFileName<-"powerconsumption.zip"
    # only download the file if not already in the file system
    if(!file.exists(zipFileName)){
        url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, zipFileName, method = "curl")
    }
    unzip(zipFileName)
    
    fileName<-"household_power_consumption.txt"
    # Load the file into a dataframe. NAs are marked as '?'
    powerDF<-fread(fileName, sep=';', na.string='?')
    
    # Mutate the dataframe so that dates are in Date class.
    powerDF <- xpowerDF<-powerDF[powerDF$Date=="1/2/2007" 
                                 | powerDF$Date=="2/2/2007", ]
}