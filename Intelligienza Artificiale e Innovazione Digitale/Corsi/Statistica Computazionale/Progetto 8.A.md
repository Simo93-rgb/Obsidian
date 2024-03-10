## Testo
Conduct a Monte Carlo study to estimate the coverage probabilities of the standard normal bootstrap confidence interval, the basic bootstrap confidence interval, and the percentile confidence interval. Sample from a normal population and check the empirical coverage rates for the sample mean. Find the proportion of times that the confidence intervals miss on the left, and the proportion of times that the confidence intervals miss on the right.

Eseguite uno studio Monte Carlo per stimare le probabilità di copertura dell'intervallo di confidenza *bootstrap normale standard*, dell'intervallo di confidenza *bootstrap di base* e dell'intervallo di confidenza *percentile*. Campionare da una *popolazione normale* e verificare i tassi di copertura empirici per la media del campione. Trovare la proporzione di volte in cui gli intervalli di confidenza mancano a sinistra e la proporzione di volte in cui gli intervalli di confidenza mancano a destra.

### Breve cenno sui 3 Bootstrap
L'intervallo di confidenza bootstrap normale standard, l'intervallo di confidenza bootstrap di base e l'intervallo di confidenza percentile sono tutti metodi utilizzati in statistica per stimare l'incertezza o la variabilità associata a una statistica campionaria, come la media. Questi intervalli sono spesso costruiti attraverso tecniche di ricampionamento bootstrap. Ecco una breve spiegazione di ciascuno:

*Intervallo di confidenza Bootstrap normale standard:*

- Definizione: Questo intervallo si basa sulla distribuzione normale standard (distribuzione z). 
- Procedura: Il bootstrap consiste nel ricampionare ripetutamente con sostituzione dal campione originale. Per ogni ricampionamento, viene calcolata la media del campione. L'intervallo di confidenza viene quindi costruito utilizzando i quantili della distribuzione di queste medie ricampionate, assumendo una distribuzione normale.
- Rappresentazione matematica: In genere, l'intervallo di confidenza del 95% viene costruito utilizzando il 2,5° e il 97,5° percentile della distribuzione delle medie bootstrap.

*Intervallo di confidenza Bootstrap di base:*

- Definizione: Questo intervallo si basa sulla distribuzione della statistica del campione bootstrap (ad esempio, la media del campione), senza assumere una distribuzione teorica specifica.
- Procedura: Simile al bootstrap normale standard, ma invece di assumere una distribuzione normale, l'intervallo viene costruito direttamente dalla distribuzione della statistica del campione bootstrap. I percentili di questa distribuzione empirica vengono utilizzati per formare l'intervallo di confidenza.
- Rappresentazione matematica: Il 2,5° e il 97,5° percentile della distribuzione della statistica campionaria bootstrap sono comunemente utilizzati per un intervallo di confidenza del 95%.

*Intervallo di confidenza percentile:*

- Definizione: Questo intervallo viene costruito utilizzando direttamente i percentili dei dati osservati.
- Procedura: L'intervallo di confidenza viene definito scegliendo i percentili dalla distribuzione empirica dei dati osservati. Ad esempio, un intervallo di confidenza del 95% può essere definito come l'intervallo tra il 2,5° e il 97,5° percentile dei dati.
- Rappresentazione matematica: L'intervallo viene determinato selezionando i percentili desiderati dalla distribuzione empirica.


In sintesi, questi intervalli di confidenza forniscono diversi approcci per stimare l'incertezza intorno a una statistica campionaria. La scelta dell'intervallo da utilizzare può dipendere dalle ipotesi di base sulla distribuzione dei dati e dalle proprietà desiderate dell'intervallo. Gli intervalli bootstrap normale e bootstrap di base sono particolarmente utili quando la distribuzione dei dati non è nota o non è normale, mentre l'intervallo percentile è un approccio più semplice che utilizza direttamente i percentili osservati.

# Codice R

## Versione 1

