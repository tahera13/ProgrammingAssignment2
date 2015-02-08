# plot 3
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
        
        with (newFile, {
                plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
                lines (Datetime, Sub_metering_2, col = "red")
                lines (Datetime, Sub_metering_3, col = "blue")
                legend("topright", pch = 1, col = c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1), cex = 0.4)
        })
        
        
        dev.copy(png, file="plot3.png", height=480, width=480)
        dev.off()
}