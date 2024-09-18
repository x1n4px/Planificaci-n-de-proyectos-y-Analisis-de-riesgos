# PROBLEMA 2

# Distribución de almacenes y fábricas.
#Una empresa de distribución tiene tres almacenes que denominaremos A1, A2 y A3, y cuatro
#fábricas que denominaremos F1, F2, F3 y F4. Los almacenes A1, A2 y A3 tienen una capacidad
#máxima de 100, 200 y 150 piezas respectivamente. Las fábricas F1, F2, F3 y F4 tienen unos
#requisitos mínimos de materia primera de 100, 115, 80 y 105 piezas respectivamente. En la siguiente
#tabla tenemos los costes de transportar una pieza de materia prima desde cada uno de los almacenes
#a cada una de las fábricas, y el resumen de capacidades y demandas

# Cargar la librería lpSolve
library(lpSolve)

# Definir la matriz de costes (Almacenes x Fábricas)
costes <- matrix(c(4, 6, 5, 9,
                   8, 7, 9, 4,
                   7, 8, 7, 6), nrow=3, byrow=TRUE)

direction = "max"

# Definir las capacidades de los almacenes
row.signs <- rep("<=", 3)
row.rhs <- c(100,200,150)

# Definir la demanda de las fábricas
col.signs <- rep(">=", 4)
col.rhs <- c(100, 115, 80, 105)


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

