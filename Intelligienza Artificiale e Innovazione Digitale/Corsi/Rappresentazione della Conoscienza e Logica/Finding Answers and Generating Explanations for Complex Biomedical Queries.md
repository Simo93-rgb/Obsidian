# Key Biomedical Terms

- **Epinephrine (also known as Adrenaline):**    
    - **Function:** Epinephrine is a hormone and a neurotransmitter involved in the body's fight-or-flight response. It increases heart rate, muscle strength, blood pressure, and sugar metabolism.
    - **Usage:** Clinically, it's used to treat a number of conditions including anaphylaxis, cardiac arrest, and superficial bleeding.
    
- **DLG4 (Discs Large MAGUK Scaffold Protein 4):**    
    - **Function:** DLG4 is a gene that encodes a protein involved in synaptic signaling and plasticity, essential for the proper functioning of neural connections.
    - **Relevance:** It's significant in studies related to brain function and diseases such as schizophrenia and autism.
    
- **HMG-CoA Reductase Inhibitors (Statins):**    
    - **Function:** These are a class of drugs used to lower cholesterol levels in the blood, reducing the risk of cardiovascular disease.
    - **Examples:** Includes drugs like Lovastatin, Simvastatin, and Atorvastatin.

- **ADRB1 (Adrenoceptor Beta 1):**    
    - **Function:** This gene encodes a receptor involved in the response to adrenaline and noradrenaline, playing a role in heart function.

# 1. Introduction

## Understanding the queries

1. **Query Q1:**
    - **Task:** Identify the genes targeted by Epinephrine that also interact with DLG4.
    - **Explanation:** This involves finding a subset of genes that are affected by Epinephrine and are involved in pathways or networks where DLG4 is active.

1. **Query Q2:**
    - **Task:** List the genes targeted by all drugs classified as HMG-CoA reductase inhibitors.
    - **Explanation:** This requires identifying common gene targets among all statins, which could provide insights into their mechanisms and potential side effects.

1. **Query Q3:**    
    - **Task:** Find cliques of 5 genes that include DLG4.
    - **Explanation:** A clique in this context is a group of five genes where each gene interacts with every other gene in the group, including DLG4. This can help in understanding complex gene interaction networks involving DLG4.

1. **Query Q4:**    
    - **Task:** Determine genes related to ADRB1 through a gene-gene interaction chain of length at most 3.
    - **Explanation:** This query seeks to find genes that are within three steps of interaction from ADRB1, providing a broader context of its interaction network.

1. **Query Q5:**    
    - **Task:** Identify the three most similar genes targeted by Epinephrine.
    - **Explanation:** Similarity could be based on various factors like function, sequence, or interaction partners. This could help in predicting the effects of Epinephrine on genes with similar roles or characteristics.

## Focus
Il capitolo inizia con l'obiettivo principale dell'articolo: presentare nuovi metodi per rispondere a query complesse riguardanti ontologie e database biomedici e generare spiegazioni che giustifichino queste risposte.

#### Metodi Utilizzati

- **Answer Set Programming (ASP):** Viene descritto l'ASP come un paradigma di programmazione dichiarativa che utilizza programmi per rappresentare la conoscenza e risolvere problemi trovando insiemi di risposte (answer sets) utilizzando solver ASP come CLASP e CLASP-NK.
- **Struttura dei Programmi ASP:** Un programma ASP è una serie finita di regole nella forma F←GF \leftarrow GF←G, dove FFF è un atomo proposizionale e GGG è una formula. Si discute anche l'utilizzo di espressioni di cardinalità e variabili schematiche per rappresentare i problemi in modo compatto.

#### Risposta alle Query Biomediche

- **Query Complesse:** L'approccio consiste nel rappresentare una query biomedica come un programma ASP che include definizioni ausiliarie necessarie per la query.
- **Efficienza:** Si cerca di trovare la parte rilevante RRR di un programma Π\PiΠ rispetto a una query QQQ e di calcolare efficientemente una risposta trovando un insieme di risposte XXX per RRR e estraendo la risposta da XXX.

#### Generazione delle Spiegazioni

