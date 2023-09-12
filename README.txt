Istruzioni per utilizzare il codice:
per utilizzare il codice basta creare un dataset in cui si inserisco informazioni su schema e defizioni del cruciverba.
Il risultato calcolato da MiniZinc verrà presentato sotto forma di matrice nxm: 
i valori diversi da 0 sono i valori delle caselle bianche mentre gli 0 rappresentano le caselle nere.
Nella cartella sono presenti 3 esempi di dataset già creati.
I dataset richiedono l'inserimento di questi parametri:
n= numero di righe
m= numero di colonne
r>0 e s>=r: tutte le caselle bianche avranno valori compresi tra r e s
num_o e num_v : rispettivamente il numero di vincolo orizzontali e verticali
gli array 2d (matrici) def_o e def_v che definiscono lo schema (divisione caselle bianche/nere) e la posizione e valore delle definizioni in cui:
la prima colonna rappresenta la coordinata di riga della matrice
la seconda colonna rappresenta la coordinata di colonna della matrice
la terza colonna rapprensenta il valore della definizione
la quarta colonna rappresenta il numero di caselle bianche entro cui va rispettata la definizione.
ES: se def_o ha una riga (1,2,5,3) significa che esiste un vincolo orizzontale situato nella prima riga, seconda colonna (1,2) che possiede 3 caselle bianche 
(le caselle bianche saranno quindi (1,2) (1,3) e (1,4) ) e la cui somma deve fare 5.