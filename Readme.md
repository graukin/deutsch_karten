* Attention: instead of a-umlaut I use combination "ae" as for other umlaut letters too.

Grammatical problem.

There are 9 cards, each has 2 verbs and 2 pronouns on its sides.
You need to arrange them so there would be correct grammatical pairs on adjoining edges, e.g. "ich" <-> "bin" but not "du" <-> "koennen".
Also central card (with dot) must be in center only.

Foto: https://github.com/graukin/deutsch_karten/blob/master/src_foto.jpg

Solution:
There are 9!*4^9 combinations overall.
With stable central card (we may not rotate it - the rest cards will rotate around it) - 8!*4^8.

On the dotted card there are 2 "infrequent" pronouns: "du" and "ihr". They can be called "infrequent" because only 5 verbs can make pairs with them: "du" -> {"musst", "sollst"}, "ihr" -> {"muesst", "koennt", "moechtet"}. So it gives us 6 base layouts. "musst" and "muesst" are on the single card => 5 base layots. The rest of cards can be arranged in 6!*4^6 combinations. And so on...

* There is enough place for improvements and reducing total number of combinations, but it'll come later.

Cards (0 is top word, indexes go clockwiser):
A=[ihr, er, moechte, wollen]
B=[muessen, wir, er, kann]
C=[moechten, es, ihr, duerfen]
D=[koennt, ich, du, moechte]
E=[darf, du, ihr, will]
F=[muesst, sie, plSie, musst]
G=[er, ich, darf, sollst]
H=[moechtet, kann, es, du]
I=[sollen, will, plSie, ich]

Initial stable layouts:
[_,_,_,_,E,_,_,_,_] -> {[_,_,_,_,E,F,_,_,_], [_,_,_,_,E,G,_,_,_]} -> {[_,_,_,_,E,F,_,D,_], [_,_,_,_,E,F,_,H,_], [_,_,_,_,E,G,_,D,_], [_,_,_,_,E,G,_,F,_], [_,_,_,_,E,G,_,H,_]}
