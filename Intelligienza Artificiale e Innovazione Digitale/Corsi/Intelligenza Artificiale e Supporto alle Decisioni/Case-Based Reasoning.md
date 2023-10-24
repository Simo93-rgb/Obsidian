Il **CBR** è una metodologia per risolvere problemi nuovi adattando le soluzioni di problemi simili precedenti. 
![[CBRSchema.png]]
Ci sono vari esempi di CBR e vediamone alcuni.

#### Esempi di CBR
- **Classificazione** di un paziente clinico in base alla sintomatologia/esami
- **Soluzione Compilata** ossia la spiegazione del problema $x$ è derivabile da quello già visto col problema $y$
- **Valutazione del Valore** ossia verificare che il valore di qualcosa sia corretto osservando l'ambiente
- **Giustificare coi Precedenti** ossia risolvere il problema nello stesso modo in cui si è risolto un precedente. Un po' come accade nella legislatura anglosassone. 
- **Valutazione delle Opzioni** ossia valutare le possibili conseguenze in base a cosa è successo nei casi simili. "*Se attaccassimo Cuba/Russia otterremo una situazione come Pearl Harbor*"

## Architettura R4
![[ArchR4CBR2.png]]
1. **Problem**: descrivo il problema da risolvere con una *tupla* di attributi. Il problema è il punto di partenza dello schema
2. **Retrieve**: passo di recupero dai *previous cases* per recuperare i casi più simili che sono presenti in memoria. 
	1. **Retrieved Case**: ho recuperato un caso simile
		1. **Solved Case**: ho una soluzione proposta
	2. **New Case**: il mio problema non è simile a nessun caso in memoria
3. **Revise**: avendo la *domain knowledge* posso fare questo passo. Ad esempio provo a dare un antibiotico differente ma questo adattamento ha bisogno di essere costruito con conoscenza del dominio.
	1. Se la soluzione è adoperabile allora confermo la soluzione, altrimenti fallisco
4. **Retain**: il caso esaminato lo voglio aggiungere in memoria per ampliare la KB? 
	1. Caso fallito: interessante inserirlo così un esperto del dominio inserisce la soluzione e lui per la prossima volta saprà qualcosa in più.
	2. Retrived Case: non ha senso aggiungere perché già lo avevo in memoria già molto simile e diventa uno spreco di memoria oltre che, molto peggio, i sistemi vanno in tilt se ci sono troppi dati.
Curiosità, il primo schema è del 1993! 

# Similarità e Distanza
Cosa significa che due casi sono simili fra di loro? Possiamo impostare un parallelismo fra distanza e similarità per poi misurare quest'ultima in termini di distanza. 
Una metrica o distanza rispetta questi requisiti: $$d(x,y)=0\Leftrightarrow x=y$$ $$d(x,y)\le d(z,x)+d(z,y)$$
![[Pasted image 20231024110636.png]]

# k-NN

## Pesatura Attributi
![[Pasted image 20231024110814.png]]
### Tipologia Attributi (features)
Possono essere nominali (categorici) o lineari. Nel caso dei nominali abbiamo colori, simboli... Mentre i lineari possono essere discreti o continui e nel caso discreto c'è un caso che può confondere: attributi lineari discreti simbolici. Succede quando mappo con dei numeri dei concetti, ad esempio una temperatura alta è simbolico ma posso mapparla con 39°C. 

### Metriche su Features
![[Pasted image 20231024111459.png]]
dove $range_f = val_{max} - val_{min}$ 
Funziona male su features nominali però. In alternativa si può usare una tabella di similarità ![[Tabella Similarità features nominali.png]]

### Heterogeneus Value Distance Metric
![[Pasted image 20231024121233.png]]
#### Esempio
![[Pasted image 20231024121539.png]]
$d_f(chiaro,scuro)=0.225=$
$=\sqrt{|\mathbb{P}(M|chiaro)-\mathbb{P}(M|scuro)|^2+|\mathbb{P}(F|chiaro)-\mathbb{P}(F|scuro)|^2}$

## Implementazione k-NN
Siccome la ricerca lineare è molto costosa con problemi grandi esiste l'applicazione dei *kd-trees* che è $\mathbb{O}(log (n))$ ma siccome l'implementazione è incredibilmente fastidiosa da mantenere alla fine lo sweet spot è l'utilizzo della ricerca lineare.
Osservazione: se vuoi fare il figo parla di questa parte ma all'esame non viene chiesta.

# Adattamento
Siccome è difficile definire delle strategie generali si cerca di definire delle regole ad-hoc a seconda del dominio. Ci sono due approcci: *transformational adaptation* e *derivational adaptation*.

## Trasformational Adaptation
Supponiamo che nel caso del riuso di un caso noto ho un problema di utilizzo della soluzione, ad esempio paziente allergico all'antibiotico, posso modificare la soluzione o aggiungendo un pezzo alla soluzione:
- Cambia antibiotico X con Y
- Dai antibiotico X ma con farmaco W antistaminico
## Derivational Adaptation
Tengo traccia non solo delle soluzioni ai casi ma anche di come ci sono arrivato e quando cerco nei casi conosciuti riapplico il metodo con cui nel caso noto arrivai al risultato. Ho usato una dimostrazione per assurdo in un caso matematico, se il caso è simile la soluzione la cerco riapplicando il metodo per assurdo.

# Retain 
Qui si decide quando si deve apprendere ma anche quando si deve dimenticare un caso. Lo scopo è tenere in memoria solo i casi utili altrimenti va in tilt il sistema. Nel Machine Learning e in particolare nel CBR si sente spesso parlare di utilità, di come definirla e di quali siano i suoi limiti. Non sempre vale il concetto che più si sa e meglio è, ingurgitare qualunque caso, anche se buono, porta a problemi. Prende il nome di *swamping problem* nel CBR e in generale nel ML si chiama *utility problem*.
![[CBR grafico per swamping problem.png]]
La performance dipende da: 
- Tempo di esecuzione
- Qualità della risposta
- Competenza del sistema
Queste tre misure di performance dipendono sia dal numero di casi in memoria sia dalla qualità dei casi in memoria. Il problema di utilità è trovare il numero di casi e la qualità dei casi che massimizzano la prestazione del CBR ma siccome non c'è una ricetta generale che funziona bisogna esaminare caso per caso. Esistono anche altri problemi minori rispetto al utility problem.

## Curse of Dimensionality
Gli approcci *lazy learning* funzionano tanto peggio quanto maggiore è il numero delle dimensioni. In generale vale che k-NN degenera all'aumentare delle dimensioni, in generale in numero di NN in una griglia uniforme in uno spazio n-dimensionale è pari a 2d dove d è il numero delle dimensioni.