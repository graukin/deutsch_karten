* Attention: instead of a-umlaut I use combination "ae" as for other umlaut letters too.

Grammatical problem.

There are 9 cards, each has 2 verbs and 2 pronouns on its sides.
You need to arrange them so there would be correct grammatical pairs on adjoining edges, e.g. "ich" <-> "bin" but not "du" <-> "koennen".
Also central card (with dot) must be in center only.

Foto: https://skydrive.live.com/redir?resid=2D6D0BEACB2988E!4465&authkey=!AEsuw1vXw82cLGo&v=3

Solution:
There are 9!*4^9 combinations overall.
With stable central card (we may not rotate it - the rest cards will rotate around it) - 8!*4^8.

On the dotted card there are 2 "infrequent" pronouns: "du" and "ihr". They can be called "infrequent" because only 5 verbs can make pairs with them: "du" -> {"musst", "sollst"}, "ihr" -> {"muesst", "koennt", "moechtet"}. So it gives us 6 base layouts. "musst" and "muesst" are on the single card => 5 base layots. The rest of cards can be arranged in 6!*4^6 combinations. So totally there are only 5*6!*4^6 combinations to check.

* There is enough place for improvements and reducing total number of combinations, but it'll come later.
