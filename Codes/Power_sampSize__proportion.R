p1 <- 0.55
p2 <- 0.75
za <- 1.96
p3 <- mean(p1, p2)
zb <- qnorm(mean = 0, sd = 1, p = 0.8)

{2*(za + zb)^2*p3*(1-p3) } / (p1-p2)^2


round up to #(za + zb)^2*{p1*(1-p1)+p2*(1-p2) } / (p1-p2)^2



pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.55),
sig.level = 0.05,
power = 0.80)


?pwr.2p.test



library(pwrss)
pwrss.z.2props(p1 = 0.75, p2 = 0.55,
               alpha = 0.05, power = 0.80,
               arcsin.trans = FALSE)
