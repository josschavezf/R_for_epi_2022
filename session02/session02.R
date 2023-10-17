# Session 02 

# Link https://josschavezf.github.io/R_for_epi/session02/session02.html

my_vector <- "this a phrase"

my_vector

my_vector <- c(1,2,5)
my_vector

my_vector <- c("first", "second", "third")
my_vector

seq(1:10)
seq(from = 0, to = 10, by = 2)

my_vector <- seq(from = 2, to = 20, by = 2)
my_vector

length(my_vector)

x_num <- c(1,4,5)
x_num
class(x_num)

x_int <- c(1L,4L,5L)
x_int
class(x_int)

x_dbl <- c(1, 2.5, 3.1)
typeof(x_dbl)

x_chr <- c("a", "word", "this is phrase")
class(x_chr)

x_fct <- factor("a","b","c")
class(x_fct)

x_log <- c(TRUE, FALSE, TRUE)
class(x_log)

x <- c(1, "a", TRUE)
x

class(x)

x <- c(1, "a", TRUE, NA)
x

x <- c(10, -1, NA)
log(x)


x <- c(10,0,50, 1000)
x

x[3]
x[1]

x

# How to extract 50?
x[3]

x[2:4]

x <- c(10,0,50, 1000)
my_position <- seq(2,5, by = 2)
my_position

my_position <- 3
my_position
x[3] #
x[my_position] #

my_position <- c(1,3)
my_position

x[my_position] #
x[c(1,3)] #

# vector from 20 to 30 
a <- seq(20,30)
a
a <- 20:30
a

# how to extract 21?
a[2]

# how to extract 21,22,23?
a[c(2,3,4)]
a[2:4]

my_position <- 2:4
my_position
a[my_position]


names(a)

y <- c("one_number" = 10, "myname" = 22, "another" = 50 )
y
y[2:3]
names(y)

y
y["second"]

y[c("one_number", "myname")]


y > 11

y[y > 11]

y[y == 22]


y <- c("a", "b", "c")

y[y == "b"]

y
y[y >= 20]
y[y <= 20]



