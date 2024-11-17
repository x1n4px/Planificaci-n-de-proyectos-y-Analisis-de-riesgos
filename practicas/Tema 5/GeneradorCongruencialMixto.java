import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class GeneradorCongruencialMixto {
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
        
        sc.close();

        // Llamar a la función para generar la secuencia y detectar ciclos
        detectarCiclo(semilla, a, c, m);
    }

    /**
     * Método que genera números pseudoaleatorios usando el método de congruencia mixta
     * y detecta ciclos en la secuencia.
     */
    private static void detectarCiclo(int semilla, int a, int c, int m) {
        Set<Integer> valoresGenerados = new HashSet<>(); // Conjunto para detectar ciclos
        int periodo = 0;  // Contador para el número de valores generados antes del ciclo
        boolean cicloDetectado = false;

        System.out.println("\nSecuencia generada:");

        // Generar números hasta que se detecte un ciclo
        while (!cicloDetectado) {
            System.out.println("Número " + (periodo + 1) + ": " + semilla);
            
            // Verificar si el número ya fue generado antes (indica un ciclo)
            if (valoresGenerados.contains(semilla)) {
                cicloDetectado = true;
                System.out.println("\nCiclo detectado a partir del número: " + semilla);
                System.out.println("Números generados antes del ciclo: " + periodo);
            } else {
                // Añadir el número al conjunto y continuar
                valoresGenerados.add(semilla);
                semilla = (a * semilla + c) % m;
                periodo++;
            }
        }
    }
}
