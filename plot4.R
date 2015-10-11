plot4<-function(){
  
  dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
  dat<-dat[dat$Date>=as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]
  dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
  dat$Voltage<-as.numeric(as.character(dat$Voltage))
  png(filename = "plot4.png",width = 480, height = 480)
  par(mfrow=c(2,2))
  
  plot(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Global_active_power,type="n",xlab="",ylab="Global Active Power")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Global_active_power,xlab="",ylab="Global Active Power",pch="")
  
  plot(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Voltage,type="n",xlab="datetime",ylab="Voltage")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Voltage,pch="",ylim=c(min(dat$Voltage),max(dat$Voltage)))
                                                                                                                        
  
  plot(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_1,pch="")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_2,pch="",col="red")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Sub_metering_3,pch="",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=1)
  
  plot(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
  lines(strptime(paste(as.character(dat$Date),as.character(dat$Time),sep=""),"%Y-%m-%d %H:%M:%S"),dat$Global_reactive_power,pch="")
  
  dev.off()
}