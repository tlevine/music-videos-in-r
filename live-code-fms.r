library(aplpack)

# This is how you use it.
faces(iris[-5])

# Don't have to plot right away
f <- faces(iris[-5], plot.faces = F)
plot(f)

# Choose the location
plot(-3:3, -3:3, type = 'n')
plot(f, x.pos = rnorm(nrow(iris)), y.pos = rnorm(nrow(iris)))

# What if we just want the first three?
plot(0:10, 0:10, type = 'n')
g <- f
g$xy <- g$xy[,1:3]
g$faces <- g$faces[1:3]
plot(g, x.pos = c(2,6,3), y.pos = c(8, 6, 9))

# Here's the actual function
'
# Plot a Chernoff face for a day at an x, y
f.all <- # this is a faces call
face <- function(day.or.days, x, y, ...) {
    # day.or.days is a row index

    f <- f.all
    f$xy <- f$faces <- NULL

    f$xy <- matrix(f.all$xy[,day.or.days])
    dimnames(f$xy) <- dimnames(f.all$xy)
    f$faces <-f.all$faces[day.or.days]

    x.pos <- x + abs(diff(range(table2.toplot$date)) / 20)

    plot.faces(f, face.type = 1, x.pos = x.pos, y.pos = y, ...)
}
'
