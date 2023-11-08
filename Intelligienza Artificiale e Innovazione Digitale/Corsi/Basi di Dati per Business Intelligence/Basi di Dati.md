Qui farò un estrema sintesi delle cose che servono per l'esame essendo un modulo che per un informatico risulta banale. 

# Vincoli di Integrità
I vincoli di integrità sono regole o condizioni imposte su una base di dati per garantire l'accuratezza, la coerenza e l'affidabilità dei dati stessi. Essi definiscono le relazioni tra i dati nelle tabelle e specificano le condizioni che devono essere soddisfatte affinché i dati mantengano la loro integrità. Ad esempio in una tabella dei voti con attributo "E Lode" è opportuno che ci sia un vincolo che mi impedisca di metterci "vero" nel caso in cui il voto sia diverso da 30. Immaginate un DB con "27 e lode",direi poco senso. 
I principali tipi di vincoli di integrità includono:

1. **Vincolo di chiave primaria:** Garantisce che ogni riga in una tabella abbia un valore unico nella colonna chiave primaria.
    
2. **Vincolo di chiave esterna:** Assicura che i valori in una colonna corrispondano a quelli presenti in un'altra tabella, solitamente nella colonna chiave primaria di quella tabella.
    
3. **Vincolo di unicità:** Garantisce che i valori in una colonna specifica siano univoci per tutte le righe della tabella.
    
4. **Vincolo di default:** Specifica un valore predefinito per una colonna nel caso in cui un valore non venga fornito durante l'inserimento di dati.
    
5. **Vincolo di check:** Limita i valori che possono essere inseriti in una colonna basandosi su una condizione specifica.
    
6. **Vincolo di not null:** Impedisce l'inserimento di valori nulli in una colonna che non può contenere valori vuoti.
## Chiavi
Prima bisogna parlare di **super chiave** ossia un insieme di $K$ attributi per la relazione $R$ tale che non esistono due tuple $t$ uguali:  $$t_1[K]\not=t_2[K]\rightarrow K \text{ è super chiave}$$La **chiave** è una super chiave minimale, ossia $K$ è un insieme di attributi la cui numerosità è minima.  
Siccome i valori nulli sono un problema si evitano nelle chiavi e si indica con **chiave primaria** una chiave che non ammette valori nulli. 
*Notazione*: la chiave la indichiamo con una sottolineatura quando rappresentiamo graficamente una relazione.

## Vincoli di Integrità Referenziale
I vincoli di integrità referenziale sono regole che assicurano la coerenza dei dati in un database. In particolare, si riferiscono alla relazione tra le chiavi primarie e esterne nelle tabelle. Un vincolo di integrità referenziale impedisce l'inserimento di valori che non hanno una corrispondenza nella chiave primaria di un'altra tabella. In questo modo, si garantisce la coerenza e la validità dei dati all'interno del database. 
In sostanza una relazione $R_1$ ha una chiave $K_1$ che è composta da un insieme di attributi di cui almeno uno fa riferimento ad un attributo della relazione $R_2$.
Nel caso di eliminazione di una tupla in una relazione che ha attributi che sono chiave in altre relazioni è possibile procedere
1. a cascata eliminando tutte le tuple in tutte le relazioni in cui compare come chiave
2. inserendo ``null`` nel valore dell'attributo chiave 

# Modello ER
In sostanza nelle fasi di creazione di un sistema software ci sono fari schemi da produrre per raggiungere l'obbiettivo nel miglior modo possibile. Uno schema *Entity Relationship* è il formalismo che ha vinto per la rappresentazione concettuale che permette di rappresentare le idee ad un livello di astrazione che non dipende dai sistemi tecnologici. 
![[Basi di Dati -  Schema ER.png]]
Partendo dall'immagine ricordiamo che bisogna aver chiaro cosa sono:
- relazioni "uno a uno", "uno a molti", "zero a molti"...
- rappresentare la chiave esterna con quella barra e si legge, ad esempio, "Dipartimento.nome è chiave esterna per Impiegato". Nel caso preciso poi Impiegato ha chiave sia Codice sia Dipartimento. 
Una volta fatto questo schema sarebbe opportuno creare un dizionario per le entità e uno per le relazioni. Se necessario, a parte, scrivere vincoli non esprimibili dallo schema in linguaggio naturale o formale basta che lo segni. 

# Forme Normali
Sono delle proprietà formali da applicare all'intera base di dati per garantire alcune caratteristiche di qualità. In sostanza non voglio che operazioni di aggiornamento, inserimento o cancellazione mi sputtanino il database e quindi devo mettere delle regole che mantengano la struttura. 

### Forma Normale di Boyce-Codd (BCNF)
Un'attributo $A$ si dice dipendente funzionalmente da una chiave $K$ in una relazione $R$ se, eliminando $A$ dalla relazione, il resto della relazione dipende in modo funzionale esclusivamente da $K$. La BCNF richiede che ogni determinante di dipendenza funzionale in una relazione sia una chiave candidata. In altre parole, se abbiamo un'attributo $A$ che dipende funzionalmente da una chiave $K, A$ deve essere una chiave candidata.

