library(datasets)

ds <- read.table("household_power_consumption.txt", sep=",", header = TRUE)

ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

ds$Time <- format(ds$Time, "%T")


global_active_power <- subset(ds, Date == "2007-02-01" | Date == "2007-02-02")$Global_active_power


png("plot1.png", width = 480, height = 480)

hist(as.numeric(as.character("activePowerVals")), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")


dev.off()
