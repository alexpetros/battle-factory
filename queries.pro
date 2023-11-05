% Legal combinations of same-type mons
pokemon(X), pokemon(Y), pokemon(Z),
X \== Y, Y \== Z, X \== Z,
type(X, Type1), type(Y, Type1), type(Z, Type1),
type(X, Type2), type(Y, Type2), type(Z, Type2),
sort([ Type1, Type2 ], [ Type1, Type2 ]),
sort([X, Y, Z], [X, Y, Z])
.

r8([(aerodactyl, 3), (breloom, 3), (skarmory, 3)], slow, flying).

r8([], Team, slow, water).

r8([(aerodactyl, _)], Team, flexible, none).

moves_seen(aerodactyl, Xnum, [earthquake]),
r8([(aerodactyl, Xnum)], Team, slow, rock).

r8([(aerodactyl, 1), (breloom, _)], Team, slow, flying).

r8([(aerodactyl, 1), (breloom, _), (skarmory, _)], Team, slow, flying).

delete_solo_elements(['water', 'flying', 'dragon', 'dragon'], Result).

% style_matches(flow, 1, [hail, sandstorm, aromatherapy]).
% trainer_style(X, [attract, block, disable, encore, tickle, leer]).
% trainer_style(X, [flamethrower, ember, disable, hail]).
