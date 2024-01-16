# Introduzione
Come detto spesso il ML è un sottoinsieme dell'intelligenza artificiale ma contaminato da altre materie come la matematica e la statistica. Una prima definizione del '59 fu
> Disciplina che fornisce ai computer labilità di imparare senza essere esplicitamente programmati

Ad oggi una definizione più moderna si basa su tre punti:
1. Un programma apprende da una esperienza *E*
2. Apprende su un compito *T*
3. Apprende con una certa prestazione *P*
Questa arriva da Tom Mitchel nel 1998. 

Ci sono più tipi di ML ma i principali sono due e sono il ML Supervisionato e il Non Supervisionato. Reinforcement e Raccomended sono altri due tipi che non vedremo però.

![[Assets/Multimedia/Machine Learning - schema ML Supervisionato.png]]

All'algoritmo non do in pasto il dato grezzo ma estraggo delle *features* che rappresentano i dati e questa è una operazione fatta a mano. Questo è il primo passo ma serve anche avere delle *labels* che sono fondamentalmente una feature principale che rappresenta il vettore di features. Quindi il modello vede tanti esempi e ognuno con la predizione corretta. Il risultato dell'algoritmo è un modello predittivo che prendendo un nuovo dato, con il proprio vettore di features, predirà quale label rappresenta il vettore. 

![[Assets/Multimedia/Machine Learning - ML Unsupervised.png]]