```R
# Install and load the necessary package
install.packages("boot")
library(boot)

# Set parameters for the simulation
set.seed(123)  # Set seed for reproducibility
n_simulations <- 1000  # Number of simulations
sample_size <- 100  # Size of each sample
true_mean <- 0  # True mean of the normal distribution
true_sd <- 1  # True standard deviation of the normal distribution

# Function to perform Monte Carlo simulation
monte_carlo_simulation <- function() {
  # Generate a random sample from a normal distribution
  sample_data <- rnorm(sample_size, mean = true_mean, sd = true_sd)
  
  # Function to calculate the sample mean and bootstrap confidence intervals
  calculate_confidence_intervals <- function(data) {
    # Calculate sample mean
    sample_mean <- mean(data)
    
    # Standard normal bootstrap confidence interval
    standard_normal_bootstrap_ci <- boot(data, function(x) mean(x), R = 1000)$conf
    
    # Basic bootstrap confidence interval
    basic_bootstrap_ci <- boot(data, function(x) quantile(x, c(0.025, 0.975)), R = 1000)$t
    
    # Percentile confidence interval
    percentile_ci <- quantile(data, c(0.025, 0.975))
    
    # Check if the true mean is within each confidence interval
    coverage_standard_normal <- (standard_normal_bootstrap_ci[1] <= true_mean) &
                               (standard_normal_bootstrap_ci[2] >= true_mean)
    
    coverage_basic <- (basic_bootstrap_ci[1, 1] <= true_mean) &
                      (basic_bootstrap_ci[2, 2] >= true_mean)
    
    coverage_percentile <- (percentile_ci[1] <= true_mean) &
                           (percentile_ci[2] >= true_mean)
    
    return(c(coverage_standard_normal, coverage_basic, coverage_percentile))
  }
  
  # Perform the calculation for one simulation
  coverage_results <- calculate_confidence_intervals(sample_data)
  
  return(coverage_results)
}

# Perform Monte Carlo simulation for the specified number of times
results <- replicate(n_simulations, monte_carlo_simulation())

# Calculate proportions of times intervals miss on the left and right
miss_left <- colMeans(results < 0)
miss_right <- colMeans(results > 0)

# Print results
print("Coverage Proportions:")
print(results)
print("Proportion of Times Intervals Miss on the Left:")
print(miss_left)
print("Proportion of Times Intervals Miss on the Right:")
print(miss_right)

```

## Versione 2
```R
# Funzione per calcolare l'intervallo di confidenza Bootstrap standard
standard_bootstrap_ci <- function(sample_data, alpha) {
  n <- length(sample_data)
  boot_samples <- replicate(1000, sample(sample_data, replace = TRUE))
  boot_means <- apply(boot_samples, 2, mean)
  quantiles <- quantile(boot_means, c(alpha/2, 1-alpha/2))
  return(quantiles)
}

# Funzione per calcolare l'intervallo di confidenza Bootstrap basico
basic_bootstrap_ci <- function(sample_data, alpha) {
  n <- length(sample_data)
  boot_samples <- replicate(1000, sample(sample_data, replace = TRUE))
  boot_means <- apply(boot_samples, 2, mean)
  se <- sd(boot_means)
  sample_mean <- mean(sample_data)
  ci_lower <- sample_mean - qnorm(1-alpha/2) * se
  ci_upper <- sample_mean + qnorm(1-alpha/2) * se
  return(c(ci_lower, ci_upper))
}

# Funzione per calcolare l'intervallo di confidenza Bootstrap percentili
percentile_bootstrap_ci <- function(sample_data, alpha) {
  n <- length(sample_data)
  boot_samples <- replicate(1000, sample(sample_data, replace = TRUE))
  boot_means <- apply(boot_samples, 2, mean)
  quantiles <- quantile(boot_means, c(alpha/2, 1-alpha/2))
  return(quantiles)
}

# Funzione per eseguire lo studio Monte Carlo e calcolare la probabilità di copertura
monte_carlo_study <- function(sample_size, alpha, iterations) {
  coverage_probabilities <- list()
  for (i in 1:iterations) {
    sample_data <- rnorm(sample_size)
    
    # Calcola gli intervalli di confidenza per ogni metodo
    standard_ci <- standard_bootstrap_ci(sample_data, alpha)
    basic_ci <- basic_bootstrap_ci(sample_data, alpha)
    percentile_ci <- percentile_bootstrap_ci(sample_data, alpha)
    
    # Verifica se la media campionaria è all'interno dell'intervallo di confidenza
    standard_coverage <- mean(sample_data > standard_ci[1] & sample_data < standard_ci[2])
    basic_coverage <- mean(sample_data > basic_ci[1] & sample_data < basic_ci[2])
    percentile_coverage <- mean(sample_data > percentile_ci[1] & sample_data < percentile_ci[2])
    
    # Memorizza la probabilità di copertura per ogni metodo
    coverage_probabilities[[i]] <- c(standard = standard_coverage, basic = basic_coverage, percentile = percentile_coverage)
  }
  
  # Restituisce la media delle probabilità di copertura per ogni metodo
  return(sapply(coverage_probabilities, mean))
}

# Esegui lo studio Monte Carlo con un esempio di configurazione
sample_size <- 100
alpha <- 0.05
iterations <- 1000
coverage_probabilities <- monte_carlo_study(sample_size, alpha, iterations)
print(coverage_probabilities)
```

