plot2<-function() {
  dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
  dat<-dat[dat$Date>=as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]
  dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
  png(filename = "plot2.png",width = 480, height = 480)
  plot(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",pch="")
  dev.off()
}