# Building up a plot from scratch

# Some constants

height.vid <- 9/16
width.vid  <- 16/9


# A simple plot

plot(
    x=0,
    y=0
)

# Set the limits.

plot(
    x=0,
    y=0,
    xlim=-2+c(1,80),
    ylim=-15+c(-15,height.vid*80-15)
)

# Set the aspect ratio.

plot(
    x=0,
    y=0,
    xlim=-2+c(1,80),
    ylim=-15+c(-15,height.vid*80-15),
    asp=1
)

# Remove the labels.

plot(
    x=0,
    y=0,
    xlim=-2+c(1,80),
    ylim=-15+c(-15,height.vid*80-15),
    asp=1,
    xlab='',
    ylab='',
    main=''
)

# Remove the data; this is just our base canvas.

plot(
    x=0,
    y=0,
    xlim=-2+c(1,80),
    ylim=-15+c(-15,height.vid*80-15),
    asp=1,
    xlab='',
    ylab='',
    main='',
    type='n'
)

# The version I use in the video

plot(
    x=0,
    y=0,
    xlim=-2+c(1,80),
    ylim=-15+c(-15,height.vid*80-15),
    asp=1,
    xlab='',
    ylab='',
    main='',
    type='n',
    axes=F
)

# A side note: Use `axes=F` and `axis` because it looks better.

plot(iris$Sepal.Length ~ iris$Sepal.Width)

plot(iris$Sepal.Length ~ iris$Sepal.Width, bty = 'n')

plot(iris$Sepal.Length ~ iris$Sepal.Width, axes=F)
axis(1, at = 2:4, labels = c('a', 'b', 'c'))
axis(2)