## Versione 3

```R
# Impostazione dei parametri dello studio Monte Carlo
set.seed(123)  # Impostazione del seed per la riproducibilità

# Numero di iterazioni Monte Carlo
n_simulations <- 1000

# Dimensione del campione
sample_size <- 30

# Livello di confidenza desiderato
confidence_level <- 0.95

# Inizializzazione delle variabili per la registrazione delle proporzioni
left_miss_rate_normal <- 0
right_miss_rate_normal <- 0

left_miss_rate_basic <- 0
right_miss_rate_basic <- 0

left_miss_rate_percentile <- 0
right_miss_rate_percentile <- 0

# Funzione per calcolare l'intervallo di confidenza bootstrap normale standard
normal_bootstrap_ci <- function(data) {
  mean_val <- mean(data)
  std_dev <- sd(data)
  z <- qnorm(c((1 - confidence_level) / 2, 1 - (1 - confidence_level) / 2))
  ci_lower <- mean_val - z[2] * std_dev
  ci_upper <- mean_val - z[1] * std_dev
  return(c(ci_lower, ci_upper))
}

# Funzione per calcolare l'intervallo di confidenza bootstrap di base
basic_bootstrap_ci <- function(data) {
  bootstrap_samples <- replicate(1000, mean(sample(data, replace = TRUE)))
  ci_lower <- quantile(bootstrap_samples, (1 - confidence_level) / 2)
  ci_upper <- quantile(bootstrap_samples, 1 - (1 - confidence_level) / 2)
  return(c(ci_lower, ci_upper))
}

# Funzione per calcolare l'intervallo di confidenza percentile
percentile_bootstrap_ci <- function(data) {
  ci_lower <- quantile(data, (1 - confidence_level) / 2)
  ci_upper <- quantile(data, 1 - (1 - confidence_level) / 2)
  return(c(ci_lower, ci_upper))
}

# Esecuzione dello studio Monte Carlo
for (i in 1:n_simulations) {
  # Campionamento da una popolazione normale
  population <- rnorm(1000)
  sample_data <- sample(population, size = sample_size, replace = TRUE)
  
  # Calcolo degli intervalli di confidenza
  normal_ci <- normal_bootstrap_ci(sample_data)
  basic_ci <- basic_bootstrap_ci(sample_data)
  percentile_ci <- percentile_bootstrap_ci(sample_data)
  
  # Verifica se l'intervallo manca a sinistra o a destra
  left_miss_rate_normal <- left_miss_rate_normal + (normal_ci[1] > mean(sample_data))
  right_miss_rate_normal <- right_miss_rate_normal + (normal_ci[2] < mean(sample_data))
  
  left_miss_rate_basic <- left_miss_rate_basic + (basic_ci[1] > mean(sample_data))
  right_miss_rate_basic <- right_miss_rate_basic + (basic_ci[2] < mean(sample_data))
  
  left_miss_rate_percentile <- left_miss_rate_percentile + (percentile_ci[1] > mean(sample_data))
  right_miss_rate_percentile <- right_miss_rate_percentile + (percentile_ci[2] < mean(sample_data))
}

# Calcolo delle proporzioni finali
prop_left_miss_normal <- left_miss_rate_normal / n_simulations
prop_right_miss_normal <- right_miss_rate_normal / n_simulations

prop_left_miss_basic <- left_miss_rate_basic / n_simulations
prop_right_miss_basic <- right_miss_rate_basic / n_simulations

prop_left_miss_percentile <- left_miss_rate_percentile / n_simulations
prop_right_miss_percentile <- right_miss_rate_percentile / n_simulations

# Stampa dei risultati
cat("Probabilità di mancanza a sinistra (Bootstrap Normale):", prop_left_miss_normal, "\n")
cat("Probabilità di mancanza a destra (Bootstrap Normale):", prop_right_miss_normal, "\n\n")

cat("Probabilità di mancanza a sinistra (Bootstrap di Base):", prop_left_miss_basic, "\n")
cat("Probabilità di mancanza a destra (Bootstrap di Base):", prop_right_miss_basic, "\n\n")

cat("Probabilità di mancanza a sinistra (Bootstrap Percentile):", prop_left_miss_percentile, "\n")
cat("Probabilità di mancanza a destra (Bootstrap Percentile):", prop_right_miss_percentile, "\n")

```