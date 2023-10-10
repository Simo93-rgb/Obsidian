In informatica un esempio pratico e comunissimo sono i giochi come gli scacci e questi sono esempi in cui ho due agenti dove uno è imprevedibile dal punto di vista dell'altro. Qui si cerca di studiare una strategia per inquadrare e battere il mio avversario. Attenzione, strategia e piano non sono sinonimi poiché il piano è un elenco di mosse da fare e non sapendo cosa farà l'altro agente diventa senza senso il concetto di piano. La strategia invece dipende da quel che fa l'avversario ed è proprio quello che mi serve. Altra caratteristica problematica è il **limite di tempo**poiché non posso prendermi tutto il tempo del mondo per fare le mie mosse. 

|Informazione|**Deterministico**|**Non Deterministico**|
|:------------:|:------------------:|:---------:|
|**Informazione perfetta**|scacchi, go, othello...|Monopoly, backgammon|
|**Informazione Imperfetta**| null | poker, bridge, battaglia navale|

Alcune assunzioni:
+ Spazio finito: azioni stati e ambiente lo sono
+ Informazione perfetta:
	+ Gli agenti sanno sempre in che stato sono
+ Deterministico
+ Somma zero: ossia se vinco 10 il mio avversario ha perso 10 ("guadagno -10"). $$\sum{payoffs} = 0$$
### Terminologia
+ Il payoff di un giocatore viene chiamato **utilità**. 
+ Le strategie possono essere:
	+ strategia pura: la scelta è sempre deterministica
	+ strategia mista: distribuzione di probabilità per le scelte
+ Il gioco si chiama $G$ e i due concorrenti si chiamano *Min* e *Max* 
+ $U(s,t)$ è l'utilità delle strategie dove $s$ è la strategia di *Max* e $t$ è la strategia di *Min*.
+ Se il gioco è a somma zero allora:
	+ *Min* $\rightarrow -U(s,t)$ poiché *Min* cerca di minimizzare la funzione di utilità
	+ *Max* $\rightarrow U(s,t)$ poiché *Max* cerca di massimizzare la funzione di utilità

