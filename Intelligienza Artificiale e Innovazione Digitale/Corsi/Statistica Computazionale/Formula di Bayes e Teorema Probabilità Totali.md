# Bayes
Siamo nell'ambito delle probabilità condizionate, quelle che scrivo così per capirci $\mathbb{P}(A|B)$ ossia la probabilità che si verifichi $A$ sapendo che si è verificato $B$, dove $A$ e $B$ sono eventi che appartengono allo spazio di probabilità. Scrivo subito la formula e andiamo poi a commentarla: $$\mathbb{P}(A|B) = {\mathbb{P}(A)\mathbb{P}(B|A) \over \mathbb{P}(B)}$$**Dove**: 
- $\mathbb{P}(A)$ è la probabilità a priori ossia è la probabilità che conosco di base
- $\mathbb{P}(A|B)$ è la probabilità a posteriori ossia quella che devo di solito calcolare conoscendo quella a priori. 
- $\mathbb{P}(B|A) \over \mathbb{P}(B)$ è un fattore correttivo
Quindi Bayes mi dice come cambia la *probabilità a priori* sapendo che si verifica $B$.

# Teorema delle Probabilità Totali
Faccio immediatamente uno spoiler sul perché lo si usa e la risposta è molto semplice, ossia che nel 90% dei casi lo si usa per trovare il denominatore della [[Formula di Bayes e Teorema Probabilità Totali#Bayes|Formula di Bayes]]. Andiamo ora ad enunciarlo.
Abbiamo la solita terna che definisce lo [[Richiami di Probabilità#Spazio di Probabilità|spazio di probabilità]], poi abbiamo $B, \{A_1, ..., A_n\} \in \mathcal{A} \land \{A_1, ..., A_n\} = \Omega$, dove gli $A_i$ sono disgiunti a due a due. Vale quindi la seguente identità: $$\mathbb{P}(B) = \sum_{i=1}^n \mathbb{P}(B|A_i)\mathbb{P}(A_i)= \sum_{i=1}^n \mathbb{P}(B \cup A_i)$$Quindi così ho modo di trovare il denominatore del fattore correttivo. 
Graficamente è facile da digerire ![[Teorema Probabilità Totali.png]]
### Esempio
In una fabbrica di lampadine ho due macchinari che chiamerò, con fantasia, $A$ e $B$ dove $A$ produce il 40% delle lampadine dell'azienda mentre $B$ produce il 60$ delle lampadine dell'azienda. Vado poi a definire delle probabilità condizionate di errore:
- $\mathbb{P}(G|A)$ è la probabilità che una lampadina sia guasta se prodotta da A
	- $\mathbb{P} = 0.01$
- $\mathbb{P}(G|B)$ è la probabilità che una lampadina sia stata prodotta da B
	- $\mathbb{P} = 0.05$
**Domanda**: Qual è la probabilità che una lampadina guasta sia prodotta da A? Quindi so che è guasta e questa è la mia *probabilità a priori*, mi manca la probabilità a posteriori. $$\mathbb{P}(A|G) = {\mathbb{P}(A \cup G) \over \mathbb{P}(G)} = {\mathbb{P}(A)\mathbb{P}(G|A) \over \mathbb{P}(G)}$$Ecco che siamo nella situazione dove abbiamo quasi tutto e ci manca il denominatore $\mathbb{P}(G)$, ma ora noi siamo potentissimi e possiamo usare il teorema delle prob. totali. $$\mathbb{P}(G) = \mathbb{P}(G|A)\mathbb{P}(A) + \mathbb{P}(G|A)\mathbb{P}(B)$$Sostituisco nella formula precedente e ottengo: $$\mathbb{P}(A|G) = {\mathbb{P}(A)\mathbb{P}(G|A)\over \mathbb{P}(G|A)\mathbb{P}(A) + \mathbb{P}(G|A)\mathbb{P}(B)} = {0.4*0.01 \over 0.01*0.4 + 0.05*0.6}$$ $$\mathbb{P}(A|G) = {2 \over 17} = 11,75\%$$
  
