# TALLER MODÚLO 2

## 1. Cargue la base de datos a su entorno de trabajo, imprima en consola la estructura 
## de la base de datos e imprima las primeras 10 filas, usando las funciones 
## incluidas en el tidyverse.

library(tidyverse)
library(readxl)
library(ggplot2)

datos_internet <- read_excel("Documents/Intersemestral R/all_csv sorted.xlsm",  
                             col_types = c("text", 
                                           "text", "text", 
                                           "text", "numeric", 
                                           "numeric", "numeric", 
                                           "numeric", "numeric", 
                                           "numeric", "numeric", 
                                           "numeric", "numeric"))

datos_internet %>%
  head(10)

## 2. Usando las funciones del paquete naniar, cree un dataframe que muestre el 
## número de datos faltantes para cada una de las columnas de la base de datos.

library(naniar)


miss_var_summary(datos_internet)
N_A <- miss_var_summary(datos_internet)

N_A

## Cree una nueva columna que contenga el cambio porcentual en el precio del 
##internet entre 2020 y 2021 y ordene la base de datos según esa columna. 
##¿Cuáles son los 10 países en los que el precio incrementó más?


datos_internet %>%
  mutate(Price_change = `Average price of 1GB (USD  at the start of 2021)` - `Average price of 1GB (USD ‚Äì at start of 2020)` / `Average price of 1GB (USD ‚Äì at start of 2020)` * 100) %>%
  arrange((Price_change)) %>%
  head(10)

## En la base de datos_internet2 podemos ver en la columna Price_change que 
## los países con mayor cambio porcentual en el precio del internet entre el 2020 
## y 2021 fueron: India, Israel, Kyrdyztan, Italia, Kazagistan, Ucrania, 
## Somalia, Sri lanka, Rusia y Vietnam.

## 4.  Encuentre la velocidad promedio de internet en Megabits para cada una de 
##las regiones incluidas en la variable Continental region. 
##¿Cuál es la región con el internet más lento?

datos_internet %>%
  group_by(`Continental region`) %>%
  summarise(Avg_Internet_speed=mean(Avg, na.rm = TRUE)) %>%
  arrange(Avg_Internet_speed)

## De acuerdo a los resultados la región con internet más lento es África subsahariana 


## 5. Usando el paquete ggplot2, elabore un gráfico de dispersión con las variables 
##de velocidad promedio y porcentaje de usarios de internet. ¿Se podría 
##afirmar que hay una correlación entre las dos variables?


datos_grafica <- datos_internet %>%
  mutate("Percent_users" = `Internet users`/ Population * 100) 

ggplot(datos_grafica, aes(x = Avg, y = Percent_users)) +
  geom_point()

## Al correr el codigo de la gráfica nos arroja como error que por valores NA fueron
## removidas 235 columnas, por lo que los puntos de el gráfico son pocos, sin embargo, 
## se puede observar que a medida que aumenta el procentaje de usuarios aumenta la velocidad 
## promedio del internet, a pesar de ser un gráfico muy disperso.





