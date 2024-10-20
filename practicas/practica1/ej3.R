# PROBLEMA 3

# Resolver el problema (paquetes lpSolve) de transporte definido por los siguientes datos: 

  
# Las filas corresponden a los lugares de origen y las columnas a los lugares de destino. Los valores de
# la matriz son los costes de transporte desde cada origen a cada destino. El último elemento de cada
# fila es la oferta de producto en cada origen. El último elemento de cada columna es la demanda
# total en cada destino.

# Cargar la librería lpSolve
library(lpSolve)

# Definir la matriz de costes (Almacenes x Fábricas)
costes <- matrix(c(3, 4, 6, 8, 9,
                   2, 2, 4, 5, 5,
                   2, 2, 2, 3, 3,
                   3, 3, 2, 4, 2), nrow=4, byrow=TRUE)

direction = "min"

# Definir las capacidades de los almacenes
row.signs <- rep("<=", 4)
row.rhs <- c(30, 80, 10, 60)

# Definir la demanda de las fábricas
col.signs <- rep("=", 5)
col.rhs <- c(10, 50, 20, 80, 20)


# Resolver el problema de transporte utilizando lp.transport
resultado <- lp.transport(cost.mat = costes,
                          direction = direction,
                          row.signs = row.signs,
                          row.rhs = row.rhs,
                          col.signs = col.signs,
                          col.rhs = col.rhs) 

# Mostrar los resultados
print(resultado)
print(resultado$solution)  # Matriz de transporte óptima





