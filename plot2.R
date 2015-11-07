## This file loads the household power consumption data from the downloaded  txt file
## from UC Irvine Machine library and filters the dates 2007-02-01 and 2007-02-02
## Plots the global_active_power as line plot


# Load data
pollution <- data.table::fread("household_power_consumption.txt",sep =";",na.string = "?")
# create datetime column
pollution[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# filter data
pollution <- pollution[pollution$DateTime < as.POSIXct("2007-02-03 00:00:00") &
             pollution$DateTime >= as.POSIXct("2007-02-01 00:00:00") ,]


png(filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px", pointsize = 12,
    bg = "white"
)


with(pollution, plot(DateTime,
               Global_active_power,
               type = "l",
               xlab = "",
               ylab = "Global Active Power (kilowatts)"
               ))

dev.off()
