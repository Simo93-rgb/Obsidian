Per poter trattare il ragionamento incerto bisogna parlare di probabilità per forza di cose, gestire l'incertezza è base quotidiana e torna carino citare Einstein

>Quando le regole della matematica si riferiscono alla realtà non sono certe, quando invece sono certe allora non si riferiscono alla realtà.

Il trattamento dell'incertezza è alla base della IA e come detto qualche dispensa indietro in passato si usavano logiche non monotone ma sono state fallimentari e addirittura fu dimostrato matematicamente che quei formalismi erano di fatto della statistica mascherata. 
La statistica ha un *approccio normativo* e non descrittivo infatti per volare non si copiano gli uccelli ma si creano dei formalismi ad hoc. 
*Fondamentale* è che per noi incertezza non significa non sapere cosa accade o chi fa le cose ma si ragiona su eventi ben definiti e di cui esiste il valore solo che noi non lo sappiamo per mancanza di informazione; appoggiandosi quindi ad una logica booleana. In presenza di *informazione vaga* o approssimata ci sono delle logiche multi valore poiché non sappiamo quanti gradi di verità ci sono. 

## Cox's Justification of Probability
Essenzialmente andiamo a definire alcuni punti della teoria del matematico Richard T. Cox per il quale si definisce come si può razionalmente assegnare probabilità soggettive a eventi in situazioni di incertezza. 
1. **Clarity**: ogni proposizione deve essere ben definita
2. **Rappresentazione scalare**: un singolo numero è sufficiente a rappresentare il grado di certezza (*belief*)
3. **Completezza**: un belief può essere assegnato ad ogni proposizione ben definita
4. **Dipendenza dal contesto**: i belief dipendono da altri belief: $Belief(X|Y)$
5. **Condizionamento ipotetico**: $Belief(X \land B) = f[Belief(X|Y), B(Y)]$
6. **Complementarietà**: $Belief(¬X)=f[Belief(X)]$ ossia che il mio grado di certezza con cui credo in $¬X$ dipende da una funzione di quanto credo in $X$ il che è ovvio in probabilità poichè se credo che al $0.5$ esca testa devo credere che al $1-0.5$ esca croce.
7. **Coerenza**: c'è equivalente belief in due proposizioni logicamente equivalenti

## Elementi di Probabilità
Qui diventa inutile ripetere le stesse cose viste a statistica, la nomenclatura è pure quasi la stessa. [[Richiami di Probabilità|Qui]] la nota con tutto e di più.
Alcune precisazioni su come verranno indicate le cose in questa sezione:
- La proposizione $a = \text{True}$ corrisponde all'evento $A = \text{insieme di eventi elementari per cui } a= \text{ True}$
	- Ad esempio se $D={1,4,5}$ allora $d$ è proposizione e $D$ è evento
	- Se si lavora su insiemi si usa la notazione insiemistica mentre se si lavora su proposizioni si usa la notazione logica.
- Vedere gli [assiomi di Kolmogorov](https://it.wikipedia.org/wiki/Andrej_Nikolaevi%C4%8D_Kolmogorov) Questi sono riportati anche [[Richiami di Probabilità|nella nota]] di statistica
- Vedere la [[Formula di Bayes e Teorema Probabilità Totali#Bayes Probabilità condizionata|probabilità condizionata]] 
	- In IA il concetto di eventi mutualmente esclusivi ed esaustivi servono per descrivere quelle situazioni dove ho un elenco finito di ipotesi e solo quelle sono le mie possibilità. 
- Vedere anche il [[Formula di Bayes e Teorema Probabilità Totali#Teorema delle Probabilità Totali|Teorema Probabilità Totali]]
	- **Attenzione** che con *indipendenza* indichiamo quando il verificarsi di un evento non ha alcuna relazione col verificarsi di un altro, mentre con *mutua esclusione* gli eventi sono decisamente dipendenti fra loro perché il verificarsi di un evento implica necessariamente il non verificarsi dell'altro. Quindi mutua esclusione implica dipendenza.

Siccome in IA spesso si ha la necessità di rappresentare due eventi distinti vien da sé che servono due variabili casuali - qui indicate da rv da random variable - che dovranno essere necessariamente combinate con una qualche diavoleria statistica. 
### Probabilità congiunte
Abbiamo due vc $A$ e $B$ con eventi atomici $\{a_1, a_2\}$ e $\{b_1, b_2\}$ rispettivamente, andrò ad indicare con $\mathbb{P}(A,B)$ la probabilità congiunta di $A$ e $B$ che sarà fatta dal prodotto cartesiano degli elementi elementari delle due vc. $$\mathbb{P}(A,B) = \left\{\begin{array}{ll}\mathbb{P}([a_1,b_1]) \\\mathbb{P}([a_1,b_2]) \\ \mathbb{P}([a_2,b_1]) \\ \mathbb{P}([a_2,b_2]) \\ \end{array}\right\}$$
Se ho la probabilità congiunta posso ottenere le probabilità marginali che nel caso qui sopra sono $\mathbb{P}(A)$ e $\mathbb{P}(B)$. L'operazione di passaggio dalla congiunta alla marginale è della *operazione di marginalizzazione*. 

# Digressione sulla statistica
Formalmente la statistica è definita dagli assiomi di Kolmogorov ma questo non impedisce di dare diverse interpretazioni pur rispettando questi ultimi. Ci sono due scuole di pensiero che meritano di essere menzionate:
- **Approccio Frequentista** (Von Mises)
	- statistica classica
	- Un evento può essere ripetuto indefinite volte 
	- $\lim_{n_=\infty}{S^n(E) \over n} = \mathbb{P}(E)$
		- Dove $S^n(E)$ è il numero di volte che l'esperimento E ha fato un risultato 
		- $n$ è il numero di esperimenti totali. 
- **Approccio Soggettivista** (de Finetti)
	- statistica Bayesiana
	- La probabilità è un concetto soggettivo ma assegnato in modo coerente
	- C'è il concetto di scommessa equa, ossia se ho un evento unico e irripetibile la $\mathbb{P}(E)$ è data dalla quantità di denaro che si è disposta a scambiare ricevendo 1 se vinco e zero se perdo. 
		- Coerenza la intendo che se potessi ripetere più volte lo scambio in media non vinco e non perdo.

In IA è moto più popolare l'approccio soggettivista perché meglio si sposa con la natura dei problemi che in IA ci si trova a modellare. 
La [[Formula di Bayes e Teorema Probabilità Totali#Bayes Probabilità condizionata|Formula di Bayes]] diviene importantissima soprattutto bisogna imparare a masticare i concetti di *probabilità a priori* e *probabilità a posteriori*. Secondo i frequentisti non bisognerebbe usare la prob. a posteriori ma per noi vige il STI CAZZI. 


