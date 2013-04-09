# Music Videos in R
### Presenting high-dimensional data in a web browser
[Brian Abelson](http://brianabelson.com), Data Scientologist

[Thomas Levine](http://thomaslevine.com), Data Superhero

[CSV Soundsystem](http://csvsoundsystem.com)



# Big Data
[![For handle big data, solution is very simple: buy bigger monitor and use smaller font in the terminal.](borat.png)](https://twitter.com/mysqlborat/status/306078371182428161)



## Data music videos are the answer.
# Why?


## Reason 1: Static images are limited
![Minard's map of Napoleon's march](minard.png)
<!-- http://upload.wikimedia.org/wikipedia/commons/2/29/Minard.png -->


### Multisensory experiences are the future.
![Artichoke pizza](artichoke.jpg)
<!-- http://www.flickr.com/photos/igorschwarzmann/4423705330/ -->


### Dynamic experiences increase dimensionality
[![complicated plot](4l-FixedScale-NoMuProf2-preview.png)](4l-FixedScale-NoMuProf2.gif)


## Reason 2: Audience
![HTML5 logo](html5-logo.png)
<!-- http://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/HTML5-logo.svg/500px-HTML5-logo.svg.png -->

* Vision
* Hearing
* Touch


## Reason 3: Accessibility
!["Opening Doors to IT" logo](open-doors.jpg)
<!-- http://www.section508.gov/images/open_doors_seal-b.jpg

* [Section 508](https://www.section508.gov/)
* [Web Content Accessibility Guidelines](http://www.w3.org/TR/WCAG10/
 -->


## Reason 4: Reaching young people
[![Government representatives](dubstep-preview.png)](http://www.youtube.com/watch?v=JwuEnyV1Cb0)



# R is the best language
### for data music videos
![R logo](r.jpg)
<!-- http://www.r-project.org/Rlogo.jpg -->


## Reason 1: Vector graphics
![Iris](iris.png)


## Reason 2: ddr library
        __     __       
    .--|  |.--|  |.----.
    |  _  ||  _  ||   _|
    |_____||_____||__|


## Reason 3: Data

    str(iris)
    'data.frame':   150 obs. of  5 variables:
    $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
    $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
    $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
    $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
    $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...



# Two case studies



## [Christmas Gifts](http://www.youtube.com/watch?v=rLZDvXPIDa0)


### Architecture
Generate one page per frame.

    pdf('gifts_slideshow.pdf', width=3*16, height=3*9)

    for (day in 1:12) {
        #Frame with ordinal before gifts
        giftframe(0,day=day-1,daylabel=F)
        giftframe(0,day=day-1,daylabel=T)
        sapply(day:1,giftframe,day=day)
    }

    #Final frame with everything
    giftframe(0,day=12,daylabel=F)

    dev.off()

And then I made a screencast with `ffmpeg`.


### Frame composition
![Annotated screenshot of the Christmas video](annotated-christmas-screenshot.png)

<section data-state="blackout">
### Making pretty base R plots
[(live coding)](live-code-christmas.r)
</section>


### Side note
<!-- I intentionally repeat this slide. -->
# Use ggplot



## Federal spending
<!-- <iframe width="100%" height="100%" src="http://fms.csvsoundsystem.com" frameborder="0" allowfullscreen></iframe>
<iframe width="960px" height="100%" src="file:///home/tlevine/Documents/fms-symphony/index.html" frameborder="0" allowfullscreen></iframe> -->
[![FMS Symphony](screenshot.png)](http://fms.csvsoundsystem.com)


### Architecture
1. Download fixies from the FMS site, and convert them into CSV.
2. Load into R, and produce the audio and video tracks.
  * Generate 1877 plots, one per frame.
  * Generate a song.
3. Combine the frames and the song in a website.


### Architecture
Generate one image per frame.

    for (i in 1:nrow(table2.toplot)) {
        png(sprintf('slideshow/%d.png', i), width = 1200, height = 600)
        frame(i)
        dev.off()
    }


### Frame components
#### The full video
![Screenshot of the video](screenshot.png)


### Frame components
#### The part that we generate in R
![A frame from the video, generated in R](1028.png)


### Frame components
![Annotated screenshot of the video](annotated-screenshot.png)


<section data-state="blackout">
### Chernoff face hack
[(live coding)](live-code-fms.r)
</section>


<section data-state="blackout">
### Website
[(live coding)](live-code-fms.html)
</section>



<section data-state="blackout">
# Brian's turn
</section>
