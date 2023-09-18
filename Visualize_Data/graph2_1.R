# Script de R para documentación de gráfico 2.1
## Graáfico Q-Q usando ggplot2

# Cargar la librería necesaria
# que se utiliza para crear gráficos basados en los trabajos de William S. Cleveland
library(ggcleveland)

# Iniciar la construcción del gráfico con ggplot()
# ggplot() establece las bases para el gráfico.
# El primer argumento es el conjunto de datos (futbol) y aes() define las estéticas del gráfico.
# sample = dist indica que se usarán los valores de la columna dist del conjunto de datos.
plot <- ggplot(futbol, aes(sample = dist)) + 
  
  # Añadir una geometría Q-Q al gráfico
  # geom_qq() crea un gráfico Q-Q, que compara los cuantiles de dos distribuciones.
  # Si los datos siguen la distribución teórica especificada, los puntos se alinearán en una línea recta.
  # En este caso, la distribución teórica especificada es qunif, que se refiere a una distribución uniforme
  geom_qq(distribution = qunif) + 
  
  # Dividir el gráfico en múltiples paneles basados en la variable longp
  # facet_wrap() es una función que permite crear múltiples paneles en un gráfico.
  # En este caso, se crean paneles basados en la variable longp y se organizan en 4 columnas.
  facet_wrap(~ longp, ncol = 4) + 
  
  # Modificar las etiquetas del gráfico
  # labs() es una función que permite personalizar las etiquetas del gráfico.
  labs(title = "Figura 2.1: Distancia que recorre una pelota al ser pateada por jugadores de futbol", x = "f-value", y = "Distancia (m)") + 
  
  # Aplicar un tema al gráfico
  # theme_minimal() proporciona un diseño limpio y minimalista al gráfico.
  theme_minimal()

# Mostrar el gráfico
print(plot)
