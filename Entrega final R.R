# TRABAJO FINAL ANÁLISIS DE DATOS CON R - Paula Cotte, Simón Rojas, Geraldine lozada 

## Parte 1. Fundamentos de R

### Punto 1.1. Loop If

#### Usted está diseñando un programa que devuelva mensajes automatizados a un 
#### restaurante, de acuerdo con la calificación de sus clientes en una escala 
### de 0 a 30. Para ello, se le pide implementar un loop de R que:
  
#### Imprima en consola "¡Hay mucho por mejorar!" si la calificación está entre 
#### 0 y 10 (excluyendo el 10).
#### Imprima en consola "¡Bien! Pero podría ser excelente." 
#### si la calificación está entre 10 y 20 (sin incluir el 20).
#### Imprima en consola "¡Excelente Servicio! Sigue así." si la calificación 
#### está entre 20 y 30.


calificación <- 10

if (calificación >= 20 & calificación <= 30) {
  print("¡Excelente Servicio! Sigue así")
} else if (calificación >= 10 & calificación <= 19){
    print("¡Bien! Pero podría ser excelente")
} else if (calificación >= 0 & calificación <= 9){
    print("¡Hay mucho por mejorar!")
  } 




###Punto 1.2. Funciones

#### Posteriormente, le indican que hubo un cambio en el sistema de 
#### calificaciones, que permite desagregar la calificación del restaurante en 
#### 3 elementos: calidad de la comida, decoración y servicio, cada uno en escala 
#### de 0 a 30.

####Sin embargo, es necesario que se mantenga un indicador de calificación 
#### conjunto. Para ello, implemente una función en R que reciba 3 argumentos 
#### -calidad, decoracion, servicio- y devuelva la suma de los 3.
#### Además, esta función debe incluir valores por defecto para las variables 
#### en caso de que el usuario no las incluya. Los valores por defecto deben ser:
  
#### Calidad: 10
#### Decoración: 5
#### Servicio: 15


rate_service <- function(Calidad = 10, Decoración = 5, Servicio = 15) {
  s <- (Calidad + Decoración + Servicio)
  return(s)
}

rate_service()
rate_service(27,15,7)
rate_service(2,23,12)

#### Profe dado que en el enunciado decian que se modificaba lo anterior,
#### yo cree dos funciones, una en la que se suman los valores que de el clienta y se 
#### tienen unos por defecto, la funcion nos arroja el valor de la suma de los tres
#### .La otra tiene en cuenta el punto anterior y se escalo dado que no son 1 sino 3 
#### valores entre 0 y 30 que el cliente ingresa, donde 90 es la maxima calificacion y 
#### 0 la menor, se devidio en tres grupos y a cada grupo se le agregó una respuesta. 

## Parte 2. Tidyverse

### Luego de realizar las operaciones anteriores, se le entrega información 
### sobre los precios y calificaciones de 168 restaurantes italianos en 
### Manhattan, separada en dos archivos: price_ratings.csv y restaurant_locations.csv.

### La primera tabla contiene un identificador único para los restaurantes (Id), 
### una columna que incluye varias medidas asociadas al restaurante (Variable) y 
### el valor específico de dichas medidas (Value).

### La segunda tabla contiene un identificador único para los restaurantes 
### (Id_restaurant), el nombre del Restaurante (Restaurant), y una variable que 
### indica si el restaurante se ubica al este o al oeste de 5th Avenue (East).
 
library(tidyverse)

### Punto 2.1. Cargar datos

#### Usando la función read_csv() cargue ambos archivos en su entorno de trabajo. 
#### Posteriormente imprima en consola la estructura de ambos dataframes y 
#### las primeras 8 filas.

datos_1 <- read_csv2("/Users/paulacotte/Documents/Intersemestral R/DATOS/price_ratings.csv")
datos_2 <- read_csv2("/Users/paulacotte/Documents/Intersemestral R/DATOS/restaurant_locations.csv")

# Estructura base de datos price ratings 

str(datos_1)
glimpse(datos_1)
head(datos_1, 8)

# Estructura base de datos restauranst location 

str(datos_2)
glimpse(datos_2)
head(datos_2, 8)


####¿Ambos dataframes cumplen con que cada fila es una observación y cada 
#### columna es una variable?

#### R/ Es correcto, en el caso de la base de datos de la ubicacion de los restaurantes, 
#### esta tiene 3 columnas en las que se identifican el restaurante, su nombre y la ubicacion, 
#### En la columna de lso precios encontramos en una columna la de "variable" otras variables, 
#### por lo que en una sola columna hay mas de una variable.


### Punto 2.2. Pivot

