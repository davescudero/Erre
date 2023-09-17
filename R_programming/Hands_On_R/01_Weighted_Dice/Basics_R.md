# Basics

## Project 01: Weighted Dice

### Objects

The `:`` operator returns its results as a vector, a one-dimensional set of numbers:

```r
1:6
# 1 2 3 4 5 6 
```

Running `1:6` generated a vector of numbers for you to see, but it didn’t save that vector anywhere in your computer’s memory.

If you want to use those numbers again, you’ll have to ask your computer to save them somewhere. You can do that by creating an R object.

```r
a <- 1
a
## 1

a + 2
## 3
```

To create an R object, choose a name and then use the less-than symbol, `<`, followed by a minus sign, `-`, to save data into it.

This combination looks like an arrow, `<-`. R will make an object, give it your name, and store in it whatever follows the arrow. So `a <- 1` stores 1 in an object named a.

You can see which object names you have already used with the function `ls`:

```r
ls()
# "a"       "die"       "my_number"    "name"
```

So, for another example, the following code would create an object named die that contains the numbers one through six. To see what is stored in an object, just type the object’s name by itself:

```r
die <- 1:6
die
# 1 2 3 4 5 6 
```

R will replace an object with its contents whenever the object’s name appears in a command. So, for example, you can do all sorts of math with the die. Math isn’t so helpful for rolling dice, but manipulating sets of numbers will be your stock and trade as a data scientist. So let’s take a look at how to do that:

```r
die - 1
## 0 1 2 3 4 5

die / 2
## 0.5 1.0 1.5 2.0 2.5 3.0

die * die
## 1  4  9 16 25 36
```

R does not always follow the rules of matrix multiplication. Instead, R uses element-wise execution. When you manipulate a set of numbers, R will apply the same operation to each element in the set. So for example, when you run `die - 1`, R subtracts one from each element of die.

When you use two or more vectors in an operation, R will line up the vectors and perform a sequence of individual operations. For example, when you run `die * die`, R lines up the two die vectors and then multiplies the first element of vector 1 by the first element of vector 2. R then multiplies the second element of vector 1 by the second element of vector 2, and so on, until every element has been multiplied. The result will be a new vector the same length as the first two.

Dados dos vectores, $$V= [v_1, v_2, \dots, v_n]$$ y $$W= [w_1, w_2, \dots, w_n]$$ 
el resultado de su multiplicación elemento por elemento es:
$$ \mathbf{r} = [v_1 \times w_1, v_2 \times w_2, \dots, v_n \times w_n] $$

If you give R two vectors of unequal lengths, R will repeat the shorter vector until it is as long as the longer vector, and then do the math. This isn’t a permanent change–the shorter vector will be its original size after R does the math. If the length of the short vector does not divide evenly into the length of the long vector, R will return a warning message. This behavior is known as vector recycling, and it helps R do element-wise operations:

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

#### Reciclaje de Vectores en R

Cuando proporcionas a R dos vectores de **longitudes desiguales**, digamos:

$$V= [v_1, v_2, \dots, v_m]$$

y

$$W = [w_1, w_2, \dots, w_n]$$
donde  $m \neq n$, R actuará de la siguiente manera:

1. **Repetirá el vector más corto** hasta que tenga la misma longitud que el vector más largo. Si \( m < n \), $V$ se extenderá para coincidir con la longitud de $W$, y viceversa.

2. Luego, **realizará la operación matemática** elemento por elemento.

**Nota Importante**: Esta extensión es **temporal**. Es decir, después de realizar la operación, el vector más corto volverá a su tamaño original.

**Advertencia**: Si la longitud del vector más corto no divide de manera exacta la longitud del vector más largo, R mostrará un mensaje de advertencia.

Este comportamiento se conoce como **reciclaje de vectores** y permite a R realizar operaciones elemento por elemento de manera eficiente.

#### Element wise operations

Element-wise operations are a very useful feature in R because they manipulate groups of values in an orderly way. When you start working with data sets, element-wise operations will ensure that values from one observation or case are only paired with values from the same observation or case. Element-wise operations also make it easier to write your own programs and functions in R.

Fo traditional matrix multiplication, you can do inner multiplication with the `%*%` operator and outer multiplication with the `%o%` operator:

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

### Functions

Using a function is pretty simple. Just write the name of the function and then the data you want the function to operate on in parentheses:

```r
round(3.1415)
## 3

factorial(3)
## 6
```

The data that you pass into the function is called the function’s argument. The argument can be raw data, an R object, or even the results of another R function.

 When you link functions together, R will resolve them from the innermost operation to the outermost.