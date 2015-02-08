# plot 1
{file <- unzip("exdata-data-household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)
 dateDownloaded <- date()
 library(data.table)
 newFile <- fread(file, na.strings = "?")
 newFile[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
 library(dplyr)
 subsetFile <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
 globalActivePower <- as.numeric(subsetFile$Global_active_power)
 library(datasets)
 hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
 dev.copy(png, file="plot1.png", height=480, width=480)
 dev.off()
 
}