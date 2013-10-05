* Attention: instead of a-umlaut I use combination "ae" as for other umlaut letters too.

Grammatical problem.

There are 9 cards, each has 2 verbs and 2 pronouns on its sides.
You need to arrange them so there would be correct grammatical pairs on adjoining edges, e.g. "ich" <-> "bin" but not "du" <-> "koennen".
Also central card (with dot) must be in center only.

Foto: ![Source foto](https://github.com/graukin/deutsch_karten/blob/master/src_foto.jpg)

Solution:
There are 9!\*4^9 combinations overall.
With stable central card (we may not rotate it - the rest cards will rotate around it) - 8!\*4^8.

On the dotted card there are 2 "infrequent" pronouns: "du" and "ihr". They can be called "infrequent" because only 5 verbs can make pairs with them: "du" -> {"musst", "sollst"}, "ihr" -> {"muesst", "koennt", "moechtet"}. So it gives us 6 base layouts. "musst" and "muesst" are on the single card => 5 base layots. The rest of cards can be arranged in 6!*4^6 combinations. And so on...

* There is enough place for improvements and reducing total number of combinations, but it'll come later.

Cards (0 is top word, indexes go clockwiser):

1. A=[ihr, er, moechte, wollen]
2. B=[muessen, wir, er, kann]
3. C=[moechten, es, ihr, duerfen]
4. D=[koennt, ich, du, moechte]
5. E=[darf, du, ihr, will]
6. F=[muesst, sie, plSie, musst]
7. G=[er, ich, darf, sollst]
8. H=[moechtet, kann, es, du]
9. I=[sollen, will, plSie, ich]

Initial stable layouts:

1. [\_,\_,\_,\_,E,\_,\_,\_,\_] -(fix 2.3 card)-> {[\_,\_,\_,\_,E,F,\_,\_,\_], [\_,\_,\_,\_,E,G,\_,\_,\_]}

2. [\_,\_,\_,\_,E,F,\_,\_,\_] -(fix 3.2 card)-> {[\_,\_,\_,\_,E,F,\_,D,\_], [\_,\_,\_,\_,E,F,\_,H,\_]}
3. [\_,\_,\_,\_,E,G,\_,\_,\_] -(fix 3.2 card)-> {[\_,\_,\_,\_,E,G,\_,D,\_], [\_,\_,\_,\_,E,G,\_,F,\_], [\_,\_,\_,\_,E,G,\_,H,\_]}

4. [\_,\_,\_,\_,E,F,\_,D,\_] -(fix 1.3 card)-> {[\_,\_,A(2ticks right),\_,E,F,\_,D,\_], [\_,\_,C,\_,E,F,\_,D,\_]}
5. [\_,\_,\_,\_,E,F,\_,H,\_] -(fix 1.3 card)-> {[\_,\_,A2,\_,E,F,\_,H,\_], [\_,\_,C,\_,E,F,\_,H,\_]}
6. [\_,\_,\_,\_,E,G,\_,D,\_] -- too many variants
7. [\_,\_,\_,\_,E,G,\_,F,\_] -(fix 3.1 card)-> {[\_,\_,\_,\_,E,G,D3,F,\_], [\_,\_,\_,\_,E,G,H2,F,\_]}
8. [\_,\_,\_,\_,E,G,\_,H,\_] -(fix 3.1 card)-> {[\_,\_,\_,\_,E,G,F2,H,\_]}

Total number of combinations according to base layouts: 4 -> 2\*5!\*4^5, 5 -> 2\*5!\*4^5, 6 -> 6!\*4^6, 7 -> 2\*5!\*4^5, 8 -> 5!\*4^5.
Sum = 2\*5!\*4^5 + 2\*5!\*4^5 + 6!\*4^6 + 2\*5!\*4^5 + 5!\*4^5 = 5!\*4^5\*7 + 6!\*4^6 = 5!\*4^5\*31 << 9!\*4^9
