### Relazione sull'analisi dei risultati del modello Logistic Regression

#### Obiettivo

L'obiettivo del progetto è l'addestramento e la valutazione di due modelli di **Logistic Regression**: uno implementato manualmente e uno fornito da Scikit-learn. I risultati ottenuti sono stati analizzati utilizzando metriche come la **matrice di confusione**, **precision**, **recall**, **F1-score** e **AUC-ROC**, oltre ad una fase di **ottimizzazione bayesiana** per migliorare le prestazioni del modello implementato.

---

### Migliori Iperparametri Trovati

Attraverso un processo di ottimizzazione bayesiana, sono stati trovati i seguenti iperparametri ottimali per il modello implementato:

- **Lambda**: 0.0112
- **Learning Rate**: 0.0152
- **Numero Iterazioni**: 940
- **Regolarizzazione**: Ridge

L'**accuracy** del modello ottimizzato durante la cross-validation è risultata essere **97.48%**.

---

### Valutazione del Modello Logistic Implementato

Il modello implementato ha mostrato ottime prestazioni, come evidenziato dalla **matrice di confusione** e dalle metriche di valutazione:

- **Matrice di confusione**:
    - **True Positives (TP)**: 62
    - **True Negatives (TN)**: 108
    - **False Positives (FP)**: 0
    - **False Negatives (FN)**: 1
- **Precision**: 1.0
- **Recall**: 0.98
- **F1-Score**: 0.992
- **AUC**: 1.00

La curva ROC e il valore AUC perfetto di 1.00 indicano che il modello implementato è in grado di separare perfettamente le classi. Di seguito il grafico della curva ROC:
![[Logistic Regression - ROC modello implementato.png]]

---

### Valutazione del Modello Scikit-learn

Anche il modello Logistic Regression di Scikit-learn ha mostrato ottime prestazioni:

- **Matrice di confusione**:
    - **True Positives (TP)**: 62
    - **True Negatives (TN)**: 106
    - **False Positives (FP)**: 2
    - **False Negatives (FN)**: 1
- **Precision**: 0.968
- **Recall**: 0.984
- **F1-Score**: 0.976
- **AUC**: 1.00

Anche qui il valore AUC è 1.00, con una curva ROC perfetta. Di seguito il grafico della curva ROC per il modello Scikit-learn:
![[Logistic Regression - ROC Scikit-learn.png]]

---

### Confronto tra i Modelli

- **Modello Implementato**: Questo modello ha mostrato una precisione perfetta (1.0) nella predizione dei positivi, con un **F1-score** di 0.992. Questo indica una capacità quasi perfetta nel distinguere tra le classi.
    
- **Modello Scikit-learn**: Anche il modello di Scikit-learn ha avuto ottime prestazioni, con una precision leggermente inferiore (0.968) e un **F1-score** di 0.976. Nonostante la piccola differenza rispetto al modello implementato, entrambi i modelli sono risultati efficaci.
    

---

### Validazione Incrociata

Sono stati eseguiti due tipi di validazione incrociata:

- **K-Fold Cross-Validation**: Entrambi i modelli hanno ottenuto un'accuratezza di **98.06%**.
- **Leave-One-Out Cross-Validation (LOO)**: Anche qui l'accuratezza è risultata **98.06%**, confermando la robustezza del modello su tutti i campioni.

---

### Tempo di Esecuzione

Il tempo totale di esecuzione del processo è stato di **90.92 secondi**, un tempo accettabile per un problema di questa complessità, considerando anche la ricerca dei parametri bayesiana (scikit-learn)

---

### Conclusioni

Entrambi i modelli hanno mostrato prestazioni eccellenti, con un'accuratezza molto alta, un valore AUC perfetto e metriche di classificazione ben bilanciate. La leggera differenza tra i modelli implementato e quello di Scikit-learn suggerisce che il modello manuale, con la corretta ottimizzazione degli iperparametri, può competere con implementazioni consolidate e ottimizzate come quella di Scikit-learn.