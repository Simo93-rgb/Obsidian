# Introduzione
Come detto spesso il ML è un sottoinsieme dell'intelligenza artificiale ma contaminato da altre materie come la matematica e la statistica. Una prima definizione del '59 fu
> Disciplina che fornisce ai computer labilità di imparare senza essere esplicitamente programmati

Ad oggi una definizione più moderna si basa su tre punti:
1. Un programma apprende da una esperienza *E*
2. Apprende su un compito *T*
3. Apprende con una certa prestazione *P*
Questa arriva da Tom Mitchel nel 1998. 

Ci sono più tipi di ML ma i principali sono due e sono il ML Supervisionato e il Non Supervisionato. Reinforcement e Reccomended sono altri due tipi che non vedremo però.

![[Assets/Multimedia/Machine Learning - schema ML Supervisionato.png]]

All'algoritmo non do in pasto il dato grezzo ma estraggo delle *features* che rappresentano i dati e questa è una operazione fatta a mano. Questo è il primo passo ma serve anche avere delle *labels* che sono fondamentalmente una feature principale che rappresenta il vettore di features. Quindi il modello vede tanti esempi e ognuno con la predizione corretta. Il risultato dell'algoritmo è un modello predittivo che prendendo un nuovo dato, con il proprio vettore di features, predirà quale label rappresenta il vettore. 

![[Assets/Multimedia/Machine Learning - ML Unsupervised.png]]

