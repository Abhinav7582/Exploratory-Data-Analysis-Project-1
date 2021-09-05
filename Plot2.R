library(datasets)

ds <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

ds$date.time <- as.POSIXct(paste(ds$Date, ds$Time), format = "%d/%m/%Y %T")


ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

ds$Time <- format(ds$Time, "%T")

subDs <- subset(ds, Date == "2007-02-01" | Date == "2007-02-02")


png("plot2.png", width = 480, height = 480)


plot(subDs$date.time, as.numeric(as.character(subDs$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


dev.off()