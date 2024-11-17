import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class GeneradorCongruencialMixto2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        // Leer las constantes y la semilla
        System.out.print("Constante multiplicativa (a): ");
        int a = sc.nextInt();
        
        System.out.print("Constante aditiva (c): ");
        int c = sc.nextInt();
        
        System.out.print("Módulo (m): ");
        int m = sc.nextInt();
        
        System.out.print("Semilla inicial (x0): ");
        int semilla = sc.nextInt();
        
        // Valor N para el cálculo de k
        System.out.print("Valor N: ");
        int N = sc.nextInt();
        
        sc.close();

        // Llamar a la función para generar la secuencia y realizar las mejoras
        generarSecuenciaMejorada(semilla, a, c, m, N);
    }

    /**
     * Método que genera números pseudoaleatorios usando el método de congruencia mixta
     * y realiza el proceso mejorado de cálculo de k y reasignación de y.
     */
    private static void generarSecuenciaMejorada(int semilla, int a, int c, int m, int N) {
        Set<Integer> valoresGenerados = new HashSet<>(); // Conjunto para detectar ciclos
        int periodo = 0;  // Contador para el número de valores generados antes del ciclo
        boolean cicloDetectado = false;

        System.out.println("\nSecuencia generada:");

        // Generar números hasta que se detecte un ciclo
        while (!cicloDetectado) {
            // Generar un número aleatorio usando el GCL
            int y = semilla;
            System.out.println("Número " + (periodo + 1) + ": " + y);
            
            // Determinar el índice k = floor(y * N / m)
            int k = (int) Math.floor((double) y * N / m);
            System.out.println("Índice k: " + k);
            
            // Reasignar el valor de y con el valor de la secuencia en el índice k
            semilla = generarGCL(a, c, m, k);  // Generar nuevo número para el índice k
            System.out.println("Nuevo valor de y (jk): " + semilla);

            // Verificar si el número ya fue generado antes (indica un ciclo)
            if (valoresGenerados.contains(semilla)) {
                cicloDetectado = true;
                System.out.println("\nCiclo detectado a partir del número: " + semilla);
                System.out.println("Números generados antes del ciclo: " + periodo);
            } else {
                // Añadir el número al conjunto y continuar
                valoresGenerados.add(semilla);
                periodo++;
            }
        }
    }

    /**
     * Método que genera un número pseudoaleatorio usando el método de congruencia mixta
     * dado un valor de índice k.
     */
    private static int generarGCL(int a, int c, int m, int semilla) {
        return (a * semilla + c) % m;
    }
}
  
