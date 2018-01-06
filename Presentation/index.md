---
title       : "Reproducible Pitch"
subtitle    : 
author      : "Madhu Kakumanu"
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---



## This Presentation was created as part of reproducible pitch assignment of  developing data products course of coursera project using slidify package

--- .class #id 

## - It has multiple slides each slide displays different graphs drawn on cars data set

## - Slide 4 Shows a graph by using Plot Command in R along with abline in blue color

## - Slide 5 Shows a graph by taking speed and distance data of cars data set by using ggplot2 package available in R

--- .class #id 





```r
plot(cars)
abline(lm(dist ~ speed, data = cars), col = "blue")
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

--- .class #id 


```r
g <- ggplot(cars,aes(speed,dist))
g + geom_point() + geom_smooth()
```

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)
