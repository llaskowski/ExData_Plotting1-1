plot3<-function() {
  
    dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
    dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
    dat<-dat[dat$Date>=as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]
    dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
    png(filename = "plot3.png",width = 480, height = 480)
    plot(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_1,xlab="",pch="")
    lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_2,xlab="",pch="",col="red")
    lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_3,xlab="",pch="",col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=1)
    dev.off()
  
}