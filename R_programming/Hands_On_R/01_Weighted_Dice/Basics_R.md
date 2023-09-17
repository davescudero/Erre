# Basics

## Project 01: Weighted Dice

### Objetos

El operador `:` devuelve sus resultados como un vector, un conjunto unidimensional de números:

```r
1:6
# 1 2 3 4 5 6 
```

Ejecutar `1:6` genera un vector de números para que lo veas, pero no guarda ese vector en ningún lugar de la memoria de la computadora.

Si quieres usar esos números de nuevo, tendrás que pedirle a la computadora que los guarde en algún lugar. Puedes hacer eso creando un **objeto** en R.

```r
a <- 1
a
## 1

a + 2
## 3
```

Para crear un objeto en R, elige un nombre y luego usa el símbolo menor que, `<`, seguido de un signo de menos, `-`, para guardar datos en él.

Esta combinación parece que una flecha, `<-`.  creará un objeto, le dará tu nombre y almacenará en él lo que sigue a la flecha. Por lo tanto, `a <- 1` guarda 1 en un objeto llamado a.

Puedes ver qué nombres de objetos ya has usado con la función `ls`:

```r
ls()
# "a"       "die"       "my_number"    "name"
```

Entonces, para otro ejemplo, el siguiente código crearía un objeto llamado `die` que contiene los números del uno al seis. Para ver qué está almacenado en un objeto, simplemente escribe el nombre del objeto por sí solo:

```r
die <- 1:6
die
# 1 2 3 4 5 6 
```

R reemplazará un objeto con su contenido siempre que el nombre del objeto aparezca en un comando. Así que, por ejemplo, puedes hacer todo tipo de cálculos matemáticos con el *dado*. La matemática no es tan útil para lanzar dados, pero manipular conjuntos de números será tu herramienta principal como científico de datos.

```r
die - 1
## 0 1 2 3 4 5

die / 2
## 0.5 1.0 1.5 2.0 2.5 3.0

die * die
## 1  4  9 16 25 36
```

R no siempre sigue las reglas de la multiplicación de matrices. En lugar de eso, R utiliza ejecución [elemento a elemento](Background/multiplicacion_por_elemento.md). Cuando manipulas un conjunto de números, R aplicará la misma operación a cada elemento del conjunto. Así que, por ejemplo, cuando ejecutas `die - 1`, R resta uno a cada elemento de `die`.

Cuando usas dos o más vectores en una operación, R alineará los vectores y realizará una secuencia de operaciones individuales. Por ejemplo, cuando ejecutas `die * die`, R alinea los dos vectores `die` y luego multiplica el primer elemento del vector 1 por el primer elemento del vector 2. Luego, R multiplica el segundo elemento del vector 1 por el segundo elemento del vector 2, y así sucesivamente, hasta que cada elemento haya sido multiplicado. El resultado será un nuevo vector del mismo tamaño que los dos primeros.

Dados dos vectores, $$V= [v_1, v_2, \dots, v_n]$$ y $$W= [w_1, w_2, \dots, w_n]$$
el resultado de su multiplicación elemento por elemento es:
$$ r = [v_1 \times w_1, v_2 \times w_2, \dots, v_n \times w_n] $$

Si proporcionas a R dos vectores de longitudes desiguales, R repetirá el vector más corto hasta que sea tan largo como el vector más largo y luego realizará la operación matemática. Este no es un cambio permanente: el vector más corto tendrá su tamaño original después de que R realice la operación. Si la longitud del vector corto no se divide de manera uniforme en la longitud del vector largo, R devolverá un mensaje de advertencia. Este comportamiento es conocido como [reciclaje de vectores](Background/reciclaje_vectores.md) y ayuda a R a realizar operaciones elemento a elemento:

```r
1:2
## 1 2

1:4
## 1 2 3 4

die
## 1 2 3 4 5 6

die + 1:2
## 2 4 4 6 6 8

die + 1:4
## 2 4 6 8 6 8
Warning message:
In die + 1:4 :
  longer object length is not a multiple of shorter object length
```

Las operaciones elemento a elemento son una característica muy útil en R porque manipulan grupos de valores de manera ordenada. Cuando comiences a trabajar con conjuntos de datos, las operaciones elemento a elemento asegurarán que los valores de una observación o caso solo se emparejen con valores de la misma observación o caso. Las operaciones elemento a elemento también facilitan la escritura de tus propios programas y funciones en R.

