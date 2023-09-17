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

If you are a big fan of linear algebra (and who isn’t?), you may notice that R does not always follow the rules of matrix multiplication. Instead, R uses element-wise execution. When you manipulate a set of numbers, R will apply the same operation to each element in the set. So for example, when you run die - 1, R subtracts one from each element of die.

When you use two or more vectors in an operation, R will line up the vectors and perform a sequence of individual operations. For example, when you run die * die, R lines up the two die vectors and then multiplies the first element of vector 1 by the first element of vector 2. R then multiplies the second element of vector 1 by the second element of vector 2, and so on, until every element has been multiplied. The result will be a new vector the same length as the first two, as shown in Figure