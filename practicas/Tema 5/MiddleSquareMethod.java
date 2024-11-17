import java.util.Scanner;

public class MiddleSquareMethod {
    
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Introduce una semilla de 4 dígitos: ");
        int seed = scanner.nextInt();
        
        System.out.print("Introduce el número de valores aleatorios a generar: ");
        int count = scanner.nextInt();
        
        System.out.println("Números generados:");
        for (int i = 0; i < count; i++) {
            seed = middleSquare(seed);
            System.out.println(seed);
        }
        
        scanner.close();
    }
    
    public static int middleSquare(int seed) {
        // Elevar al cuadrado la semilla
        int squared = seed * seed;
        
        // Convertir el resultado en un String para extraer los dígitos centrales
        String squaredStr = String.format("%08d", squared); // Asegurarse de que el cuadrado tenga 8 dígitos con ceros a la izquierda
        
        // Tomar los cuatro dígitos centrales
        String middleDigits = squaredStr.substring(2, 6);
        
        // Convertir los dígitos centrales de vuelta a entero
        return Integer.parseInt(middleDigits);
    }
}
