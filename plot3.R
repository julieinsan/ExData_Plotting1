library(sqldf)

if (!file.exists("household_power_consumption.txt")) {
  print("Cannot find file")
} else {
  ## Read in data and merge date and time
  data <- read.csv.sql("household_power_consumption.txt", sql='select * from file where Date= "1/2/2007" or Date="2/2/2007"',sep=";")
  data$dt <- paste(data$Date, data$Time, sep=" ")
  data$datet <- strptime(data$dt, "%d/%m/%Y %H:%M:%S")
  
  ## plot sub_metering variables by time
  attach(data)
  png("plot3.png", width=480, height=480)
    plot(datet,Sub_metering_1, type="n",main="", xlab="", ylab="Energy sub metering")
      lines(datet,Sub_metering_1, col="black")
      lines(datet,Sub_metering_2, col="red")
      lines(datet,Sub_metering_3, col="blue")
      legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
  dev.off()
}

