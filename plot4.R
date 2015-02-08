# plot 2
{
 file <- unzip("exdata-data-household_power_consumption.zip", files = NULL, list = FALSE, overwrite = TRUE,
               junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)
 File <- read.csv(file, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
                  comment.char="", quote='\"')
 File$Date <- as.Date(File$Date, format="%d/%m/%Y")
 
 newFile <- subset(File, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
        rm(File)
 datetime <- paste(as.Date(newFile$Date), newFile$Time)
 newFile$Datetime <- as.POSIXct(datetime)
 
 par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
 with (newFile, {
         plot(Global_active_power~Datetime, type="l", 
               ylab="Global Active Power", xlab="", cex.lab = 0.75)
         plot(Voltage~Datetime, type="l", 
              ylab="Voltage (volt)", xlab="", cex.lab = 0.75)
         plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "", cex.lab = 0.75)
         lines (Sub_metering_2~Datetime, col = "red")
         lines (Sub_metering_3~Datetime, col = "blue")
         legend("topright", pch = 1, col = c("black", "red", "blue"), c("Sub_metering_1",
                                                                        "Sub_metering_2", "Sub_metering_3"),
                cex = 0.4, bty = "n")
         plot(Global_reactive_power~Datetime, type="l", 
              ylab="Global_reactive_power",xlab="", cex.lab = 0.75)
         })
 dev.copy(png, file="plot4.png", height=480, width=480)
 dev.off()
}