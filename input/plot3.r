library("data.table")
dat<-fread("./data/household_power_consumption.txt")

dat3<-dat[(dat$Date=="2/2/2007") | (dat$Date=="1/2/2007")]
rm(dat)

x<-with(dat3, paste(Date,Time))
y<-strptime(x,"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","us")
with(dat3,plot(y,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",
               cex.axis=0.75, cex.lab=0.75))
with(dat3,lines(y,Sub_metering_2,type="l",col="red"))
with(dat3,lines(y,Sub_metering_3,type="l",col="blue"))
legend("topright", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.75)
dev.copy(png, file="plot2.png",width=480, height=480, units="px")
dev.off()
