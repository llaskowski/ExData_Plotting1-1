plot1<-function (){
dat<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
dat$Date<-as.Date(dat$Date,"%d/%m/%Y")
dat<-dat[dat$Date>=as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]
windows.options(width=480,height=480)
png(filename = "plot1.png",width = 480, height = 480)
hist(as.numeric(as.character(dat$Global_active_power)),xlim=c(0,6),breaks=16,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()
}