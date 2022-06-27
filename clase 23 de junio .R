
install.packages("tidyverse")

getwd(pokemon)

#Cargar base de datos csv:

pokemon <- read.csv("/Users/paulacotte/Documents/Intersemestral R/pokedex_(Update.04.20).csv")

# verbos de dplyr 

## Select 

 pokemon %>% select(-japanese_name)
 
 #Rename
 pokemon %>%
   rename(nombe = name)

 ## Slice
 pokemon %>%
   slice(1:10)

## Count: me permite contar los elementos de una columna 

 pokemon
 
 