- **Graph di Dipendenza Positiva:** Viene definito il graph di dipendenza positiva di un programma ASP come un graph diretto i cui vertici rappresentano gli atomi nel programma e gli archi rappresentano l'esistenza di regole nel programma.
- **Spiegazioni:** Una spiegazione per un atomo xxx in un insieme di risposte XXX è una sequenza finita di regole nel programma che giustifica perché xxx è incluso in XXX.

# 2. ASP
Il capitolo 2 dell'articolo introduce Answer Set Programming (ASP), un paradigma di programmazione dichiarativa. ASP è usato per rappresentare conoscenze come un programma e per ragionare su queste conoscenze computando modelli chiamati "insiemi di risposte" (answer sets) utilizzando solver ASP come CLASP. Ecco gli aspetti salienti:

- **Definizione di un programma ASP**: Un programma ASP è un insieme finito di regole del tipo: $F \leftarrow G$  dove F è un atomo proposizionale o ⊥ (falso), e G è una formula. F è chiamato testa della regola, mentre G è chiamato corpo della regola.
    
- **Programmi normali e positivi**: Un programma normale contiene regole della forma: $$A0←A1,…,Ak,not Ak+1,…,not AmA_0 \leftarrow A_1, \ldots, A_k, \text{not } A_{k+1}, \ldots, \text{not } A_mA0​←A1​,…,Ak​,not Ak+1​,…,not Am​$$ Un programma è positivo se non contiene negazioni. Un programma normale è stratificato se esiste una mappatura di livelli che soddisfa determinate condizioni per tutte le regole del programma.
    
- **Espressioni di cardinalità**: Quando rappresentiamo un problema in ASP, possiamo usare costrutti speciali del tipo l{A1,…,Ak}u l\{A_1, \ldots, A_k\}u l{A1​,…,Ak​}u, dove l e u sono interi non negativi che rappresentano il limite inferiore e superiore. Queste espressioni descrivono i sottoinsiemi del set {A1,…,Ak}\{A_1, \ldots, A_k\}{A1​,…,Ak​} le cui cardinalità sono almeno l e al massimo u.
    

**2.2 Rappresentazione delle query biomediche complesse**

- **Uso di ASP per query biomediche**: L'articolo mostra come rappresentare query complesse su risorse di conoscenza biomediche utilizzando ASP. Le risorse includono PHARMGKB, DRUGBANK, BIOGRID, CTD e SIDER.
    
- **Solver ASP**: Per le query che non riguardano la similarità/diversità di geni/farmaci, viene utilizzato il solver ASP CLASP. Per le query di similarità/diversità, vengono utilizzati metodi online per trovare soluzioni simili/diverse utilizzando il solver CLASP-NK, una variante di CLASP.
    

**2.3 Programmi e regole ASP**

- **Stratificazione e mappatura dei livelli**: La stratificazione di un programma normale assicura che esista una mappatura di livelli che soddisfi condizioni specifiche per tutte le regole del programma. Questo aiuta a garantire che le regole siano applicate in un ordine coerente.
    
- **Cardinalità e variabili schematiche**: Le espressioni di cardinalità e le variabili schematiche aiutano a rappresentare gruppi di regole in modo compatto. Ad esempio, una regola come pi←not pi+1(1≤i≤7)p_i \leftarrow \text{not } p_{i+1} (1 \leq i \leq 7)pi​←not pi+1​(1≤i≤7) può essere rappresentata utilizzando variabili schematiche per semplificare il programma.

# 3. Efficient Query Answering

## Definizione di Rilevanza

Vediamo di spiegare in modo chiaro il concetto di "rilevanza" come descritto nel terzo capitolo del documento.

1. **Insiemi di Atomi e Simboli di Predicati**:
    
    - **Set di Atomi (X)**: Un insieme di atomi in logica proposizionale.
    - **Set di Simboli di Predicati (P)**: Un insieme di simboli che rappresentano predicati.
    - **$X^P$**: Gli atomi in X che hanno simboli di predicati appartenenti a P.
2. **Programmi ASP (Π1 e Π2)**:
    
    - **Programmi ASP**: Serie di regole in logica ASP.
    - **AS(Π)**: Insieme di tutte le "answer sets" (soluzioni) del programma ASP Π.
