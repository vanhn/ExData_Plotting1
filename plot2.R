library(dplyr)
library(lubridate)

## Download and unzip data
temp <- tempfile()
filePath <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(filePath,temp)
df <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ';', na.strings = '?')

## Plot 1
png("plot2.png", width=480, height=480)
df %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        mutate(Date=dmy(Date)) %>%
        mutate(Time=hms(Time)) %>%
        with(plot(
                Date + Time,
                Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)"
        ))

dev.off()