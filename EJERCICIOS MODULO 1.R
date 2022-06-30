# EJERCICIOS MODULO 1
# 1. 
## a. La principal diferencia es que con los ventores creados con la función 
## c() solo se pueden incluir elementos de un solo formato, al usar la función 
## list() podemos incluir elementos de diferentes clases, como texto, fechas 
## y números todo en uno solo, algo que no es posible con c() ya que esta 
## función toma todos los elementos como de una msima clase.

## b. el ejecutar mi_lista[0] nos va a mostrar el elemento en la posición 
## indicada de la lista, mientras que, al utilizar mi:lista[[0]] va a extraer el 
## elemento de la lista, se podria decir que "separa" el elemento de la lista y lo
## muestra

#2.

matriz <- matrix(rep(1:7,4), ncol = 4, nrow = 7, byrow = TRUE )

print(matriz)
##a. 
matriz[1:7, 2]
##b.
matriz[3,1:4]
##c. 
matriz[3:7,1:4]
##d. 
matriz[1:2,2:4]

#3.

numero <- 3

if (numero%%2 == 0) {
  print("El número es par")
  if (numero%%2 !=0){
    print("El numero es impar")
  }
} 


#4.

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")

for (nombre in nombres) {
  print(paste("Bienvenido", nombre, "!")) 
}



#5. 

mi_funcion <- function(numero, exponente = 1) {
  return(numero ^ exponente) 
}

respuesta <- mi_funcion(15,3)

respuesta

