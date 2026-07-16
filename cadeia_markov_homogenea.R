# Cadeia de Markov homogênea em tempo discreto
# Espaço de estados: {1, 2, 3}

set.seed(42)

K <- 3     # número de estados
n <- 200   # tamanho da trajetória

# matriz de transição P (linhas: estado atual, colunas: próximo estado)
P <- matrix(
  c(0.7, 0.2, 0.1,
    0.3, 0.4, 0.3,
    0.2, 0.2, 0.6),
  nrow = K,
  byrow = TRUE
)

rownames(P) <- colnames(P) <- paste0("s", 1:K)

# vetor de estados da cadeia
x <- integer(n)
x[1] <- 1   # estado inicial fixo; você pode mudar para outro ou sortear

# simulação da cadeia de Markov
for (t in 2:n) {
  x[t] <- sample(1:K, size = 1, prob = P[x[t - 1], ])
}

# gráfico da trajetória
plot(
  1:n, x,
  type = "s",
  ylim = c(1, K),
  yaxt = "n",
  xlab = "Tempo n",
  ylab = "Estado",
  main = "Trajetória de cadeia de Markov homogênea"
)

axis(2, at = 1:K, labels = paste0("s", 1:K))

# estimativa empírica da distribuição estacionária (após burn-in)
burnin <- 50
freq <- table(factor(x[(burnin + 1):n], levels = 1:K)) / (n - burnin)

print("Frequências empíricas (aprox. estacionária):")
print(freq)

# matriz de transição empírica
trans.emp <- matrix(0, nrow = K, ncol = K)

for (i in 1:(n - 1)) {
  trans.emp[x[i], x[i + 1]] <- trans.emp[x[i], x[i + 1]] + 1
}

trans.emp <- trans.emp / rowSums(trans.emp)

print("Matriz de transição empírica:")
print(trans.emp)
