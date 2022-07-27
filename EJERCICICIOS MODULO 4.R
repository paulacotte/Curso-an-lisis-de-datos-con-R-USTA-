## EJERCICIOS MODULO 4 - Paula Cotte - Simón Rojas - Geraldine Lozada 

library(ggplot2)
library(tidyverse)
library(patchwork)

datos_musica <- read_csv("/Users/paulacotte/Documents/Intersemestral R/DATOS/songs_normalize.csv")


## 1. Elabore un gráfico de dispersión con las variables danceability y valence, 
## que tenga los puntos de color azúl y una transparencia de 0.3.

ggplot(datos_musica, aes(x = danceability, y = valence)) +
  geom_point(color = "blue",
             alpha = 0.3)

## 2. Elabore un boxplot con la variable mode en el eje x y la variable 
##energy en el eje y. Asigne el color de las cajas de acuerdo con la 
## variable mode y elimine la leyenda.


ggplot(datos_musica, aes(x = factor(mode), y = energy, colour = factor(mode))) +
  geom_boxplot() +
  labs (x = NULL)


## 3. Usando el paquete {patchwork}, construya una salida gráfica con los 4 
## gráficos anteriores de tal modo que aparezcan así:


p1 <- ggplot(datos_musica, aes(x = danceability, y = valence)) +
  geom_point(color = "blue",
             alpha = 0.3)

p2 <- ggplot(datos_musica, aes(x = factor(mode), y = energy, colour = factor(mode))) +
  geom_boxplot() +
  labs (x = NULL)

p1 + p2

