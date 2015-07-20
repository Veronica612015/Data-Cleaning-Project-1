# read in the file using read table and set nrows to reduce memory
power = read.table("household_power_consumption.txt", nrows = 2075259, header=TRUE, sep = ";", quote = "\"", na.string="?")

# combine the date and time fields and then convert the date to a date object

power$DateTime <- do.call(paste, c(power[c("Date", "Time")], sep = "")) 
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y%H:%M:%S")

#use subset to just select Feb 1, 2007 and Feb 3, 2007
powerFeb = subset(power, power$DateTime >= "2007-02-01" & power$DateTime <= "2007-02-03" )

#Draw the scatterplot with lines to the file plot2.png
png(file= "plot2.png", width=480, height = 480)

with(powerFeb, plot(DateTime, Global_active_power,
     ylab="Global Active Power (kilwatts)",  type = "l",  
     xlim=c(as.POSIXct("2007-02-01", format="%Y-%m-%d"), as.POSIXct("2007-02-03", format="%Y-%m-%d"))))

dev.off()
