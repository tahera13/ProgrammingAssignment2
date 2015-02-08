# plot 2
{
 file <- unzip("exdata-data-household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
               junkpaths = FALSE, exdir = ".", unzip = "internal",
               setTimes = FALSE)
 File <- read.csv(file, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
 File$Date <- as.Date(File$Date, format="%d/%m/%Y")
 
 newFile <- subset(File, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
 rm(File)
 
 datetime <- paste(as.Date(newFile$Date), newFile$Time)
 newFile$Datetime <- as.POSIXct(datetime)
 
 plot(newFile$Global_active_power~newFile$Datetime, type="l",
      ylab="Global Active Power (kilowatts)", xlab="")
 dev.copy(png, file="plot2.png", height=480, width=480)
 dev.off()
}