3. **Equivalenza Modulo P ($Π_1 ≡_P Π_2$)**:
   Per due programmi ASP, Π1 e Π2, diciamo che Π1 è equivalente a Π2 modulo P (denotato come Π1 ≡P Π2) se: 
	   * Per ogni "answer set" S1 di Π1, esiste un "answer set" S2 di Π2 tale che S1P = S2P.
	   * Per ogni "answer set" S2 di Π2, esiste un "answer set" S1 di Π1 tale che S2P = S1P. 
    Questo significa che se ci focalizziamo solo sui simboli di predicati in P, le soluzioni di Π1 e Π2 sono indistinguibili.
4. **Rilevanza di un Sottoprogramma**
   Ora definiamo cosa significa che un sottoprogramma R di Π è rilevante rispetto a una query Q.
   - **Π e Q**:
	   - Π rappresenta il programma ASP principale, che include le regole derivate da varie risorse di conoscenza.
	   - Q rappresenta la query.
   - **Parte Rilevante (R)**:
	   - Un sottoprogramma R di Π è considerato la parte rilevante rispetto a Q se:
		   - Se R∪QR ∪ QR∪Q non ha "answer sets", allora Π∪QΠ ∪ QΠ∪Q non ha "answer sets".
		   - Se R∪QR ∪ QR∪Q ha un "answer set", allora R∪QR ∪ QR∪Q è equivalente modulo i predicati di Q a Π∪QΠ ∪ QΠ∪Q.
	 Questo implica che R contiene tutte le regole necessarie per rispondere correttamente alla query Q, mantenendo l'equivalenza delle risposte rispetto a Π.

## Calcolare la Parte Rilevante di un Programma ASP
Il testo descrive un metodo per calcolare la parte rilevante di un programma ASP stratificato con riferimento a una query biomedica specifica. Questo è utile per rispondere efficientemente a query complesse riducendo la quantità di regole da considerare. Vediamo i punti principali in dettaglio.

### Grafo di Dipendenza dei Predicati (DGΠ)

- **Definizione**: Un grafo diretto in cui i vertici rappresentano i nomi dei predicati degli atomi in un programma ASP Π. Gli archi pi→pjp_i \rightarrow p_jpi​→pj​ indicano l'esistenza di una regola rrr in Π dove pip_ipi​ è il simbolo del predicato dell'atomo nella testa H(r)H(r)H(r) e pjp_jpj​ è il simbolo del predicato di un atomo nel corpo B(r)B(r)B(r).
    - Gli archi sono etichettati con +++ se pjp_jpj​ appare in B+(r)B^+(r)B+(r) (parte positiva del corpo) e con −−− se pjp_jpj​ appare in B−(r)B^−(r)B−(r) (parte negativa del corpo).

#### Calcolo dei Predicati Rilevanti (SΠ,Q)

- **SΠ,Q**: L'insieme dei nomi dei predicati rilevanti di Π rispetto a Q è l'insieme di tutti i nomi dei predicati raggiungibili (nel DG(Π)) da qualche vertice in pred(Q), dove consideriamo la raggiungibilità come la chiusura riflessiva transitiva degli archi in DG(Π).

#### Calcolo delle Regole Rilevanti (RelΠ,Q)

- **RelΠ,Q**: L'insieme delle regole rilevanti di Π rispetto a Q è l'insieme di tutte le regole rrr in Π tali che HP(r)⊆SΠ,QHP(r) \subseteq SΠ,QHP(r)⊆SΠ,Q e BP(r)⊆SΠ,QBP(r) \subseteq SΠ,QBP(r)⊆SΠ,Q. Questo assicura che consideriamo solo le regole la cui testa e corpo contengono predicati rilevanti.

### Proposizione 1

- **Affermato**: Per un programma ASP stratificato normale Π e un programma ASP Q, RelΠ,Q è la parte rilevante di Π rispetto a Q.
- **Significato**: Questo formalizza che il sottoprogramma RelΠ,Q contiene tutte e solo le regole necessarie per rispondere alla query Q.

#### Algoritmo 1: Rispondere alle Query

