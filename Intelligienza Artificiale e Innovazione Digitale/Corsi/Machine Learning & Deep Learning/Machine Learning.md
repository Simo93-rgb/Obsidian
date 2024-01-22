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
![[Assets/Multimedia/Machine Learning - Algoritmo discesa del gradiente.png]]
Da notare che $\alpha$ è un *iperparametro* che conosciamo come **learning rate**. In generale, se è un iperparametro significa che definisce l'algoritmo, mentre se è parametro allora definisce il modello. 
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
![[Assets/Multimedia/Machine Learning - riscalare.png]]
Lavorando così funziona bene per riscalare. 

### Learning Rate
Non esiste una regola standard per sceglierla ma in sostanza devo comunque avere un abbassamento della funzione di costo fino al raggiungimento della soglia di decrescita impostata da noi. Un modo di cercare un valore opportuno è il metodo Grid Search.

### Regressione Polinomiale
Alcune features potrebbero essere quadratiche, cubiche e quindi in generale polinomiali; ad esempio un'area o un volume. 
![[Assets/Multimedia/Machine Learning - Regressione Polinomiale.png]]
Ma comunque $h_\Theta$ lo calcolo nello stesso modo! 
Un esempio può essere questo ![[Assets/Multimedia/Machine Learning - housing price.png]]
# Logic Regression: Classification

Anche se c'è la parola regressione non è davvero un modello di regressione ma è un modello di classificazione. Il nome fuorviante arriva dal fatto che eredita delle caratteristiche dalla regressione lineare "vera". 
Classificare significa dividere in gruppi ognuno con delle caratteristiche sue (classi). 
Non va bene interpolare con una retta e fare regressione lineare, altrimenti l'aggiunta di valori come la ❌ in estrema destra porterebbe a ottenere una retta che non funziona più bene.
![[Machine Learning - logic regression.png]]

Logic Regression: $0 \leq h_\Theta(x) \leq 1$ dove però ora l'ipotesi è fatta così: $$h_\Theta(x) = g(\Theta^Tx)$$dove la $g$ viene detta funzione logistica. $$g(z) = {{1}\over 1+e^{-z}}$$
![[Machine Learning - Funzione sigmoide (logistica).png]]

Quindi, esplicitando io la funzione di ipotesi in questo modello l'ho fatta così:$$h_\Theta(x) = g(z) = {{1}\over 1+e^{-\Theta^Tx}}$$
ed è la probabilità che il mio esempio sia positivo. 
$h_\Theta(x) = \mathbb{P}(y=1|x;\Theta)$ si legge come la probabilità che $y$ sia $1$ dato $x$ parametrizzato da $\Theta$. 

## Logic Regression: Decision Boundary
Osservando la funzione sigmoide possiamo intuire che per avere valori positivi devo avere che $\Theta^T x \geq 0$. 
Se posso separare le classi con una retta allora si dice che le classi sono linearmente separabili. ![[Machine Learning - classi linearmente separabili.png]]
Avendo $\Theta_0=-3; \Theta_1 = 1; \Theta_2=1$ e avendo $h_\Theta(x)=g(\Theta_0+\Theta_1x_1+\Theta_2x_2)$ avrei che la retta in verde è data da $\Theta^Tx=-3+x_1+x_2$.
Quindi: $$\text{positive region}(❌):= \;\;\;\; x_1+x_2\geq3$$
$$\text{negative region}(🔵):= \;\;\;\; x_1+x_2\leq3$$
Posso anche fare modelli che disegnano aree anche molto contorte ma non vanno bene questi modelli perché si genera *overfitting*.
![[Machine Learning - modello eccessivo.png|305]]