In questo caso abbiamo un modello unsupervised che quindi non ha la label data da un esperto del dominio. Un esempio è la Principal Composed Analysis (PCA) che riduce il numero di attributi necessari a descrivere il problema, quindi riduce la lunghezza del vettore di label. Utilissimo con dei sistemi [[../Intelligenza Artificiale e Supporto alle Decisioni/Case-Based Reasoning#k-NN|k-NN]] nel CBR.  

## ML Supervisioned
![[Assets/Multimedia/Machine Learning - Predizione prezzo aitazioni.png]]

C'è circa una tendenza in questa distribuzione dei dati ed è che, circa, aumentando la dimensione aumenta il prezzo. Questo è un modello di regressione statistica abbastanza comune. 
In generale si parte dal costruire modelli semplici e se funzionano uno non si tira la zappa sui piedi da solo ma cerca di ottimizzare quello semplice piuttosto che usare subito un modello più complicato. 
Perché è un supervised? Perché ogni dimensione ha già un prezzo su cui può imparare il modello. È anche un modello di regressione poiché ha un output su valori continui. Attenzione che non è detto che un modello più complicato sia più giusto di default. 
![[Assets/Multimedia/Machine Learning - Regressione lineare.png]] ![[Assets/Multimedia/Machine Learning - regressione modello non lineare.png]]
Facciamo un esempio di classificazione tentando di classificare un tumore al seno come benigno o maligno in base alla dimensione. 
![[Assets/Multimedia/Machine Learning - classificazione supervisionata.png]]
Usando una sola dimensione negli attributi ci sono degli errori e potrebbe essere difficile separare le due classi. E anche rappresentando perfettamente i dati con gli attributi potrebbe non risolvere i problemi. 
Portando le dimensioni a 2, al posto che averne una sola, riesco a rappresentare in modo molto differente e potrei avere un vantaggio nella classificazione. Attenzione che come già detto non è lineare l'efficacia del modello col numero di dimensioni, potrebbe anche peggiorare!
![[Assets/Multimedia/Machine Learning - classificazione supervisionata a due dimensioni di attributi.png]]

## ML Unsupervised
Qui siamo senza label, cerco di classificare i dati raggruppandoli per similarità. 
![[Assets/Multimedia/Machine Learning - classificazione genica.png]]
Cerco di raggruppare gli individui in base alla propria espressione genica e ottengo dei gruppi, dei *cluster*. La cluster analysis si applica in tantissimi ambiti.

# Modello Regressione Univariata
Devo cercare la miglior retta che interpola i dati; nemmeno deve venire in mente di cercare una curva. 
![[Assets/Multimedia/Machine Learning - regressione univariata.png]]

Un po' di notazione:
- m $\rightarrow$ dimensione training set
- x $\rightarrow$ variabili/features
- y $\rightarrow$ output/target
- $(x,y)$ $\rightarrow$ coppia di addestramento singolo
- $(x^i, y^i)$ $\rightarrow$ i-esimo addestramento

Quindi, devo cercare di costruire il modello qui sotto dove con *h* indico l'ipotesi
![[Assets/Multimedia/Machine Learning - schema addestramento.png]]

La $h$ deve essere qualcosa che mi permette di trovare la migliore retta possibile. 
![[Assets/Multimedia/Machine Learning - trovare h come equazione della retta.png]]

## Funzione di costo
![[Assets/Multimedia/Machine Learning - richiami retta.png]]
Un ripasso sull'equazione della retta. $\Theta_0$ è l'intercetta. 
**Idea!** Trovare un valore di $\Theta_0$ e di $\Theta_1$ che permetta di avere $h_0(x)$ vicino a $y$ per il nostro set di addestramento $(x,y)$. 
$$J(\Theta_0,\Theta_1)={1\over2m}\sum_{i=1}^m\big(h_{\Theta}(x^i)-y^i\big)^2$$
*Quindi, se faccio lo scarto quadratico medio ottengo una funzione che tanto più ha valori piccoli, meglio è!*
Ricordiamo che $\Theta_0(x^i)$ è il valore predetto.
Questo è l'obbiettivo di tutti i modelli di ML:
$$min[J(\Theta_0,\Theta_1)]$$
Tradotto, minimizzare la *square loss*. Ovviamente ci sono dei metodi come la discesa del gradiente che vedremo più avanti.
La funzione di costo ha una forma parabolica centrata sul coefficiente angolare della retta migliore. La funzione di costo qui nella regressione lineare è convessa e per definizione ha un solo minimo. 
![[Assets/Multimedia/Machine Learning - grafico funzione di costo.png|500]]
In sintesi:
* Ipotesi $\rightarrow$ è $h_\Theta(x)$
* Parametri $\rightarrow$ $\Theta_0$ e $\Theta_1$
* Funzione di costo $\rightarrow$ $J(\Theta_0,\Theta_1)$
* Goal $\rightarrow$ minimizzare la funzione di costo

![[Assets/Multimedia/Machine Learning - funzione di costo della retta.png]]

guardando l'immagine sopra, le coordinate del punto sono $\Theta_0,\Theta_1$ e il punto sta dentro ad un'area che rappresenta l'insieme dei "lenzuoli" come quello sotto. 
![[Assets/Multimedia/Machine Learning - lenzuolo.png]]

## Discesa del Gradiente

Il gradiente è il vettore delle derivate parziali e la dimensione del vettore corrisponde al numero di variabili della funzione. Permette di simulare la discesa lungo la curva della funzione di costo fino a raggiungere il minimo; ricordiamo che il minimo non è locale ma globale siccome è una funzione convessa. 
È come l'algoritmo di [[../Intelligenza Artificiale e Supporto alle Decisioni/Iterative Improvement (Local) search#Hill-climbing|Hill Climing]]. 
L'algoritmo è fatto così:
![[Machine Learning - Algoritmo discesa del gradiente.png]]
Da notare che $\alpha$ è un *iperparametro* che conosciamo come **learning rate**. 
![[Assets/Multimedia/Machine Learning - learning rate grafico.png|400]]
Ecco come avanza il learning rate. Questo iperparametro non va modificato durante l'avanzamento dell'algoritmo poiché si riduce da solo il passo in quanto cambia la pendenza man mano che ci si avvicina al valore centrato nella curva. Si osserva che un valore bassissimo porta sicuramente al valore ma costa mentre troppo grande potrebbe non portare mai al minimo. 
Questo algoritmo si trova anche col nome di batch gradient descend poiché il concetto è che bisogna "ripassare" tutto il training set ad ogni operazione. 

# Regressione Lineare a più Variabili

Adesso la faccia di $h_\Theta$ è così ![[Assets/Multimedia/Machine Learning - h0 multivariabile.png]]
Adesso la variabile $x$ e i parametri $\Theta$ sono vettori di egual dimensione
$$x =\begin{equation}
\begin{bmatrix}
x_1 \\
x_2 \\
\vdots \\
x_n
\end{bmatrix}
\quad \Theta =
\begin{bmatrix}
\Theta_1 \\
\Theta_2 \\
\vdots \\
\Theta_n
\end{bmatrix}
\end{equation}
$$
 Da notare che devo fare la trasposta per poter moltiplicare i vettori, quindi $$h_\Theta(x) = \Theta^T(x)$$
 Questa è la faccia del nuovo algoritmo
 ![[Assets/Multimedia/Machine Learning - discesa gradiente multiariato.png]]
 Lo si fa fino ad $n$.
## Discesa del gradiente: feature scaling
Se la scala di dimensione fra le features schiaccia la funzione c'è il rischio che l'algoritmo sia lento ![[Assets/Multimedia/Machine Learning - feature scaling non scalato.png|400]]
Quindi conviene riscalare per ottenere una funzione non schiacciata. ![[Assets/Multimedia/Machine Learning - riscalatura delle features.png|400]]
### Mean Normalisation
![[Machine Learning - riscalare.png]]
Lavorando così funziona bene per riscalare. 

### Learning Rate
Non esiste una regola standard per sceglierla ma in sostanza devo comunque avere un abbassamento della funzione di costo fino al raggiungimento della soglia di decrescita impostata da noi. Un modo di cercare un valore opportuno è il metodo Grid Search.

### Regressione Polinomiale
Alcune features potrebbero essere quadratiche, cubiche e quindi in generale polinomiali; ad esempio un'area o un volume. 
![[Machine Learning - Regressione Polinomiale.png]]
Ma comunque $h_\Theta$ lo calcolo nello stesso modo! 
Un esempio può essere questo ![[Assets/Multimedia/Machine Learning - housing price.png]]