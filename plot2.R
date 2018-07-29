
df <- fread("./desktop/Coursera/household_power_consumption.txt", na.strings = "?")

dt_date <- as.Date(strptime(df$Date, "%d/%m/%Y"))
sub_data <- df[which(dt_date >= "2007-02-01" & dt_date <= "2007-02-02"), ]

dt_date <- as.Date(strptime(sub_data$Date, "%d/%m/%Y"))

##combine the date and time data
dt_datetime <- paste(dt_date, sub_data$Time)
##add DateTime variable to the sub data set
sub_data$DateTime <- as.POSIXct(dt_datetime)

##plot DateTime variable vs Global active power
with(sub_data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)"))
dev.cur()
dev.copy(png, file = "./desktop/Coursera/plot2.png", width = 480, height = 480)
dev.off()