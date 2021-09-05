library(datasets)

ds <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

ds$date.time <- as.POSIXct(paste(ds$Date, ds$Time), format = "%d/%m/%Y %T")



ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

ds$Time <- format(ds$Time, "%T")

subds <- subset(ds, Date == "2007-02-01" | Date == "2007-02-02")



png("plot4.png", width = 480, height = 480)


par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))


plot(subds$date.time, as.numeric(as.character(subds$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")



plot(subds$date.time, as.numeric(as.character(subds$Voltage)), type = "l",
     xlab = "datetime", ylab = "Voltage")



plot(subds$date.time, sub_1, col = "black", type = "l", xlab = "", 
     ylab = "Energy sub metering")



lines(subds$date.time, sub_2, col = "red", type = "l")

lines(subds$date.time, sub_3, col = "blue", type = "l")



legend('topright','groups', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, col=c('black','red','blue'), bty = "n")



plot(subds$date.time, as.numeric(as.character(subds$Global_reactive_power)), 
     type = "l", xlab = "datetime", ylab = "Global_active_power")



dev.off()