In questo caso abbiamo un modello unsupervised che quindi non ha la label data da un esperto del dominio. Un esempio è la Principal Composed Analysis (PCA) che riduce il numero di attributi necessari a descrivere il problema, quindi riduce la lunghezza del vettore di label. Utilissimo con dei sistemi [[2.2 Case-Based Reasoning#k-NN|k-NN]] nel CBR.  

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
È come l'algoritmo di [[1.4 Iterative Improvement (Local) search#Hill-climbing|Hill Climing]]. 
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
![[Machine Learning - regolarizzazione funzione di costo.png]]
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
![[Machine Learning - algo regolarizzazione lineare.png]]
### Regolarizzazione: regolarizzare la logic regression
La funzione di costo, ossia la cross entropy, si vede aggiungere il fattore $+\frac{\lambda}{2m}\sum_{i=1}^n\Theta_j^2$. Grazie a questo posso applicare la stessa logica vista qui sopra. 

# Reti Neurali: ipotesi non lineare
Attenzione che qui è una introduzione molto di base. Quando non posso fare regressione lineare intervengono loro, soprattutto nel caso dove ho molte features e fare una regressione tradizionale diventa impossibile. Una fotografia ha una quantità enorme di pixel, avere ogni pixel rappresentato come una feature diventerebbe impossibile. 

## Reti Neurali: neuroni e cervello
Le prime rappresentazioni di un modello matematico di come si comporta il nostro cervello risale agli anni '40 con la cibernetica. Grazie all'algoritmo *back propagation* si è riusciti ad utilizzare quelle rappresentazioni. Molti furono i problemi fra cui la potenza di calcolo insufficiente. Solo nel 2010 circa si è riusciti a combinare qualcosa di tangibile. 

## Reti Neurali: prima rappresentazione
![[Machine Learning - rappresentazione neurone.png|500]]
L'idea è di scopiazzare il nostro cervello, quindi avere un neurone che comunica insieme ad altri neuroni scambiando segnali elettrici. Una connessione neuronale si chiama *sinapsi*. 
![[Machine learning - schema neurone sintetizzato.png]]
Lo scopo del neurone artificiale è combinare i segnali che gli arrivano coi loro pesi e dare in output un nuovo segnale. In matematichese significa fare una *combinazione lineare*. Ogni neurone ha una *activation function* che è la $f$ qui sopra rappresentata. Quindi la activation function è quella che produce l'output quando riceve in pasto la combinazione lineare $x_i$. 
In modo convenzionale lo rappresentiamo come sotto.
![[Machine Learning - schema neurone con bias.png]]
Alleghiamo una funzione $y = \Phi\big(\sum_i\Theta_i x_i\big)$. 
#### Perceptron
È un neurone che funziona con una soglia di attivazione mediante una funzione di attivazione $$H(x)=\begin{cases}1  \text{ se } x\geq 0 \\ 0 \text{ se }x<0\end{cases}$$
Possiamo vedere il valore $\Theta_0$ come un valore di threshold. $$\Theta_0 + \sum_{i=1}^n \Theta_ix_i \geq 0 \leftrightarrow \sum_{i=1}^n \Theta_ix_i \geq -\Theta_0$$
#### Neuron Model: linear unit
La sua funzione è la funzione identità $$h_\Theta(x)=x$$
![[Machine Learning - neurone lineare.png]]
#### Neuron Model: logistic unit
La sua funzione è $$h_\Theta(x)={{1}\over 1+e^{-\Theta^Tx}}$$
### Multi-Layer Perceptron
Posso combinare più perceptron per ottenere una rete con funzione di attivazione non lineare. Una *Artificial Neural Network (ANN)* deve avere almeno 3 *layer*. ![[Machine Learning - ANN con bias.png|450]]
Da notare che tutti i nodi di un livello $k$ sono connessi col livello $k+1$ e queste connessioni sono quelle che modellano il concetto di sinapsi. Attenzione che c'è sempre un neurone di bias ad ogni livello ed è sempre fissato a 1 e come gli altri si connette a tutti i nodi del livello successivo. Attenzione, scontato ma i bias non sono connessi fra loro. 
- **Input layer**: sono valori fissi
- **hidden layer**: hanno tutti la stessa funzione di attivazione
- **output layer**: possono esserci più neuroni e il tipo di neurone dipende da cosa deve fare il modello, classificazione o regressione.
Per convenzione utilizziamo:
- $a_n^{(k)} \rightarrow$ per indicare il valore di attivazione del neurone numero $n$, al livello $k$
- $x_n \rightarrow$ per indicare il solo input layer
- $\Theta_{in}^{(k)} \rightarrow$ per indicare che il parametro $\Theta$ del livello $k$ parte dal neurone $n$ del livello $k$ e arriva al neurone numero $i$ del livello $k+1$.
	- Ad esempio $\Theta_{10}^1$ indica il parametro del livello di input che parte dal neurone zero del livello input e arriva al neurone 1 del layer 2.
	- ![[Machine Learning - matrice dei parametri della rete.png]]
	- Con questo sistema posso costruire una matrice dove ogni riga rappresenta il collegamento con tutti i neuroni del livello successivo.

Ma come si calcolano i valori dei nodi $a$? ![[Machine Learning - calcolo valore nodi.png|550]]Allo stesso modo calcolo il livello output. ![[Machine Learning - calolo output layer.png|550]]Per evitare di portarsi dietro grandi equazioni si può sintetizzare la sola combinazione lineare prima di applicare la punzione $g$ ottenendo quindi una scrittura equivalente $$a_n^{(k)} = g(z_n^{(k)})=g(\Theta_n^{(k-1)}a_n^{(k-1)})$$Graficamente si rende ancora più cristallino. ![[Machine Learning - sintetizzazione parametri theta in z.png|550]]
Attenzione, va sempre tutto rappresentato in vettori e matrici quando si programma, altrimenti utilizzando altre strutture dati e navigazioni con cicli degenererebbe in un codice inutilizzabile. 
Questa implementazione si chiama **forward propagation** ossia propagazione in avanti. 

## Reti Neurali: prime intuizioni
Utilizzando una funzione sigmoide posso rappresentare gli operatori logici AND, OR, NOT... utilizzando un neurone. Basta approssimare il valore ottenuto dalla funzione di attivazione. Per fare cose sofisticate è necessario introdurre dei livelli intermedi![[Machine Learning - costruzione espressione logica con una ANN.png]]<p align="center"><em>costruzione rete per modellare espressione logica</em></p>
## Reti Neurali: classificazione multiclasse
Il layer di output ha tanti neuroni quanti sono le classi che voglio classificare ![[Machine Learning - classificazione multiclasse.png]]
Lo scopo è avere un vettore che mi da una distribuzione di probabilità sulle classi e la rete dirà quale classe è la più probabile. Si utilizzano vettori chiamati *one-hot* e la *one-hot encoding* è la tecnica con il quale do alla rete gli esempi su cui imparare. Ad esempio, seguendo l'ordine nell'immagine sopra, su un vettore $[P,C,M,T]$ se voglio dare un esempio in cui voglio che la $C$ di car sia la classificazione dell'esempio il vettore sarà $[0,1,0,0]$. La dimensione del vettore corrisponde sempre al numero di classi. 
Attenzione che nessuno garantisce che la distribuzione dello strato di output sia normalizzata a 1 e che ogni nodo ha valori compresi fra zero e uno. Quindi, come normalizzo a 1? Si usa una normalizzazione chiamata *soft-max*$$\mathbb{P}(y=j)=\sigma_j(Z)=\frac{e^{Z_j}}{\sum_{i=1}^Ke^{Z_i}}$$dove $K$ è il numero di classi e $z$ è il vettore di output. Questa normalizzazione viene fatta aggiungendo un layer che prende il nome di *soft-max layer*. 
Osservazione: se voglio dire qual è la classe più probabile non serve questo layer ma basta cercare il valore più alto in $Z$, mentre se voglio anche dire qual è la probabilità associata alla previsione devo per forza farlo. 

# Reti Neurali: Apprendimento

## Funzione di Costo

### Classificazione Binaria e Multi-Classe

La funzione di costo è un elemento cruciale nelle reti neurali, che misura la differenza tra le uscite previste e quelle reali. Nella classificazione binaria, spesso si utilizza la funzione di costo logistica o cross-entropy, che calcola il costo associato a una previsione errata. In contesti di classificazione multi-classe, la cross-entropy viene generalizzata per gestire più classi. Questa funzione è fondamentale per guidare l'ottimizzazione dei pesi della rete durante l'addestramento.

### Backpropagation
Dopo aver avanzato con la forwardpropagation ho una previsione $a$ con la quale posso misurare l'errore commesso rispetto a $y$, il valore vero. A questo punto posso indicare questo errore con $\delta_i^{(l)}$, ogni layer $l$ ha un nodo $i$ che ha commesso un errore. 
![[Machine Learning - backpropagation intro.png]]
È una propagazione concettualmente al contrario rispetto alla farwordpropagation. 
Per ogni $l<L$$$\delta_i^{(l)}=\bigg(\sum_{k=i}^{s_{l+1}}\delta_k^{(l+1)}\Theta_{ki}^{(l)}\bigg)a_i^{(l)}(1-a_i^{(l)})$$
Per ogni output unit $$\delta_i^L=a_i^L-y_i$$
Si può scrivere anche che la derivata della funzione di costo rispetto a $\Theta$ è il risultato della backpropagazione.  $$\frac{\partial}{\partial \Theta_{ij}^{(l)}}J(\Theta)=a_j^{(l)}\delta_i^{(l+1)}$$
### Random Initialization
Non fare mai la inizializzazione a zero perché si rendono identici i nodi del layer rendendo di fatto il layer come fosse a singolo nodo. In realtà è così anche con altri valori purché identici. Bisogna inizializzare nel modo più random possibile. 

# Practical Machine Learning 
## Diagnostic and Evaluation

## Model Selection
Divido il dataset in 3 insiemi e imparo sul *training set*, testo tutti i modelli ottenuti sul *validation set* e seleziono il modello migliore che andrò infine a testare sul *test set*. Questo se non sono sicuro di che grado di modello voglio, se ad esempio avessi una imposizione ad un modello di grado 2 allora l'operazione di *validation* non serve. Oppure, se avessi l'iperparametro lambda potrei usare questa tecnica per trovale il valore ottimale. 

### Cross Validation
È una tecnica più valida dello split netto del dataset. Identifico un valore *k-fold* che divide in parti uguali il dataset, uno standard è $k=10$ quindi avrò il dataset divisio in 10 fold. Ad esempio, addestro su 9 fold e testo su uno, l'operazione la eseguo $k$ volte e ogni volta ho un fold differente di test. Così tutti i dati vengono usati $k$ volte per test e $k-1$ volte per training. *Il test è sempre e solo su un fold*. 

#### Leave-One-Out (LOO)
È un caso speciale di cross validation, se ho 100 elementi farò 100 addestramenti dove lascio fuori un solo elemento come test.  
Ottima per dataset piccoli, attenzione che su dataset grandi sono un mare di calcoli e una k-fold cross validation sarebbe consigliata. 

## Bias vs Varianza
Il bias del modello corrisponde ad *underfitting* mentre la varianza a *overfitting*. 
![[Machine Learning - bias vs variance.png|450]]

Plottando cosa succede in training e in test aumentando il grado del modello ottengo questo ![[Machine Learning - plot test e training aumentando grado modello.png|450]]
Bisogna stare molto attenti perché un modello troppo complicato "disimpara" a generalizzare e in test commette più errori.
Il caso di underfitting lo si può vedere quando l'errore di test e l'errore di training sono grandi e magari anche una bassa distanza fra loro, mentre il caso di overfitting lo si vede quando la distanza fra gli errori è alta e in particolare l'errore di training è basso. 

## Regolarizzazione bias e varianza
Adatto $\lambda$ nel $J(\Theta)$ 

## Learning Curves
Aumentare il numero di esempi aumenta l'errore di training ma diminuirà l'errore in fase di test. ![[Machine Learning - curva errore test e training.png]]
Attenzione che se c'è un alto bias aumentare la dimensione non aiuta da sola, poiché l'errore di training rimane troppo alto. Se invece ho un alta varianza conviene aumentare la dimensione del dataset. Quindi:
- underfitting $\rightarrow$ non serve aumentare la dimensione del dataset
- overfitting $\rightarrow$ serve aumentare la dimensione del dataset

## Deciding what to try next
Suppose you have implemented regularized linear regression to predict housing prices. However, when you test your hypothesis in a new set of houses, you find that it makes unacceptably large errors in its prediction. What should you try next? ​

- Get more training examples​ $\rightarrow$ fixes high variance    
- Try smaller sets of features​ $\rightarrow$ fixes high variance    
- Try getting additional features​ $(x_1^2,x_2^2,x_1,x_2...)$ $\rightarrow$ fixes high bias    
- Try adding polynomial features​ $\rightarrow$ fixes high bias    
- Try decreasing​ $\lambda$ $\rightarrow$ fixes high bias    
- Try increasing​ $\lambda$ $\rightarrow$ fixes high variance

Nelle reti neurali ho una architettura a priori (layer, neuroni...) che se è piccolina avrà un alto bias mentre una rete molto grande invece avrà un'alta varianza. È intuitivo, infatti una rete molto articolata sarà molto brava a fittare perfettamente i dati ma abbiamo già visto che significa, appunto, alta probabilità di overfitting. 

### Confusion Matrix
![[Machine Learning - confusion matri.png]]
La matrice di confusione rappresenta la mia classe e come io l'ho classificata, lo abbiamo visto a statistica nel montecarlo per inferenza. ![[Machine Learning - confusion matrix MC inferenza.png]]

![[Pasted image 20240304114109.png]]
Dove:
- TPR $\rightarrow$ True Positive Rate o *Recall* (*Sensitivity* o Sensibilità)
- TNR $\rightarrow$ True Negatove Rate o Specificità (*Specifity*)
- FPR $\rightarrow$ False Positive Error o *Fallout*
- FNR $\rightarrow$ False Negative Rate

Dalla matrice di confusione posso costruire l'**accuratezza** $$a={{TP+TN}\over m}$$ossia la percentuale di corretta classificazione. Attenzione che una accuratezza elevata non significa che il modello sia buono e bisogna testare anche altro, ma se è bassa allora lo si può buttare. 
**Cohen's Kappa Coefficient** $$k={{a-p_e}\over{1-p_e}}$$dove $p_e=p_++p_-$ con $p_+$ è la probabilità di prenderci per caso sui casi positivi e rispettivamente coi negativi con $p_-$. Se $k$ tende a zero allora l'accuratezza non è significativa, mentre se tende a 1 allora è significativa. 
$$\begin{align}
&\quad p_+={{TP+FN\over m}*{TP+FP\over m}}\\
&\quad p_-= {{TN+FN\over m}*{TN+FN\over m}}
\end{align}$$
### Esempio
![[Machine Learning - esempio cohen kappa coeff..png]]
Se la matrice è asimmetrica si dice che le classi sono **sbilanciate** e sicuramente l'accuratezza non sarà significativa. Esistono tecniche artificiali di ribilanciamento delle classi ma non lo vedremo.

## ROC Curve
Receiver Operating Characteristic è una curva plottata su un quadrante con ascisse che è FPR e sulle ascisse TPR. ![[Machine Learning - ROC curve.png]]
- $(0,1)$ perfect classification​    
- $(0,0)$ always class –​    
- $(1,1)$ always class +     
- $(1,0)$ + classified as – and viceversa​
La distanza dal punto $(1,0)$ è la discriminante per dire che un classificatore $C$ sia meglio di un classificatore $A$. 
Se cambio gli iperparametri e plotto il punto del clasificatore $A$ con parametri differenti avrò una curva. Posso quindi mettere a paragone curve diverse per classificatori diversi a iperparametri differenti. ![[Machine Learning - ROC Curve comparazione.png]]
L'area sotto la curva ROC, ossia il parametro AUC (Area Under the Curve), può valere massimo 1, più alto il valore migliore il classificatore. C'è una digressione matematica vista alla lezione di statistica parlando di inferenza con Montecarlo. 

## Error Metric for Skewed Classes
Definiamo la precisione $$prec = {TP\over TP+FP}$$ ed è l'intersezione in figura, ossia quanti positivi sul totale dei classificati positivi. ![[Machine Learning -  precision.png|300]]
Richiamiamo il concetto di recall visto prima nella [[Machine Learning#Confusion Matrix|Matrice di Confusione]], a parole è il caso dei casi misurati positivi sul totale dei casi positivi. 
![[Machine Learning - comparazione falsi positivi e falsi negativi.png|450]]
Se alzo le predizioni dei falsi positivi abbasso i falsi negativi, ad esempio nel caso di una diagnosi di tumore mi conviene farlo così non rischio di non dare le cure ai malati perché falso negativo al prezzo di far prendere un coccolone al falso positivo. Quindi se aumento precision ho meno recall e vice versa. 
Posso fare una curva fra precision e recall e calcolare l' area sotto la curva.![[Machine Learning - curva PR.png]] Attenzione che punto iniziale e finale non si riescono sempre ad avere perché precision e recall che valgono esattamente 1 o molto vicini ma si usa un trucco, si proietta linearmente dal punto più vicino fino all'asse.
#### Confronto
![[Machine Learning - f1 score.png]]
$F_1 \,Score$ è anche chiamato media armonica. Esiste anche $F_\beta \,Score$: $$F_\beta=(1+\beta)^2{prec*rec\over \beta^2*prec+rec}$$ dove $\beta$ è il peso dell'importanza relativa di rev e prec dove con valori maggiori di 1 do importanza a rec, minore do importanza a prec. Se $\beta = 1$ allora è esattamente $F_1\,Score$.