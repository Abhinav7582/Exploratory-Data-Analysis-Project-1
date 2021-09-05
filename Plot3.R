library(datasets)

ds <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

ds$date.time <- as.POSIXct(paste(ds$Date, ds$Time), format = "%d/%m/%Y %T")


ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

ds$Time <- format(ds$Time, "%T")

subDs <- subset(ds, Date == "2007-02-01" | Date == "2007-02-02")


sub_1 <- as.numeric(as.character(subDs$Sub_metering_1))

sub_2 <- as.numeric(as.character(subDs$Sub_metering_2))

sub_3 <- as.numeric(as.character(subDs$Sub_metering_3))


png("plot3.png", width = 480, height = 480)


plot(subDs$date.time, sub_1, col = "black", type = "l", xlab = "", 
     ylab = "Energy sub metering")


lines(subDs$date.time, sub_2, col = "red", type = "l")

lines(subDs$date.time, sub_3, col = "blue", type = "l")


legend('topright','groups', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, col=c('black','red','blue'))


dev.off()