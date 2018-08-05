
datCPP <- read.csv("CPP100.csv")
datMATLAB <- read.csv("MATLAB.csv")
datR <- read.csv("R.csv")

names(datR)
datR[1:10,]

attach(datR)
Rsorted <- datR[order(Uniform.Dist),]
detach(datR)

attach(datCPP)
CPPsorted <- datCPP[order(Uniform.Dist),]
detach(datCPP)

attach(datMATLAB)
MATLABsorted <- datMATLAB[order(Uniform.Dist),]
detach(datMATLAB)


require(ggplot2)
require(reshape2)

R.df <- data.frame(x=1:100, y=Rsorted$Uniform.Dist)
MATLAB.df <- data.frame(x=1:100, y=MATLABsorted$Uniform.Dist)
CPP.df <- data.frame(x=1:100, y=CPPsorted$Uniform.Dist)

allDocUnif <- rbind(R.df, MATLAB.df, CPP.df)
allDocUnif$Language <- c(rep("R", nrow(R.df)), rep("MATLAB", nrow(MATLAB.df)), rep("CPP",nrow(CPP.df)))

ggplot(data=allDocUnif, aes(x=x, y=y, col=Language)) + theme_bw() + geom_line(aes(colour = Language)) + ylab('Topic Uniformity') + xlab('Topic') + ggtitle('Topic Uniformity vs Topic') + theme(plot.title = element_text(hjust = 0.5)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggplot(data=allDocUnif, aes(x=x, y=y, col=Language)) + theme_bw() + geom_point(aes(shape=Language, color=Language)) + ylab('Topic Uniformity') + xlab('Topic') + ggtitle('Topic Uniformity vs Topic') + theme(plot.title = element_text(hjust = 0.5)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