Formalmente, una relazione $R$ è in BCNF se, per ogni dipendenza funzionale non banale $X\rightarrow Y\in R$ allora $X$ è una super chiave.

### Terza Forma Normale (3NF)
La Terza Forma Normale si basa sulla nozione di *transitive dependency*. Una relazione è in 3NF se, per ogni dipendenza transitiva $X\rightarrow Z$ dove $X$ è una super chiave e $Z$ non è parte di alcuna chiave candidata, allora $X\rightarrow Y$ dove $Y$ è un attributo in $R$, deve essere una chiave candidata.
In altre parole, la 3NF elimina le dipendenze transitive non dirette da una chiave. Ciò significa che se abbiamo un'attributo non chiave che dipende funzionalmente da un'altra chiave non primaria, dobbiamo separare questi attributi in una nuova tabella.

# Linguaggi
Esistono due famiglie di linguaggi pr basi di dati dove una opera sullo schema, ossia i **DDL - Data Definition Language**, e l'altra aggiorna e interroga e la chiamiamo **DML - Data Manipulation Language**. 
Nell'ambito delle interrogazioni alla base di dati abbiamo:
- Algebra relazionale
- Calcolo relazionale
- SQL - Structured Query Language
- QBE - Query By Example

## Algebra Relazionale
Diciamocelo: "It's a pain in the ass", ma viene chiesto all'esame...
### Operatori Monadici
Nel caso di operatori monadici le operazioni le indichiamo sempre nella forma $$OPERATORE_{operazione}(Relazione)$$
#### RENAME
Ad esempio il RENAME per cambiare nome ad una colonna $$REN_{Genitore\leftarrow Padre}(Paternità)$$
#### SELECT
Così facendo la relazione Paternità subirà un cambio di nome all'attributo Padre che diverrà Genitore. Oppure l'operatore di selezione $$SEL_{condizione\,booleana}(Relazione)$$che darà come risultato un sottoinsieme della relazione che rispetterà la condizione booleana. $$SEL_{stipendio>50\,\land\, filiale=Milano}(Impiegati)$$
#### PROJECTION
Se la SELECT produce un sottoinsieme che ha tutte le colonne dell'insieme di partenza, la proiezione produce un sottoinsieme con tutte le righe dell'insieme di partenza ma con una selezione di colonne. $$PROJ_(listaAttributi)(Relazione)$$![[Basi di Dati - Confronto PROJ vs SEL.png]]
#### PROJ + SEL
Supponiamo di avere una relazione fatta così

|matricola|cognome|filiale|stipendio|
|----------|----------|--------|---------|
|0008|Baggins|Middle-earth|12|
|5998|Wayne|Gotham|7350|
|9553|Link|Hyrule|50|
|0151|Ketchum|Kanto|23|

Posso unire proiezione e selezione per andare a recuperare un sottoinsieme con informazioni interessanti a partire dalla relazione nella base di dati. $$PROJ_{matricola,cognome}(SEL_{stipendio\ge50}(Impiegati))$$Ottenendo come risultato

|matricola|cognome|
|---------|-----------|
|5998|Wayne|
|9553|Link|

### JOIN Naturale o Interno
È un operatore binario che produce come risultato il prodotto cartesiano delle due relazioni coinvolte. C'è da precisare che non sempre le tuple della relazione contribuiscono poiché è anche possibile che non ci sia corrispondenza fra i valori dello stesso attributo. 
![[Basi di Dati - Join Naturale con mancata corrispondenza.png]]

### Join Esterno
Questo tipo di JOIN estende con valori nulli le tuple che verrebbero tagliate furi da un JOIN interno. Esistono tre tipi di JOIN esterno e si chiamano: destro, sinistro, completo

#### JOIN Sinistro
Mantiene tutte le tuple della prima relazione estendendole con valori nulli se necessario. ![[Basi di Dati - LEFT JOIN.png]]

#### JOIN Destro
Mantiene tutte le tuple della seconda relazione estendendole con valori nulli se necessario. 
![[Basi di Dati - RIGHT JOIN.png]]

#### JOIN Completo
Mantiene tutte le tuple di tutte le relazioni coinvolte estendendole con valori nulli se necessario.
![[Basi di Dati - Full JOIN.png]]

#### Esempi
![[Basi di Dati - Tabelle per esempi con Impiegati e Supervisione.png]]
Trovare i capi degli impiegati che guadagnano più di 40.
$PROJ_{Capo}\bigg(Supervisore \, JOIN_{Impiegato=Matricola}\big(SEL_{Stipendio>40}(Impiegati)\big)\bigg)$
Trovare nome e stipendio dei capi degli impiegati che guadagnano più di 40.
$$\begin{align}
PROJ_{Nome,Stipendio}\bigg(Impiegati JOIN_{Matricola=Capo}\\
PROJ_{Capo}\big(Supervisione JOIN_{Impiegato=Matricola}\\
SEL_{Stipendio>40}(Impiegati)\big)\bigg)\end{align}$$ 
Ste robe sono lunghe e incasinate, consiglio di andare a capo un po' come quando si indentano le query SQL. 

## Viste
