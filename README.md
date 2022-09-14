# self1

Worksheet 13 some part
---
title: "Sample Quatro Document"
author: "Ranjit Prasad"
date: "2022-09-14"
output: html_document
---

### Welcome to this Sample Document

##### **Solving quadratic equations**

Consider equations of the form $ax^2+bx+c=0$. This is a quadratic equation; changing the values a,b, and c, changes the shape of the quadratic. There are two solutions to a quadratic equation:

$$x=\dfrac{-b \pm \sqrt{b^2-4ac}}{2a}$$ Let's draw a quadratic curve for different values of a,b and c.

```{r include = TRUE}
a <- 10
b <- 3
c <- -5
x <- seq(-2,2, length = 1e3)
fx <- a*x^2 + b*x + c
plot(x , fx , type = 'l' , xlab = "x" , ylab = "Quadratic function")
# addinf line for solution
abline(h=0 , lty = 2, col = "red")
```
