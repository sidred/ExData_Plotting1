## This file loads the household power consumption data from the downloaded  txt file
## from UC Irvine Machine library and filters the dates 2007-02-01 and 2007-02-02
## Plots the submetering data for sub meterting 1,2,3 as line plots


# Load data
pollution <- data.table::fread("household_power_consumption.txt",sep =";",na.string = "?")
# create datetime column
pollution[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# filter data
pollution <- pollution[pollution$DateTime < as.POSIXct("2007-02-03 00:00:00") &
                         pollution$DateTime >= as.POSIXct("2007-02-01 00:00:00") ,]


png(filename = "plot3.png",
    width = 480,
    height = 480,
    units = "px",
    pointsize = 12,
    bg = "white"
)



## set up axis
with(pollution, plot(range(DateTime),
               range(Sub_metering_1),
               type = "n",
               xlab = "",
               ylab = "Energy sub metering"
               ))
## add submetering 1
with(pollution, lines(DateTime,
                      Sub_metering_1
))
## add submetering 2
with(pollution, lines(DateTime,
                     Sub_metering_2,
                     col = "red"
))
## add submetering 3
with(pollution, lines(DateTime,
                      Sub_metering_3,
                      col = "blue"
))
## add legend
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(2.5, 2.5, 2.5),
       col=c("black", "blue","red")
)
dev.off()
