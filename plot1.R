##plot1.R
print("plot 1 is being generated")
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
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")
with(df, hist(Global_active_power,
              col="red",
              main="Global Active Power",
              xlab="Global Active Power (kilowatts)",
              ylab="Frequency"
))
dev.off()
