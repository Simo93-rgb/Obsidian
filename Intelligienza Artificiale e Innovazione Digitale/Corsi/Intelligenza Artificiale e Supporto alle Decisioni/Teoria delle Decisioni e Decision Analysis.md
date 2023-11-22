![[Teoria delle Decisioni e Decision Analysis - teoria e analisi.png]]
## Preferenze
![[Teoria delle Decisioni e Decision Analysis - Preferenze.png]]
Ci sono dei vincoli ![[Teoria delle Decisioni e Decision Analysis - vincoli preferenze.png]]
L'agente usa questi criteri per essere razionali, supponiamo di rompere la transitività e chiadiamoci cosa otterremmo 
![[Teoria delle Decisioni e Decision Analysis - transitività loop.png]]
Otterremmo una porcheria anche detta money pump. 
Devo anche avere dei criteri per poter confrontare due lotterie differenti
![[Teoria delle Decisioni e Decision Analysis - confronto lotterie.png]]
Qui è facile ma potrei aver bisogno di altri criteri di valutazione per confrontare due lotterie. 

## Utility Function
Quando devo definire una preferenza $A\succ B$ ho bisogno di qualcosa che quantifichi questa preferenza e la mia funzione di utilità mi produce un numero reale per quantificare questa preferenza. Questa funzione deve essere fatta in modo che si rispettino le preferenze, se dico che preferisco che il tempo sia sereno rispetto alla pioggia la funzione di utilità deve essere coerente con questa cosa. 
In pratica, se ho una variabile aleatoria $X$ posso proporre la funzione di utilità come il valore atteso, ossia la media probabilistica. $$\mathbb{E}(X)=\sum_{i=1}^n{x_ip_i}$$
Ad esempio
![[Teoria delle Decisioni e Decision Analysis - expected utility.png]]
Quindi se ho due lotterie la migliore è quella che in media mi fa vincere di più.
![[Teoria delle Decisioni e Decision Analysis - esempio lotteria viaggio in montagna.png]]
### Utility Wheel 
![[Teoria delle Decisioni e Decision Analysis - Utility Wheel.png]]
Somiglia al gioco a premi dove gira la freccia. Come tante è una tecnica e questa funziona col costruire la ruota in modo che giocare non faccia differenza col non giocare in termini di "quel che ho", a quel punto la probabilità della vittoria è la mia utilità. 