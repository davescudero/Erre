# Multiplicacion elemento x elemento

La multiplicación elemento por elemento, también conocida como multiplicación de Hadamard, es una operación entre dos matrices de igual tamaño. En lugar de multiplicar matrices en el sentido convencional (como se hace en el álgebra lineal), la multiplicación elemento por elemento toma dos matrices y multiplica sus elementos correspondientes.

A continuación, abordaremos el concepto desde varios puntos de vista:

1. **Definición Formal**:
   Si tenemos dos matrices  $A$ y $B$ de tamaño $m \times n$ , la multiplicación elemento por elemento se define como:
   $C_{ij} = A_{ij} \times B_{ij}$
   Donde $C$ es la matriz resultante.

    **Ejemplo**:
   Si $A = \begin{bmatrix} 2 & 3 \\ 4 & 5 \end{bmatrix}$ y $B = \begin{bmatrix} 1 & 0 \\ 7 & 2 \end{bmatrix}$, entonces:
   $C = \begin{bmatrix} 2 & 0 \\ 28 & 10 \end{bmatrix}$

2. **Comparación con la multiplicación de matrices**:
   En la multiplicación de matrices estándar, el elemento en la fila  $i$  y columna $j$  de la matriz resultante se obtiene al tomar el producto punto de la fila $i$  de la primera matriz y la columna $j$ de la segunda matriz. Esta es una operación mucho más compleja que la multiplicación elemento por elemento, y las matrices no necesitan tener las mismas dimensiones (aunque sí deben ser conformables para la multiplicación).

3. **Aplicaciones**:
   - **Procesamiento de imágenes**: Si tienes dos imágenes del mismo tamaño y quieres combinarlas (por ejemplo, para ajustar la luminosidad de una imagen usando otra como máscara), puedes multiplicarlas elemento por elemento.
   - **Redes neuronales**: En algunos casos, especialmente en redes neuronales convolucionales, se utiliza la multiplicación elemento por elemento para aplicar máscaras o realizar operaciones específicas en capas intermedias.
   - **Operaciones punto a punto en programación**: En lenguajes de programación como MATLAB o Python (con NumPy), se pueden realizar operaciones elemento por elemento usando notación específica (por ejemplo, `.*` en MATLAB o `*` en NumPy si ambos operandos son arrays).

4. **Limitaciones**:
   - Las matrices deben tener las mismas dimensiones.
   - La multiplicación elemento por elemento no captura interacciones entre filas y columnas, a diferencia de la multiplicación de matrices tradicional.
