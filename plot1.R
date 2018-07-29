
df <- fread("./desktop/Coursera/household_power_consumption.txt", na.strings = "?")
dt_date <- as.Date(strptime(df$Date, "%d/%m/%Y"))
sub_data <- df[which(dt_date >= "2007-02-01" & dt_date <= "2007-02-02"), ]

##plot histogram of global active power
hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.cur()
dev.copy(png, file = "./desktop/Coursera/plot1.png", width = 480, height = 480)
dev.off()
