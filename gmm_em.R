# EM Algorithm for Gaussian Mixture Models in R
# This script demonstrates how the Expectation-Maximization algorithm can be
# used to estimate the parameters of a Gaussian Mixture Model (GMM). It
# generates a simple one-dimensional data set from two Gaussian distributions
# and iteratively estimates the mixture weights, means and standard deviations.

set.seed(123)

# 1. Generate synthetic data from a mixture of two Gaussians
n <- 300
x <- c(rnorm(0.3 * n, mean = -2, sd = 0.6),
       rnorm(0.7 * n, mean =  2, sd = 1.2))

# 2. Initialize parameters
k <- 2                          # number of mixture components
pi_k <- rep(1/k, k)             # mixture weights
mu_k <- sample(x, k)            # component means
sigma_k <- rep(sd(x), k)        # component standard deviations

# Helper function to compute log-likelihood
log_likelihood <- function(x, pi_k, mu_k, sigma_k) {
  dens <- sapply(1:k, function(j) pi_k[j] * dnorm(x, mu_k[j], sigma_k[j]))
  sum(log(rowSums(dens)))
}

# 3. EM algorithm
max_iter <- 100
ll_history <- numeric(max_iter)

for (iter in 1:max_iter) {
  # ----- E-step -----
  # responsibilities: gamma[i,j] = posterior probability that x[i] belongs to j
  gamma <- sapply(1:k, function(j) pi_k[j] * dnorm(x, mu_k[j], sigma_k[j]))
  gamma <- gamma / rowSums(gamma)

  # ----- M-step -----
  n_k <- colSums(gamma)
  pi_k <- n_k / length(x)
  mu_k <- colSums(gamma * x) / n_k
  sigma_k <- sqrt(colSums(gamma * (x - mu_k)^2) / n_k)

  # Track log-likelihood
  ll_history[iter] <- log_likelihood(x, pi_k, mu_k, sigma_k)
}

# 4. Output estimated parameters and log-likelihood progression
cat("Estimated mixture weights:\n", pi_k, "\n")
cat("Estimated means:\n", mu_k, "\n")
cat("Estimated standard deviations:\n", sigma_k, "\n")

# Plot log-likelihood to show convergence
plot(ll_history, type = "l", main = "EM Log-Likelihood", xlab = "Iteration", ylab = "Log-Likelihood")
