### 1. **Mean Absolute Error (MAE)**

Il **Mean Absolute Error** (MAE) misura l'errore medio in valore assoluto tra i valori predetti e quelli reali. A differenza dell'RMSE, non eleva gli errori al quadrato, quindi non è così sensibile agli outlier.
$$\text{MAE} = \frac{1}{n} \sum_{i=1}^{n} | y_i - \hat{y}_i |$$

- **Interpretazione**: Il MAE ti dà una stima della media delle differenze assolute tra valori predetti e reali. A differenza dell'RMSE, il MAE non penalizza fortemente errori più grandi, il che lo rende meno sensibile agli outlier.
- **Quando usarlo**: Usa il MAE quando vuoi una visione più robusta degli errori che non enfatizzi troppo i valori fuori scala.

### 2. **Coefficient of Determination (R² Score)**

L'**R² score** (o coefficiente di determinazione) misura quanto bene il modello riesce a spiegare la variabilità dei dati. È una metrica di bontà del fit, e varia tra -∞ e 1. Un valore vicino a 1 indica che il modello spiega bene la varianza dei dati.

$$R^2 = 1 - \frac{\sum_{i=1}^{n} (y_i - \hat{y}_i)^2}{\sum_{i=1}^{n} (y_i - \bar{y})^2}$$​

Dove yˉ\bar{y}yˉ​ è la media dei valori reali.

- **Interpretazione**: Un $R^2$ prossimo a 1 indica un buon fit del modello, mentre un valore vicino a 0 indica che il modello non spiega meglio dei valori medi. Un valore negativo significa che il modello sta performando peggio rispetto a una semplice predizione con la media dei valori.
- **Quando usarlo**: L'R² score è utile per capire quanto il modello riesce a spiegare la varianza dei dati target. Va usato sempre come complemento alle altre metriche.

### 3. **Mean Squared Error (MSE)**

Il **Mean Squared Error** (MSE) è simile all'RMSE, ma senza prendere la radice quadrata. Mentre l'RMSE ha il vantaggio di essere nella stessa unità dei dati, l'MSE amplifica maggiormente gli errori più grandi a causa del quadrato.

$$\text{MSE} = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2$$

- **Interpretazione**: L'MSE amplifica gli errori più grandi più dell'RMSE, dato che non c'è la radice quadrata che li "smorza". È utile per catturare grandi errori.
- **Quando usarlo**: Usa l'MSE quando vuoi avere un'idea del rischio associato agli outlier.

### 4. **Explained Variance Score**

L'**Explained Variance Score** misura la varianza spiegata dal modello, simile all'R², ma è un po' meno severa nelle penalizzazioni degli outlier.

$$\text{Explained Variance} = 1 - \frac{\text{Var}(y - \hat{y})}{\text{Var}(y)}$$
- **Interpretazione**: Un valore pari a 1 indica che il modello spiega completamente la varianza, mentre un valore pari a 0 significa che non spiega nessuna varianza.
- **Quando usarlo**: È utile per capire in che misura il modello riduce l'incertezza rispetto ai dati originali.

### 5. **Mean Absolute Percentage Error (MAPE)**

Il **Mean Absolute Percentage Error** (MAPE) misura l'errore assoluto in percentuale rispetto ai valori reali, rendendo la metrica più interpretabile in termini relativi.

$$\text{MAPE} = \frac{100}{n} \sum_{i=1}^{n} \left| \frac{y_i - \hat{y}_i}{y_i} \right|$$
- **Interpretazione**: Esprime la differenza media percentuale tra i valori reali e predetti. È utile quando vuoi avere un'idea degli errori in termini di percentuali.
- **Quando usarlo**: Usa il MAPE quando vuoi valutare l'errore in percentuale, ma attenzione ai valori reali $y_i$​ prossimi a zero, che potrebbero distorcere la metrica.

### 6. **Cross-Validation Error**

La **cross-validation** è una tecnica utile per stimare la performance del modello su dati non visti e per verificare se il modello è sovra-adattato (**overfitting**) o sotto-adattato (**underfitting**). La k-fold cross-validation è un metodo popolare per farlo.

- **Quando usarlo**: È sempre utile per ottenere una valutazione più affidabile delle prestazioni del modello, specialmente in situazioni con dataset di piccole dimensioni o con molti parametri da ottimizzare.

### 7. **Residual Analysis**

Oltre alle metriche numeriche, è fondamentale eseguire un'**analisi dei residui**. I residui sono la differenza tra i valori reali e quelli predetti, e devono essere distribuiti casualmente intorno allo zero per indicare che il modello è ben calibrato.

- **Grafici utili**:
    - **Residual plot**: Un grafico dei residui che mostra se ci sono pattern sistematici (ad esempio, un modello che sottostima o sovrastima costantemente).
    - **QQ plot**: Un grafico che ti mostra se i residui seguono una distribuzione normale.

### Sintesi delle metriche di valutazione raccomandate:

1. **RMSE**: Fornisce un'idea generale dell'errore medio, penalizzando fortemente gli errori grandi.
2. **MAE**: Offre un valore medio dell'errore, robusto rispetto agli outlier.
3. **R²**: Misura quanto il modello spiega la variabilità del target.
4. **MSE**: Variante dell'RMSE più severa sugli errori grandi.
5. **Explained Variance**: Indica quanta varianza viene spiegata dal modello, utile insieme all'R².
6. **MAPE**: Misura l'errore percentuale medio, utile per interpretazioni relative.
7. **Cross-Validation**: Per garantire che il modello generalizzi bene su nuovi dati.
8. **Residual Analysis**: Per capire se ci sono problemi sistematici nelle previsioni.

#### Come interpretare i risultati?

- **RMSE**: Valori più bassi indicano un errore più piccolo.
- **MAE**: Valori più bassi indicano un errore medio più piccolo.
- **R²**: Più è vicino a 1, meglio è.
- **MAPE**: Valori più bassi indicano un errore percentuale medio più piccolo (valori prossimi a 0% sono i migliori).
- **Explained Variance**: Più vicino a 1, meglio è (come $R^2$).