#### Utilizando las funciones vistas en clase y que hacen parte del tidyverse, 
#### convierta el dataframe del archivo price_ratings.csv en formato wide. 
#### Es decir, que Price, Food, Decor y Service sean columnas individuales.
#### Nota: Esto implica que el dataframe resultante debe tener 168 filas y 5 columnas.


datos_1_largos <- datos_1 %>%
  pivot_wider(names_from = Variable, values_from = Valor)

str(datos_1_largos)

### Punto 2.3. Joins

#### Usando las funciones vistas en clase, una las dos tablas con base en las 
#### columnas que identifican los restaurantes: Id y Id_restaurant.
####Nota: Utilice la función inner_join() para resolver el punto.


base_completa <- inner_join(x = datos_1_largos, y = datos_2, 
                            by = c("Id" = "Id_restaurant"))


### Punto 2.4. Select y arrange

#### Con base en el dataframe completo que resulta del punto anterior, escriba 
#### la secuencia de comandos que devuelve un dataframe que contenga las 
#### columnas de nombre, precio y servicio, ordenados según la variable precio.

base_completa %>% 
  select(Restaurant,Price,Service) %>%
  arrange(Price)

base_completa %>% 
  select(Restaurant,Price,Service) %>%
  arrange(desc(Price))

#### ¿Cuál es el restaurante más caro? ¿Cuál es el más barato?
  
#### R/  El restaurante mas caro es Harry Cipriani con un precio de $65 USD y el mas 
#### barato es Lamarca con un precio de $19 UDS.


### Punto 2.5. Group_by y Summarise

#### Usando el dataframe completo, construya un dataframe que agrupe los 
#### restaurantes de acuerdo con la variable East y calcule el precio promedio 
#### de la comida.

datos_location <- base_completa %>%
  group_by(East) %>%
  summarise(precio_promedio = mean(Price)) %>%

#### ¿La comida es más cara en el lado Este o el lado Oeste de Manhattan?
#### R / La comida es mas cara en el lado Este de Manhattan con un precio promedio de 
#### $44 UDS meintras que en el oeste le precio promedio es de $40 UDS 
  
## Parte 3. Análisis estadístico

### Punto 3.1. Regresión lineal

library(car)
  
#### Usando la función lm() de R, construya una regresión lineal de la variable 
#### Price contra Food, Decor, Service y East y guarde el resultado en un objeto 
#### llamado regresion.
#### Posteriormente, ejecute el comando summary(regresion).

regresion <- lm((Price ~ Food + Decor + Service + East),data = base_completa)
summary(regresion)

#### ¿Todas las variables son estadísticamente significaticas? ¿Qué variable 
#### parece influir más en el precio de la comida?
#### R/ La única variable estadisticamente significativa es el servicio, de acuerdo a
#### los niveles de signifcancia arrojados en la regrsion, sin embargo, 
#### se podria decir que la ubicacion, es decir, si el restaurante se encuentra en el este 
#### o no influye en mayor medida sobre el precio con una pnderacion de 2.06
  
## Parte 4. Visualización de datos

library(ggplot2)

### Punto 4.1. Gráfico de Densidad

#### Cree un gráfico con la estimación de la función de densidad para la 
#### variable Service, con el atributo linetype asociado a la variable East. 
#### Añada un título de su elección y cambie los nombres de los ejes y la 
#### leyenda para que aparezcan en español.

ggplot(base_completa, aes(Service, linetype = factor(East))) +
  geom_density() +
  labs (
    title = "Servicio de acuerdo a ubicación en Manhattan",
    x = "Servicio",
    y = "Densidad",
    linetype = "Este",
    fill = "Este"
  )

#### ¿Cuál zona de Manhattan tiende a tener mejor calificación de servicio?

#### R/ La gráfica nos indica que la zona este tiene una mayor densidad en la zona
#### derecha del gráfico que nos indica una mejor calificación en el servicio.




### Punto 4.2. Gráfico de Dispersión

####Cree un gráfico de dispersión entre las variables Price y Decor, donde el 
####color de los puntos esté asociado a la variable East. Modifique la escala 
### de color de tal forma que:
#### El color de 0 sea azul y de 1 sea verde.
#### La etiqueta de 0 sea Oeste y de 1 sea Este.

ggplot(base_completa, aes(x = Price, y = Decor, colour = factor(East))) +
  geom_point() + 
  scale_color_manual(
    labels = c("Oeste",
               "Este"),
    values = c("Light Blue",
               "Green")
  )


#### Según el gráfico, ¿A qué zona de Manhattan pertenece el restaurante con menor precio?

#### R/ El restaurante con el precio más bajo se encunetra en la zona Oeste de Manhattan





