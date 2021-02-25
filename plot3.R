library(dplyr)
library(tidyr)
library(readr)
library(lubridate)

## Download and unzip data
temp <- tempfile()
filePath <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(filePath,temp)
df <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ';', na.strings = '?')

## Plot 1
df <- df %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(Date=dmy(Date)) %>%
        mutate(Time=hms(Time))

png("plot3.png", width=480, height=480)
with(df, plot(Date + Time, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n"))
with(df, points(Date + Time, Sub_metering_1, type = "l"))
with(df, points(Date + Time, Sub_metering_2, col = "red", type = "l"))
with(df, points(Date + Time, Sub_metering_3, col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))

dev.off()