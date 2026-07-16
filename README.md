# Códigos de estatística

Repositório de scripts em R para ilustração de conceitos de estatística e processos estocásticos em tempo discreto.

## Passeio aleatório simples

Considere uma sequência de variáveis aleatórias independentes e identicamente distribuídas
$(Y_1, Y_2, \dots)$, com valores em $\{+1, -1\}$, tal que
$\mathbb{P}(Y_i = 1) = p$ e $\mathbb{P}(Y_i = -1) = 1 - p$.

Definimos o processo $(S_n)_{n \ge 0}$ por
$$
S_n = \sum_{i=1}^n Y_i, \quad S_0 = 0.
$$

O processo $(S_n)$ é um **passeio aleatório simples** em tempo discreto:

- o índice $n$ representa o tempo discreto (passos);
- o valor $S_n$ é o **estado** do processo no tempo $n$;
- a dinâmica é aditiva: cada passo $Y_i$ desloca o estado anterior em $+1$ ou $-1$.

No script `passeio_aleatorio_simples.R`, são simuladas $M$ trajetórias do passeio aleatório, com:

- número de passos $n$,
- probabilidade de passo positivo $p$,
- visualização das trajetórias $n \mapsto S_n$.

Esse código pode ser usado em aula para ilustrar:

- a relação entre soma de variáveis i.i.d. e processos em tempo discreto,
- comportamento da média e variância de $S_n$,
- noções de caminho, estado e evolução estocástica.

## Cadeia homogênea de Markov

Considere um espaço de estados finito
$$
E = \{1, 2, 3\},
$$
e uma matriz de transição
$$
P = (p_{ij})_{i,j \in E},
$$
onde $p_{ij} = \mathbb{P}(X_{n+1} = j \mid X_n = i)$.

Um processo $(X_n)_{n \ge 1}$ é uma **cadeia de Markov homogênea** se satisfaz a propriedade de Markov
$$
\mathbb{P}(X_{n+1} = j \mid X_n = i, X_{n-1}, \dots, X_1)
= \mathbb{P}(X_{n+1} = j \mid X_n = i)
= p_{ij},
$$
para todos $n \ge 1$ e estados $i,j \in E$.

No script `cadeia_markov_homogenea.R`, definimos:

- um número de estados $K = 3$,
- uma matriz de transição $P$ fixa (homogênea no tempo),
- um estado inicial $X_1$,
- e simulamos a trajetória $(X_n)_{n=1}^N$.

O código também calcula:

- uma estimativa empírica da distribuição estacionária (frequências de visita aos estados após um período de aquecimento/burn-in),
- uma matriz de transição empírica, obtida a partir das contagens de pares $(X_n, X_{n+1})$.

Esses scripts servem para ilustrar em aula:

- a diferença entre um processo com incrementos independentes (passeio aleatório) e um processo com dependência de primeira ordem (cadeia de Markov),
- conceitos de estado inicial, transições, distribuição estacionária e dinâmica em tempo discreto,
- como implementar simulações de processos estocásticos em R.

## Como usar os scripts

Em R ou RStudio, basta:

1. Abrir o arquivo `.R` correspondente.
2. Executar o script completo (por exemplo, com `Source` no RStudio).
3. Analisar os gráficos e saídas numéricas geradas.

Esses exemplos podem ser adaptados para aplicações em séries temporais, modelos de genética quantitativa, e outros contextos em agronomia e estatística aplicada.
