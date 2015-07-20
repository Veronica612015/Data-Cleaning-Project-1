# read in the file using read table and set nrows to reduce memory
power <- read.table("household_power_consumption.txt", nrows = 2075259, header=TRUE, sep = ";", quote = "\"", na.string="?")

# combine the date and time fields and then convert the date to a date object

power$DateTime <- do.call(paste, c(power[c("Date", "Time")], sep = "")) 
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y%H:%M:%S")

#use subset to just select Feb 1, 2007 and Feb 3, 2007
powerFeb <- subset(power, power$DateTime >= "2007-02-01" & power$DateTime <= "2007-02-03" )

#Draw the scatterplot with lines for all three sub metering reads to the file plot3.png

png(file= "plot3.png", width=480, height = 480)

 plot(powerFeb$DateTime, powerFeb$Sub_metering_1, col ="black",
    ylab="Energy Sub Metering", xlab="", type = "l",  
    xlim=c(as.POSIXct("2007-02-01", format="%Y-%m-%d"), as.POSIXct("2007-02-03", format="%Y-%m-%d")),
    ylim=c(0,40))
    legend("topright",lty=1,bty="n",col=c("black","red","blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  par(new=TRUE)
  plot(powerFeb$DateTime, powerFeb$Sub_metering_2,  type = "l",  axes = FALSE, xlab = "", ylab = "",col="red",ylim=c(0,40))
  par(new=TRUE)
  plot(powerFeb$DateTime, powerFeb$Sub_metering_3,  type = "l",  axes = FALSE, xlab = "", ylab = "",col="blue",ylim=c(0,40))
  
         
 dev.off()