## Logic Regression: Funzione di Costo
Nella regressione lineare la funzione di costo abbiamo visto essere convessa e quindi per definizione ha un solo minimo. Qui invece purtroppo non lo è e quindi posso rimanere incagliato in un minimo locale.$$Cost(h_\theta(x),y)={1\over2}(h_\Theta(x)-y)^2$$
Esiste una funzione alternativa di costo che è convessa e quindi posso tornare ad avere garantito il minimo globale. $$Cost(h_\theta(x),y)=\begin{cases}-log(h_\Theta(x)) \;\;\text{se }y=1\\-log(1-h_\Theta(x)) \;\;\text{se }y=0 \end{cases}$$
![[Machine Learning - costo y=1.png|400]]
![[Machine Learning - costo y=0 classificazione logica.png|400]]
Questa funzione si chiama *cross entropy loss*. 
Lo scopo è sempre trovare $\Theta$ che minimizzi la situazione. $$J(\Theta)={1\over m}\sum_{i=1}^m Cost(h_\Theta(x^i),y)$$
Per poter minimizzare la funzione applico la [[Machine Learning#Discesa del Gradiente|discesa del gradiente]] tenendo in considerazione le stesse cose viste precedentemente. 
Per ottenere il minimo: $$min_\Theta J(\Theta) = repeat\{\Theta_j = \Theta_j -\alpha \frac{\partial}{\partial \Theta_j}J(\Theta) \}$$
$$min_\Theta J(\Theta) = repeat\{\Theta_j = \Theta_j -\alpha \sum_{i=1}^m (h_\Theta(x^i)-y^i)x^i\}$$
![[Machine Learning - Logic vs Linear regression.png]]
Questi algoritmi vanno sempre presi dalle API offerte da tensorflow e compagnia. 

## Multi-class Classification
E se non mi accontento più di classificazione binaria? Qui si intende con multi un numero di classe maggiore di 2. Con tante classi possiamo mappare le classi in numeri naturali senza problemi. 
![[Machine Learning - 2 classi vs Multi-Class.png]]

Non si può applicare direttamente la classificazione vista prima, dove la metto la retta? Ovviamente perde di senso. Posso usare una tecnica speciale però. 

### Multi-class Classification: One-vs-All
![[Machine Learning - One VS All.png]]

Qui si restituisce il valore massimo ottenuto dal classificatore binario. Il numero di classificatori corrisponde al numero di classe. Siccome ho "uno contro tutti" si finisce per avere ogni modello che si addestra su classi sbilanciate. 

### Multi-class Classification: One-vc-One
Gioco tutti contro tutti singolarmente. $a,b,c \rightarrow a\;vs\;b;a\;vs\;c;b\;vs\;c$. Il numero di classi qui è: $$\#class = \frac {k(k-1)}{2}$$

# Regolarizzazione: il problema dell'overfitting
Quando si lavora con il machine learning ci sono due aspetti fondamentali:
1. **BIAS**: sono delle assunzioni eterogenee che vincolano il modello, anche sbagliate. Ad esempio se voglio che il modello sia lineare allora assumo che il mio modello lo sia e la situazione è vincolata così. Bias significa pregiudizio. Se il mio modello fitta poco i dai allora si parla di *underfitting*. Quindi il mio modello ha un alto bias ossia che i vincoli sono troppo stringenti e non si adatta al training set. Può anche voler dire che il modello sia troppo semplice. 
2. **Varianza del Modello**: il modello cambia significativamente anche con piccole fluttuazioni di dati del training set. È un modello che fitta troppo i dati che ha visto e quindi è paragonabile al ripetere "a pappagallo" ma questo è un problema poiché non generalizza. Attenzione, non c'è correlazione con varianza statistica. 

![[Machine Learning - Regularization.png]]
<p align="center"><em>Caso regressione</em></p>

![[Machine Learning - Regularization classificazione.png]]
<p align="center"><em>Caso logic regression</em></p>

### Gestione overfitting
1. Posso ridurre il numero di features e posso farlo manualmente oppure posso farlo con un algoritmo
2. Regolarizzazione

## Regolarizzazione: funzione di costo
È un meccanismo matematico che funziona sulla funzione di costo, sostanzialmente tiene tutte le features ma riduce il valore dei parametri $\Theta_j$. 
![[Pasted image 20240122145127.png]]
Intuitivamente si potrebbe pensare di ridurre le features più grandi per ottimizzare la funzione di costo
$$min_\Theta J(\Theta)= \frac{1}{2m} {\sum_{i=1}^m (h_\Theta(x^i)-y^i)^2 +\alpha\Theta_3+\beta\Theta_4}$$
Il passo successivo è lasciar decidere all'algoritmo quale penalizzare senza dare precedenza alle più grandi. Attenzione che $\Theta_0$ è l'unico che non si regolarizza mai. In generale: $$min_\Theta J(\Theta)= \frac{1}{2m} {\sum_{i=1}^m (h_\Theta(x^i)-y^i)^2 \lambda \sum_{i=1}^n\Theta_j^2}$$
*Attenzione che $\lambda$ è il parametro di regolarizzazione*. Si noti come una semplificazione eccessiva, ossia una scelta erronea di $\lambda$, porta ad una semplificazione eccessiva del modello rischiando di avere underfitting. 
Osservazione: $\sum_{i=1}^n\Theta_j^2$ è la norma del vettore $\Theta$, indicato con $\|\Theta\|_2$. Più la norma è grande più le features dentro al vettore contano. 
![[Machine Learning - andamento regolarizzazione.png]]
<p align="center"><em>da notare che al crescere di alpha io ho comunque un buon fit ma mi allontano dall'avere overfitting, fino al degenerare</em></p>
Da notare che $\alpha$ viene anche chiamato **parametro di ridge**. 

### Regolarizzazione: regolarizzare la regressione lineare
Aggiungendo alla discesa del gradiente il fattore di correzione $-\frac{\lambda}{m}\Theta_j$.
![[Pasted image 20240122152258.png]]
### Regolarizzazione: regolarizzare la logic regression
La funzione di costo, ossia la cross entropy, si vede aggiungere il fattore $+\frac{\lambda}{2m}\sum_{i=1}^n\Theta_j^2$. Grazie a questo posso applicare la stessa logica vista qui sopra. 

# Reti Neurali: ipotesi non lineare
Attenzione che qui è una introduzione molto di base. Quando non posso fare regressione lineare intervengono loro, soprattutto nel caso dove ho molte features e fare una regressione tradizionale diventa impossibile. Una fotografia ha una quantità enorme di pixel, avere ogni pixel rappresentato come una feature diventerebbe impossibile. 

## Reti Neurali: neuroni e cervello
Le prime rappresentazioni di un modello matematico di come si comporta il nostro cervello risale agli anni '40 con la cibernetica. Grazie all'algoritmo *back propagation* si è riusciti ad utilizzare quelle rappresentazioni. Molti furono i problemi fra cui la potenza di calcolo insufficiente. Solo nel 2010 circa si è riusciti a combinare qualcosa di tangibile. 

## Reti Neurali: prima rappresentazione
![[Pasted image 20240122154205.png|500]]
L'idea è di scopiazzare il nostro cervello, quindi avere un neurone che comunica insieme ad altri neuroni scambiando segnali elettrici. Una connessione neuronale si chiama *sinapsi*. 
![[Pasted image 20240122154324.png]]
Lo scopo del neurone artificiale è combinare i segnali che gli arrivano coi loro pesi e dare in output un nuovo segnale. In matematichese significa fare una *combinazione lineare*. Ogni neurone ha una *activation function* che è la $f$ qui sopra rappresentata. Quindi la activation function è quella che produce l'output quando riceve in pasto la combinazione lineare $x_i$. 
In modo convenzionale lo rappresentiamo come sotto.
![[Pasted image 20240122154730.png]]
Alleghiamo una funzione $y = \Phi\big(\sum_i\Theta_i x_i\big)$. 
#### Perceptron
È un neurone che funziona con una soglia di attivazione mediante una funzione di attivazione $$H(x)=\begin{cases}1  \text{ se } x\geq 0 \\ 0 \text{ se }x<0\end{cases}$$
![[Pasted image 20240122155635.png]]

#### neuron Model: linear unit
#### Neuron Model: logistic unit

