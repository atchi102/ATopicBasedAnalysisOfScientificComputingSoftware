
datCPP <- read.csv("CPP100.csv")
datMATLAB <- read.csv("MATLAB.csv")
datR <- read.csv("R.csv")

names(datR)
datR[1:10,]

attach(datR)
Rsorted <- datR[order(Coherence),]
detach(datR)

attach(datCPP)
CPPsorted <- datCPP[order(Coherence),]
detach(datCPP)

attach(datMATLAB)
MATLABsorted <- datMATLAB[order(Coherence),]
detach(datMATLAB)


require(ggplot2)
require(reshape2)

R.df <- data.frame(x=1:100, y=Rsorted$Coherence)
MATLAB.df <- data.frame(x=1:100, y=MATLABsorted$Coherence)
CPP.df <- data.frame(x=1:100, y=CPPsorted$Coherence)

allDocCoher <- rbind(R.df, MATLAB.df, CPP.df)
allDocCoher$Language <- c(rep("R", nrow(R.df)), rep("MATLAB", nrow(MATLAB.df)), rep("CPP",nrow(CPP.df)))

ggplot(data=allDocCoher, aes(x=x, y=y, col=Language)) + theme_bw() + geom_line(aes(colour = Language)) + ylab('Coherence') + xlab('Topic') + ggtitle('Topic Coherence vs Topic') + theme(plot.title = element_text(hjust = 0.5)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggplot(data=allDocCoher, aes(x=x, y=y, col=Language)) + theme_bw() + geom_point(aes(shape=Language, color=Language)) + ylab('Topic Coherence') + xlab('Topic') + ggtitle('Topic Coherence vs Topic') + theme(plot.title = element_text(hjust = 0.5)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