1. **Input**: Un programma ASP stratificato normale Π e una query Q.
2. **Output**: Un insieme di risposte per Π∪QΠ ∪ QΠ∪Q proiettato sui nomi dei predicati in R∪QR ∪ QR∪Q.

##### Passaggi dell'Algoritmo:

1. **DGΠ := DependencyGraph(Π)**: Costruire il grafo di dipendenza dei predicati di Π.
2. **pred(Q) := PredicateNames(Q)**: Ottenere i nomi dei predicati in Q.
3. **SΠ,Q := RelevantPredicateNames(DGΠ , pred(Q))**: Calcolare i nomi dei predicati rilevanti.
4. **RelΠ,Q := RelevantRules(Π, SΠ,Q )**: Determinare le regole rilevanti.
5. **Answer := ComputeAnswerSet(RelΠ,Q ∪ Q)**: Calcolare un insieme di risposte per il programma rilevante unito alla query.
6. **return Answer**: Restituire l'insieme di risposte.

##### Complessità Temporale

- **Costruzione del Grafo di Dipendenza**: La costruzione del grafo di dipendenza, ottenere i nomi dei predicati, e trovare i nomi dei predicati e le regole rilevanti ha una complessità di O(∣Π∣×∣BΠ∪Q∣+∣pred(Π∪Q)∣2)O(|Π| × |BΠ∪Q | + |pred(Π ∪ Q)|^2 )O(∣Π∣×∣BΠ∪Q∣+∣pred(Π∪Q)∣2).
- **Calcolo di un Insieme di Risposte**: Il calcolo di un insieme di risposte per un dato programma è NP-difficile.

## Query di Similarità/Diversità

Nel contesto delle query biomediche, alcune query possono generare un numero eccessivo di risposte. Per rendere più gestibili questi risultati, è spesso utile identificare un sottoinsieme di risposte che siano tra loro simili o diverse in base a una determinata misura di distanza (ad esempio, la distanza funzionale tra geni).

### Utilità delle Query di Similarità/Diversità

1. **Similarità tra Risposte**:
    
    - **Scopo**: Identificare risposte (ad esempio, geni) che sono simili tra loro.
    - **Misura di Distanza**: Può essere basata sulla distanza funzionale tra i geni.
2. **Diversità tra Risposte**:
    
    - **Scopo**: Trovare risposte che siano diverse tra loro per analizzare meglio la varietà dei dati.
3. **Relazioni tra Geni/Farmaci**:
    
    - **Scopo**: Gli esperti possono voler trovare un insieme di geni/farmaci che siano distanti o vicini a un insieme noto di geni/farmaci.
    - **Utilità**: Nessun software esistente fornisce questa funzionalità per ragionare sulle risorse di conoscenza biomediche.

### Metodi Online per Similarità/Diversità

L'approccio descritto da Eiter et al. (2009) introduce due metodi online per affrontare questo problema:

1. **n Answer Sets Simili/Diversi**:
    
    - **Obiettivo**: Calcolare n "answer sets" che siano simili o diversi tra loro con una distanza di k.
    - **Metodo**: Utilizza una funzione di distanza implementata in C++ e considera queste distanze durante il calcolo incrementale di un "answer set" attraverso un approccio branch-and-bound.
2. **n Answer Sets Distanti/Vicini a un Set Dato**:
    
    - **Obiettivo**: Calcolare n "answer sets" che siano distanti o vicini a un set dato di "answer sets" con una distanza di k.
    - **Metodo**: Anche qui, si utilizza una funzione di distanza e si applica un approccio branch-and-bound per evitare di calcolare tutti gli "answer sets".

### Implementazione con CLASP - NK

Questi metodi sono implementati utilizzando CLASP - NK, basato sul solver ASP CLASP. Questo permette di:

- **Evitare il Calcolo di Tutti gli Answer Sets**: Il metodo evita di dover calcolare tutti gli "answer sets" per trovare quelli simili/diversi o distanti/vicini.
- **Trovare Geni/Farmaci Simili/Diversi**: Utilizzando CLASP - NK, è possibile trovare geni o farmaci simili o diversi senza dover calcolare tutte le risposte alle query, come richiesto ad esempio nella Q5.