Para la multiplicación tradicional de matrices, puedes realizar la multiplicación interna con el operador `%*%` y la multiplicación externa con el operador `%o%`:

```r
die %*% die
## 91

die %o% die
##      [,1] [,2] [,3] [,4] [,5] [,6]
## [1,]    1    2    3    4    5    6
## [2,]    2    4    6    8   10   12
## [3,]    3    6    9   12   15   18
## [4,]    4    8   12   16   20   24
## [5,]    5   10   15   20   25   30
## [6,]    6   12   18   24   30   36
```

### Funciones

Usar una función es bastante simple. Solo escribe el nombre de la función y luego los datos sobre los que quieres que la función opere entre paréntesis:

```r
round(3.1415)
## 3

factorial(3)
## 6
```

Los datos que pasas a la función se llaman el argumento de la función. El argumento puede ser datos brutos, un objeto de R o incluso los resultados de otra función de R.

Cuando enlazas funciones juntas, R las resolverá desde la operación más interna hasta la más externa.

Dado que tenemos dos funciones $f$  y $g$, la composición $f(g(x))$ se resuelve primero evaluando $g(x)$ y luego  $f$ sobre el resultado.

$$f(g(x)) = f\left( \underbrace{g(x)}_{\text{operación interna}} \right) \quad \text{operación externa}$$

Por suerte para nosotros, hay una función en R que puede ayudar a "lanzar" el dado. Puedes simular un lanzamiento del dado con la función `sample` de R. `sample` toma dos argumentos: un vector llamado `x` y un número llamado `size`. `sample` devolverá `size` elementos del vector:

```R
sample(x = 1:4, size = 2)
## 3 2
```

Para lanzar tu dado y obtener un número, establece `x` a `die` y toma un elemento de él. Obtendrás un nuevo número cada vez que lo lances:

```R
sample(x = die, size = 1)
## 2

sample(x = die, size = 1)
## 1

sample(x = die, size = 1)
## 6
```

Muchas funciones en R toman múltiples argumentos que les ayudan a realizar su trabajo. Puedes darle a una función tantos argumentos como quieras siempre y cuando separes cada argumento con una coma.

Cada argumento en cada función de R tiene un nombre. Puedes especificar qué datos deben ser asignados a qué argumento estableciendo un nombre igual a datos, como en el código anterior. Esto se vuelve importante a medida que comienzas a pasar múltiples argumentos a la misma función; los nombres te ayudan a evitar pasar los datos incorrectos al argumento equivocado. Sin embargo, usar nombres es opcional.

```R
sample(die, size = 1)
## 2
```

A menudo, el nombre del primer argumento no es muy descriptivo, y generalmente es obvio a qué se refiere el primer dato.

¿Pero cómo sabes qué nombres de argumentos usar?

Puedes consultar los argumentos de la función con `args`. Para hacerlo, coloca el nombre de la función entre los paréntesis detrás de `args`. Por ejemplo, puedes ver que la función `round` toma dos argumentos, uno llamado `x` y otro llamado `digits`:

```R
args(round)
## function (x, digits = 0) 
## NULL
```

¿Notaste que `args` muestra que el argumento `digits` de `round` ya está establecido en 0? Frecuentemente, una función de R tomará argumentos opcionales como `digits`. Estos argumentos se consideran opcionales porque vienen con un valor predeterminado. Puedes pasar un nuevo valor a un argumento opcional si lo deseas, y R usará el valor predeterminado si no lo haces. Por ejemplo, `round` redondeará tu número a 0 decimales por defecto. Para anular el valor predeterminado, proporciona tu propio valor para `digits`:

```R
round(3.1415)
## 3

round(3.1415, digits = 2)
## 3.14
```

Debes escribir los nombres de cada argumento después del primero o segundo cuando llames a una función con múltiples argumentos.

Si no escribes los nombres de tus argumentos, R coincidirá con tus valores con los argumentos de tu función por orden. Por ejemplo, en el siguiente código, el primer valor, `die`, coincidirá con el primer argumento de `sample`, que se llama `x`. El siguiente valor, `1`, coincidirá con el siguiente argumento, `size`:

```R
sample(die, 1)
## 2
```

A medida que proporciones más argumentos, es más probable que tu orden y el orden de R no coincidan. Como resultado, los valores pueden pasar al argumento equivocado. Los nombres de argumentos evitan esto. R siempre coincidirá con un valor con su nombre de argumento, sin importar dónde aparezca en el orden de argumentos:

```R
sample(size = 1, x = die)
## 2
```
