
library(readxl)
library(ggplot2)
library(fGarch)
library(TSA)
library(quantmod)
library(forecast)
library(tidyverse)
library(caTools)
library(fTrading)

rendimientos<- data.frame(diff(log(acciones192$bancolombia)),diff(log(acciones192$cemeargos)),
                         diff(log(acciones192$ecopetrol)),diff(log(acciones192$almexito)))
View(rendimientos)

rendimientos_medios<-data.frame(mean(rendimientos$diff.log.acciones192.bancolombia..),
                                mean(rendimientos$diff.log.acciones192.cemeargos..),
                                mean(rendimientos$diff.log.acciones192.ecopetrol..),
                                mean(rendimientos$diff.log.acciones192.almexito..))


matrizcov <- cov(rendimientos)
View(matrizcov)
matrizcov
matrizcov2 <- 2*matrizcov
matrizcov2

matrizdatos <- cbind(rbind(matrizcov2, c(1,1,1,1,1)),c(1,1,1,1,0))
View(matrizdatos)

inversamatriz<-solve(matrizdatos)
View(inversamatriz)

vector0<-c(0,0,0,0,1)
length(vector0)
View(vector0)     


solucion<-inversamatriz%*%vector0
View(solucion)
w <-(solucion[-5])*100
View(w)

t(w)
Varianza <- t(w)%*%matrizcov%*%w
devesta<-sqrt(Varianza)
View(devesta) 
valoriesgo<-qnorm(0.95)*1000



