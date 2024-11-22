# Variables iniciales
A = 0.75  # Asigna el valor deseado
B = 0.25 # Asigna el valor deseado
C = 0.90  # Asigna el valor deseado
D = 0.60  # Asigna el valor deseado
E = 0.10  # Asigna el valor deseado
F = 0.40  # Asigna el valor deseado

# Cálculos
X1 = C * A
X2 = E * A
X3 = F * B
X4 = D * B

Y1 = X1 + X3
Y2 = X2 + X4

# Evitamos división por cero
T1 = X1 / Y1 if Y1 != 0 else None
T2 = X2 / Y2 if Y2 != 0 else None
T3 = X3 / Y1 if Y1 != 0 else None
T4 = X4 / Y2 if Y2 != 0 else None

# Resultados
print("Probabilidades conocidas")
print(f"P(S1) = {round(A, 2)}")
print(f"P(S2) = {round(B, 2)}")
print(f"P(ES1|S1) = {round(C, 2)}")
print(f"P(ES2|S2) = {round(D, 2)}")
print(f"P(ES2|S1) = {round(E, 2)}")
print(f"P(ES1|S2) = {round(F, 2)}")
print("Probabilidad conjuntas")
print(f"P(ES1,S1) = {round(X1, 2)}")
print(f"P(ES2,S1) = {round(X2, 2)}")
print(f"P(ES1,S2) = {round(X3, 2)}")
print(f"P(ES2,S2) = {round(X4, 2)}")
print("Probabilidades totales")
print(f"P(ES1) = {round(Y1, 2)}")
print(f"P(ES2) = {round(Y2, 2)}")
print("Probabilidades a posteriori")
print(f"P(S1/ES1) = {round(T1, 2)}")
print(f"P(S1/ES2) = {round(T2, 2)}")
print(f"P(S2/ES1) = {round(T3, 2)}")
print(f"P(S2/ES2) = {round(T4, 2)}")

