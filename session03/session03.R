# Session 02 

# Link https://josschavezf.github.io/R_for_epi/session03/session03.html


x <- c("a", "b", "c")
x

x[4] <- "d"
x

# How to add the letter e?

x[5] <- "e"
x

x[-2]
x <- x[-2]
x

# how to remove "d"?
y <- x[-3]
y

fruits <- c("apples" = 1, 
            "cherries" = 10,
            "mangos" = 7)

# add strawberries
fruits[4] <-  5

names(fruits)[4] <- "strawberries"

fruits

# remove cherries
fruits <- fruits[-2]

x
x[1] <- "m"

x

# replace "d" with "q"

x[3] <- "q"
x

x <- c("a","a","b")
x

x[x == "a"] <- "q"
x



my_matrix <- matrix(data = 1:12, nrow = 4)


my_matrix + 10

matrix1 <- matrix(1:6, nrow = 2, ncol = 3)
matrix1

matrix2 <- matrix(7:12, nrow = 2, ncol = 3)
matrix2

matrix1 + matrix2


fruits <- data.frame(
    name = c("apples", "berries", "mangos", "bananas"),
    number = c(1,10,7,2),
    edible_shell = c(TRUE, TRUE, FALSE, FALSE)
)

fruits

nrow(fruits)
ncol(fruits)

dim(fruits)

rownames(fruits)
colnames(fruits)

fruits

rownames(fruits) <- c("row_1", "other_row", "third_one", "four")

rownames(fruits)
fruits

nrow(patients)
ncol(patients)
dim(patients)
colnames(patients)


fruits

fruits[2,3]

# how to extract the number of mangos?

fruits[3,2]

fruits[1:2, 3]

# extract the number of berries and mangos
fruits[2:3, 2]

fruits[, 2]

fruits[2,]


fruits

# get all columns for mangos

fruits[3,]

my_list <- list(a_number = 15,
     fruits = data.frame(name = c("apples",
                                  "mangos"),
                         number = c(3,10)),
     my_matrix = matrix(1:6, nrow = 2)
)

my_list


my_list$fruits


# extract the matrix from my_list?
my_list$my_matrix




