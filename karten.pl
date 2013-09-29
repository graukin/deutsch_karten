wort(pronomen, seins, ich).
wort(pronomen, szwei, du).
wort(pronomen, sdrei, er).
wort(pronomen, sdrei, sie).
wort(pronomen, sdrei, es).
wort(pronomen, pleins, wir).
wort(pronomen, plzwei, ihr).
wort(pronomen, pldrei, plSie).

% k1: ihr, er, moechte, wollen
wort(verb, seins, moechte).
wort(verb, sdrei, moechte).
wort(verb, pleins, wollen).
wort(verb, pldrei, wollen).
% k2: muessen, wir, er, kann
wort(verb, pleins, muessen).
wort(verb, pldrei, muessen).
wort(verb, seins, kann).
wort(verb, sdrei, kann).
% k3: moechten, es, ihr, duerfen
wort(verb, pleins, moechten).
wort(verb, pldrei, moechten).
wort(verb, pleins, duerfen).
wort(verb, pldrei, duerfen).
% k4: koennt, ich, du, moechte
wort(verb, plzwei, koennt).
% wort(verb, seins, moechte). -> k1
% wort(verb, sdrei, moechte). -> k1
% k5: darf, du, ihr, will
wort(verb, seins, darf).
wort(verb, sdrei, darf).
wort(verb, seins, will).
wort(verb, sdrei, will).
% k6: muesst, sie, plSie, musst
wort(verb, plzwei, muesst).
wort(verb, szwei, musst).
% k7: er, ich, darf, sollst
% wort(verb, seins, darf). -> k5
% wort(verb, sdrei, darf). -> k5
wort(verb, szwei, sollst).
% k8: moechtet, kann, es, du
wort(verb, plzwei, moechtet).
% wort(verb, seins, kann). -> k2
% wort(verb, sdrei, kann). -> k2
% k9: sollen, will, plSie, ich
wort(verb, pleins, sollen).
wort(verb, pldrei, sollen).
% wort(verb, seins, will). -> k5
% wort(verb, sdrei, will). -> k5

regel(A, B) :- wort(verb, X, A), wort(pronomen, X, B).
regel(A, B) :- wort(pronomen, X, A), wort(verb, X, B).

kart_drehung([A, B, C, D], [A, B, C, D]).
kart_drehung([A, B, C, D], [B, C, D, A]).
kart_drehung([A, B, C, D], [C, D, A, B]).
kart_drehung([A, B, C, D], [D, A, B, C]).

drehungen([], []).
drehungen([A1|[]], [A2|[]]) :- kart_drehung(A1, A2).
drehungen([H1|T1], [H2|T2]) :- kart_drehung(H1, H2), drehungen(T1, T2).

feld_umruhren([A1, A2, A3, A4, A5, A6, A7, A8, A9], [B1, B2, B3, B4, A5, B6, B7, B8, B9]) :- drehungen([A1, A2, A3, A4, A6, A7, A8, A9], [C1, C2, C3, C4, C6, C7, C8, C9]), permutation([C1, C2, C3, C4, C6, C7, C8, C9], [B1, B2, B3, B4, B6, B7, B8, B9]).

hprufen([_, A2, _, _], [_, _, _, B4]) :- regel(A2, B4).
vprufen([_, _, A3, _], [B1, _, _, _]) :- regel(A3, B1).

feld_prufen([A1, A2, A3, A4, A5, A6, A7, A8, A9]) :- hprufen(A1, A2), hprufen(A2, A3), hprufen(A4, A5), hprufen(A5, A6), hprufen(A7, A8), hprufen(A8, A9), vprufen(A1, A4), vprufen(A4, A7), vprufen(A2, A5), vprufen(A5, A8), vprufen(A3, A6), vprufen(A6, A9).

kart_drucken([A, B, C, D]) :- print('['), print(A), print(', '), print(B), print(', '), print(C), print(', '), print(D), print(']').

feld_drucken([], _).
feld_drucken([A1, A2, A3, A4, A5, A6, A7, A8, A9]) :- kart_drucken(A1), print(' '), kart_drucken(A2), print(' '), kart_drucken(A3), print('\n'), kart_drucken(A4), print(' '), kart_drucken(A5), print(' '), kart_drucken(A6), print('\n'), kart_drucken(A7), print(' '), kart_drucken(A8), print(' '), kart_drucken(A9), print('\n').

losung_r([A, B, C, D, E, F, G, H, I], R) :-
	print('\nI=\n'),
        feld_drucken([A, B, C, D, E, F, G, H, I]),
        feld_umruhren([A, B, C, D, E, F, G, H, I], R),
        feld_prufen(R),
	print('\nR=\n'),
        feld_drucken(R).

losung :- 
	A=[ihr, er, moechte, wollen],
	A2=[moechte, wollen, ihr, er],
	B=[muessen, wir, er, kann],
	C=[moechten, es, ihr, duerfen],
	D=[koennt, ich, du, moechte],
	D3=[ich, du, moechte, koennt],
	E=[darf, du, ihr, will], % center
	F=[muesst, sie, plSie, musst],
	F2=[plSie, musst, muesst, sie],
	G=[er, ich, darf, sollst],
	H=[moechtet, kann, es, du],
	H2=[es, du, moechtet, kann],
	I=[sollen, will, plSie, ich],
	( losung_r([A, B, C, D, E, F, G, H, I], [_, _, A2, _, E, F, _, D, _]);
	losung_r([A, B, C, D, E, G, F, H, I], [_, _, C, _, E, F, _, D, _]);
	losung_r([A, B, C, H, E, F, G, D, I], [_, _, A2, _, E, F, _, H, _]);
	losung_r([A, B, C, H, E, F, G, D, I], [_, _, C, _, E, F, _, H, _]);
	losung_r([A, B, C, H, E, F, G, D, I], [_, _, _, _, E, G, _, D, _]);
	losung_r([A, B, C, H, E, F, G, D, I], [_, _, _, _, E, G, D3, F, _]);
	losung_r([A, B, C, H, E, F, G, D, I], [_, _, _, _, E, G, H2, F, _]);
	losung_r([A, B, C, D, E, G, H, F, I], [_, _, _, _, E, G, F2, H, _])
	).

