#install.packages("survival")

library(survival)

Surv(
 time = c(5, 10, 15, 20),
 event = c(1, 0, 1, 0))
  
data(package = "survival")
data(heart)
head(heart)
  
ggplot(heart, aes(x = id)) +
 geom_line(aes(y = start, group = id)) +
 geom_line(aes(y = stop, group = id)) +
 labs(
 title = "Start and Stop Times in the Heart Dataset",
 x = "Patient ID",
 y = "Time"
)

fit <- survfit(
 Surv(start, stop, event) ~ 1,
 data = heart
)

plot(
 fit,
 main = "Survival Curve",
 xlab = "Time",
 ylab = "Survival Chance"
)

fit