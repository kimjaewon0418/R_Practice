#1
mylist <- list(name="isaac",
               id=30094,
               order = c(1,2))
mylist
#2
mylist$name
mylist$id
mylist$order
mylist["name"]
mylist[["name"]]
#3
mylist$id <- 202401
mylist
mylist$name <- "new"
mylist
#4
mylist$new <- list("hello", c(1,3,2))
mylist
mylist$new[[1]]
#5
unlist(mylist)
#6
c(list(1,"2"),
  list (5, c(1,3)))
#7
sum(1:10)
lapply(list(1:2, 1:5), sum)
sapply(list(1:2, 1:5), sum)
#8
set.seed(2021)
mylist2 <- replicate(100, runif(sample(10:50,1)))
str(mylist2)
which.max(mylist2[[1]])
which.max(sapply(mylist2,sum))
