plot2 <- function() {
  ## Read data; set your working directory where file sits
  epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
  epc$DateTime<-paste(epc$Date,epc$Time)
  epc$DateTime.c<-strptime(epc$DateTime, format="%d/%m/%Y %H:%M:%S")
  
  epc$Date<-as.Date(as.character(epc$Date),"%d/%m/%Y")
  epc<-subset(epc, as.Date(Date)=='2007-02-01' | as.Date(Date)=='2007-02-02')
  epc$Global_active_power<-as.numeric(epc$Global_active_power)
  
  plot(epc$DateTime.c,epc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()
}