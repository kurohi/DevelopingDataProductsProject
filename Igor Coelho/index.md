---
title       : Hello slidify presentation
subtitle    : A simple test of slidify functions
author      : Igor Coelho
job         : Programmer
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## This is the first slide

1. With slidify it is easy to create slide presentations for your data products
2. you can write it directly with R markdown

--- .class #id

## Embleming code

You can also write R code like a normal R markdown

```r
data(mtcars)
mtcars$am = as.factor(mtcars$am)
levels(mtcars$am) = c("Automatic", "Manual")
boxplot(mpg~am, data = mtcars,
        col = c("dark grey", "light grey"),
        xlab = "Gear type",
        ylab = "MPG",
        main = "MPG related with Gear Type")
```

---

## Ploting

Here is the result for the previous slide

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 


---
## Deepening your knowlodge

To increse your knowledge wirh creating data products, visit the "Developing Data Products" course on 

http://www.coursera.org

Thank you very much
