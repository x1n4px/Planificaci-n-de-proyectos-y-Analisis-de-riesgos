import networkx as nx
import matplotlib.pyplot as plt
import argparse
import json


def leer_probabilidades(archivo):
    """
    Lee las probabilidades desde un archivo de texto y las convierte en un diccionario.
    El archivo debe estar en formato JSON.
    """
    with open(archivo, "r") as f:
        return json.load(f)


def crear_arbol(probabilidades):
    """
    Crea un árbol de decisión a partir de las probabilidades ingresadas.

    probabilidades: diccionario con estructura jerárquica de probabilidades.
    """
    G = nx.DiGraph()

    def agregar_nodos_y_enlaces(nodo, probabilidades, padre=None):
        """
        Función recursiva para agregar nodos y enlaces al árbol.
        """
        if padre:
            # Añadimos un enlace con un atributo de peso
            G.add_edge(padre, nodo, peso=probabilidades.get("prob", 1))
        # Recorrer subnodos
        for subnodo, subdatos in probabilidades.get("ramas", {}).items():
            agregar_nodos_y_enlaces(subnodo, subdatos, nodo)

    # Agregar el nodo raíz y construir el árbol
    for raiz, datos in probabilidades.items():
        agregar_nodos_y_enlaces(raiz, datos)

    return G


def dibujar_arbol(G):
    """
    Dibuja el árbol de decisión con etiquetas personalizadas en las aristas
    y sin texto en los nodos.
    """
    # Usamos un diseño jerárquico con orientación horizontal
    pos = nx.nx_agraph.graphviz_layout(G, prog="dot", args="-Grankdir=LR")
    
    # Crear etiquetas de aristas: nombre del nodo y probabilidad
    labels = {
        (u, v): f"{v} (P: {d['peso']:.2f})"
        for u, v, d in G.edges(data=True)
    }
    
    # Dibujar el grafo
    nx.draw(
        G, pos, with_labels=False, node_color="lightblue", node_size=2000, font_size=10
    )
    
    # Dibujar las etiquetas de las aristas con el nombre y la probabilidad
    nx.draw_networkx_edge_labels(G, pos, edge_labels=labels, font_size=8)
    
    plt.show()


if __name__ == "__main__":
    # Configuración de argumentos de línea de comando
    parser = argparse.ArgumentParser(description="Generar un árbol de decisión a partir de un archivo de probabilidades.")
    parser.add_argument("archivo", help="Ruta al archivo de texto que contiene las probabilidades en formato JSON.")
    args = parser.parse_args()
    
    # Leer probabilidades desde el archivo
    probabilidades = leer_probabilidades(args.archivo)
    
    # Construcción y dibujo del árbol
    arbol = crear_arbol(probabilidades)
    dibujar_arbol(arbol)
