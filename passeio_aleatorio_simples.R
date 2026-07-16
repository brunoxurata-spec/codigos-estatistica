# Passeio aleatório simples em tempo discreto
# S_n = sum_{i=1}^n Y_i, com Y_i em {+1, -1}

set.seed(123)

# parâmetros
M <- 5      # número de trajetórias
n <- 200    # número de passos
p <- 0.5    # probabilidade de passo +1

# gerando os incrementos Y_i
Y <- matrix(
  sample(c(1, -1),
         size = M * n,
         replace = TRUE,
         prob = c(p, 1 - p)),
  nrow = M,
  ncol = n
)

# passeio aleatório: soma cumulativa de cada linha
S <- t(apply(Y, 1, cumsum))

# vetor de tempo: inclui o estado inicial S_0 = 0
time <- 0:n
Splot <- cbind(rep(0, M), S)

# gráfico das trajetórias
matplot(
  time,
  t(Splot),
  type = "l",
  lty = 1,
  col = rainbow(M),
  xlab = "Tempo n",
  ylab = expression(S[n]),
  main = "Passeio aleatório simples"
)

legend(
  "topright",
  legend = paste("traj", 1:M),
  col = rainbow(M),
  lty = 1
)
