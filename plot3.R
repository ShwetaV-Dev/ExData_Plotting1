df <- fread("./desktop/Coursera/household_power_consumption.txt", na.strings = "?")

dt_date <- as.Date(strptime(df$Date, "%d/%m/%Y"))
sub_data <- df[which(dt_date >= "2007-02-01" & dt_date <= "2007-02-02"), ]

dt_date <- as.Date(strptime(sub_data$Date, "%d/%m/%Y"))

##combine the date and time data
dt_datetime <- paste(dt_date, sub_data$Time)
##add DateTime variable to the sub data set
sub_data$DateTime <- as.POSIXct(dt_datetime)

##plot DateTime variable vs Sub_metering_1, Sub_metering_2, Sub_metering_3
with(sub_data, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
lines(sub_data$DateTime, sub_data$Sub_metering_2, col="red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, col="blue")
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.50)
dev.cur()
dev.copy(png, file = "./desktop/Coursera/plot3.png", width = 480, height = 480)
dev.off()
