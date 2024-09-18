# PROBLEMA 2

# Distribución de almacenes y fábricas.
#Una empresa de distribución tiene tres almacenes que denominaremos A1, A2 y A3, y cuatro
#fábricas que denominaremos F1, F2, F3 y F4. Los almacenes A1, A2 y A3 tienen una capacidad
#máxima de 100, 200 y 150 piezas respectivamente. Las fábricas F1, F2, F3 y F4 tienen unos
#requisitos mínimos de materia primera de 100, 115, 80 y 105 piezas respectivamente. En la siguiente
#tabla tenemos los costes de transportar una pieza de materia prima desde cada uno de los almacenes
#a cada una de las fábricas, y el resumen de capacidades y demandas
# Cargar la librería
library(lpSolve)

# Definir la función objetivo (costos)
costos <- c(4, 6, 5, 9, 8, 7, 9, 4, 7, 8, 7, 6)

# Definir las restricciones de capacidad (desigualdades)
capacidades <- matrix(c(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,  # A1
                        0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,  # A2
                        0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1), # A3
                      nrow = 3, byrow = TRUE)

rhs_capacidades <- c(100, 200, 150)  # Capacidades máximas

# Definir las restricciones de demanda (igualdades)
demandas <- matrix(c(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0,  # F1
                     0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,  # F2
                     0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0,  # F3
                     0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), # F4
                   nrow = 4, byrow = TRUE)

rhs_demandas <- c(100, 115, 80, 105)  # Demandas mínimas

# Unir todas las restricciones
restricciones <- rbind(capacidades, demandas)

# Definir los sentidos de las restricciones ("<=", "=", etc.)
sentidos <- c(rep("<=", 3), rep("=", 4))

# Resolver el problema de PL
resultado <- lp(direction = "min", objective.in = costos, const.mat = restricciones, 
                const.dir = sentidos, const.rhs = c(rhs_capacidades, rhs_demandas))

# Mostrar los resultados
print(paste("Costo mínimo total:", resultado$objval))
print("Piezas transportadas desde cada almacén a cada fábrica:")
print(matrix(resultado$solution, nrow = 3, byrow = TRUE))
