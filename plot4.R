##plot4.R
print("plot 4 is being generated")
library(dplyr)
## read in data
setwd("/root/MOOCs/EDA")
data <- read.table("data.txt", header = TRUE, sep=";", na.strings = "?")
##filter data by given dates
data <- filter(data, Date == '1/2/2007' | Date == '2/2/2007')
## format date and time into a single variable dateTime
dt <- paste(data$Date,data$Time)
dateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")
df <- tbl_df(cbind(dateTime,data[,-c(1,2)]))

## make the plot
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")
par(mfrow = c(2, 2))
with(df, {plot(dateTime,Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")
          plot(dateTime,Voltage,type="l",ylab="Voltage",xlab="datatime")
          plot(dateTime,Sub_metering_1,
               type = "l",
               col = "gray1",
               ylab="Energy sub metering",
               xlab=""
          )
          legend("topright", pch = 1, inset = 0.005, cex = 0.8, box.col = "white", col = c("grey1", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
          with(df, lines(dateTime, Sub_metering_2, col = "red"))
          with(df, lines(dateTime, Sub_metering_3, col = "blue"))
          plot(dateTime,Global_reactive_power,type = "l",ylab="Global_reactive_power",xlab="datetime")
        }
)
dev.off()