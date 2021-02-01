### Loading the package `ggplot2` ###

library(ggplot2)

### The function Timeline ###

Timeline<-function(TimePoints,PaymentTime,PaymentAmount,Colour,ArrowColour,FontSize)
{

#Data frame with details on payment time and payment amount
PaymentIndex<-c();
for(i in 1:length(PaymentTime))
{PaymentIndex<-c(PaymentIndex,which(PaymentTime[i]==TimePoints))}
PaymentData<-data.frame(PaymentIndex=PaymentIndex,PaymentTime=PaymentTime,PaymentAmount=PaymentAmount)

#Determining where to place the small time ticks
TickPoints<-TimePoints[TimePoints!="dots"]
TickIndex<-c();
for(i in 1:length(TickPoints))
{TickIndex<-c(TickIndex,which(TickPoints[i]==TimePoints))}
TickData<-data.frame(TickIndex=TickIndex)

#Making the plot
Timeline<-ggplot(PaymentData,aes(x=PaymentIndex,y=0))
Timeline<-Timeline+theme_classic()

#Drawing the horizontal timeline
Timeline<-Timeline+geom_hline(yintercept=0, color = "black", size=0.3)

#Adding the small time ticks
Timeline<-Timeline+geom_segment(data=TickData, aes(x=TickIndex,y=0.2,xend=TickIndex,yend=-0.2), color='black', size=0.2)

#Adding the payment arrows and amounts
Timeline<-Timeline+geom_segment(data=PaymentData, aes(y=1,yend=0,xend=PaymentIndex),arrow = arrow(length = unit(0.2, "cm")), color=ArrowColour, size=0.2)
Timeline<-Timeline+geom_text(data=PaymentData,aes(y=1.3,label=PaymentAmount),size=FontSize,color=Colour)

#Data on the time points
TimePointsData<-data.frame(Time=seq(1,length(TimePoints)),TimeLabel=replace(TimePoints,TimePoints=="dots",". . ."))

#Adding the time points
Timeline<-Timeline+geom_text(data=TimePointsData, aes(x=Time,y=-0.4,label=TimeLabel),size=3,vjust=0.5, color='black')

#Adding the label "Time"
Timeline<-Timeline+geom_text(data=TimePointsData, aes(x=length(TimePoints)+1,y=-0.4,label="Time"),size=3,vjust=0.5, color='black')

#Hiding the grid
Timeline<-Timeline+theme(axis.line.y=element_blank(),
                         axis.text.y=element_blank(),
                         axis.title.x=element_blank(),
                         axis.title.y=element_blank(),
                         axis.ticks.y=element_blank(),
                         axis.text.x =element_blank(),
                         axis.ticks.x =element_blank(),
                         axis.line.x =element_blank(),
                         legend.position = "none"
)

#Centering the diagram by adding an invisible point
Timeline<-Timeline+geom_point(data=TimePointsData,aes(x=1,y=-1),colour="white")

#Adjusting the margin to obtain an appropriate scale for the timeline
Timeline <-  Timeline+theme(plot.margin=margin(4.5-(FontSize-3)/5,0.5,4.5-(FontSize-3)/5,0.5,unit="cm"))

Timeline
}

### Example 1 ###

TimePoints<-c(0,1,2,3,4,5)
PaymentTime<-c(2,4)
PaymentAmount<-c(200,300)

Timeline(TimePoints,PaymentTime,PaymentAmount,'blue','blue',2.5)
Timeline(TimePoints,PaymentTime,PaymentAmount,'purple','orange',2.5)
Timeline(TimePoints,PaymentTime,PaymentAmount,'#21618c','#117864',2.5)
Timeline(TimePoints,PaymentTime,PaymentAmount,'#21618c','#117864',4)

### Example 2 ###

TimePoints<-c(0,1,2,3,"dots",20)
PaymentTime<-c(1,2,3,20)
PaymentAmount<-c(500,500,500,500)

Timeline(TimePoints,PaymentTime,PaymentAmount,'black','black',2.5)

### Example 3 ###

TimePoints<-c(0,1,2,3,4,5,"dots",20,"dots")
PaymentTime<-c(1,2,3,4,5,20)
PaymentAmount<-c(100,200,300,150,50,50)

Timeline(TimePoints,PaymentTime,PaymentAmount,'blue','blue',2.5)


### Example 4 ###

TimePoints<-c(0,1,2,3,"dots",20,"dots")
PaymentTime<-c(1,2,3,20)
PaymentAmount<-c(500,500,500,500)

Timeline(TimePoints,PaymentTime,PaymentAmount,'black','black',2.5)

### Example 5 ###

TimePoints<-c(0,1,2,3,"dots",20,"dots")
PaymentTime<-c(1,2,3,20)
PaymentAmount<-c("R","R","R","R")

Timeline(TimePoints,PaymentTime,PaymentAmount,'black','black',2.5)

### Example 6 ###

TimePoints<-c(0,1,2,3,"dots",20,"dots")
PaymentTime<-c(1,2,3,20)
PaymentAmount<-c("\u20ac 500","\u20ac 500","\u20ac 500","\u20ac 500")

Timeline(TimePoints,PaymentTime,PaymentAmount,'red','red',2.5)

### Example 7 ###

TimePoints<-c(0,1,"dots","m","m+1","dots","n-k","n-k+1","dots","n","dots")
PaymentTime<-c(1,"m","n-k+1","n")
PaymentAmount<-c("\u20ac 200","\u20ac 200","\u20ac 400","\u20ac 400")

Timeline(TimePoints,PaymentTime,PaymentAmount,'purple','purple',2.5)