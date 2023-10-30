style(preparation, 'acid armor').
style(preparation, 'agility').
style(preparation, 'amnesia').
style(preparation, 'barrier').
style(preparation, 'belly drum').
style(preparation, 'bulk up').
style(preparation, 'calm mind').
style(preparation, 'charge').
style(preparation, 'conversion').
style(preparation, 'conversion2').
style(preparation, 'cosmic power').
style(preparation, 'defense curl').
style(preparation, 'double team').
style(preparation, 'dragon dance').
style(preparation, 'focus energy').
style(preparation, 'growth').
style(preparation, 'harden').
style(preparation, 'howl').
style(preparation, 'iron defense').
style(preparation, 'meditate').
style(preparation, 'minimize').
style(preparation, 'psych up').
style(preparation, 'sharpen').
style(preparation, 'snatch').
style(preparation, 'swords dance').
style(preparation, 'tail glow').
style(preparation, 'withdraw').

style(slow, 'attract').
style(slow, 'block').
style(slow, 'confuse ray').
style(slow, 'disable').
style(slow, 'encore').
style(slow, 'flatter').
style(slow, 'glare').
style(slow, 'grasswhistle').
style(slow, 'hypnosis').
style(slow, 'imprison').
style(slow, 'leech seed').
style(slow, 'lovely kiss').
style(slow, 'mean look').
style(slow, 'poison gas').
style(slow, 'poisonpowder').
style(slow, 'sing').
style(slow, 'sleep powder').
style(slow, 'snatch').
style(slow, 'spider web').
style(slow, 'spikes').
style(slow, 'spore').
style(slow, 'stun spore').
style(slow, 'supersonic').
style(slow, 'swagger').
style(slow, 'sweet kiss').
style(slow, 'taunt').
style(slow, 'teeter dance').
style(slow, 'thunder wave').
style(slow, 'torment').
style(slow, 'toxic').
style(slow, 'yawn').
style(slow, 'will-o-wisp').

style(endurance, 'aromatherapy').
style(endurance, 'baton pass').
style(endurance, 'detect').
style(endurance, 'endure').
style(endurance, 'haze').
style(endurance, 'heal bell').
style(endurance, 'ingrain').
style(endurance, 'light screen').
style(endurance, 'magic coat').
style(endurance, 'milk drink').
style(endurance, 'mist').
style(endurance, 'moonlight').
style(endurance, 'morning sun').
style(endurance, 'mud sport').
style(endurance, 'protect').
style(endurance, 'recover').
style(endurance, 'reflect').
style(endurance, 'rest').
style(endurance, 'safeguard').
style(endurance, 'slack off').
style(endurance, 'softboiled').
style(endurance, 'swallow').
style(endurance, 'synthesis').
style(endurance, 'recycle').
style(endurance, 'refresh').
style(endurance, 'water sport').
style(endurance, 'wish').

style(risk, 'bide').
style(risk, 'blast burn').
style(risk, 'counter').
style(risk, 'destiny bond').
style(risk, 'double-edge').
style(risk, 'explosion').
style(risk, 'facade').
style(risk, 'fissure').
style(risk, 'flail').
style(risk, 'focus punch').
style(risk, 'frenzy plant').
style(risk, 'grudge').
style(risk, 'guillotine').
style(risk, 'horn drill').
style(risk, 'hydro cannon').
style(risk, 'hyper beam').
style(risk, 'memento').
style(risk, 'mirror coat').
style(risk, 'overheat').
style(risk, 'pain split').
style(risk, 'perish song').
style(risk, 'psycho boost').
style(risk, 'reversal').
style(risk, 'selfdestruct').
style(risk, 'sky attack').
style(risk, 'volt tackle').

style(weakening, 'charm').
style(weakening, 'cotton spore').
style(weakening, 'fake tears').
style(weakening, 'featherdance').
style(weakening, 'flash').
style(weakening, 'growl').
style(weakening, 'kinesis').
style(weakening, 'knock off').
style(weakening, 'leer').
style(weakening, 'metal sound').
style(weakening, 'sand-attack').
style(weakening, 'scary face').
style(weakening, 'screech').
style(weakening, 'smokescreen').
style(weakening, 'spite').
style(weakening, 'string shot').
style(weakening, 'sweet scent').
style(weakening, 'tail whip').
style(weakening, 'tickle').

style(unpredictable, 'assist').
style(unpredictable, 'camouflage').
style(unpredictable, 'curse').
style(unpredictable, 'follow me').
style(unpredictable, 'metronome').
style(unpredictable, 'mimic').
style(unpredictable, 'mirror move').
style(unpredictable, 'present').
style(unpredictable, 'role play').
style(unpredictable, 'sketch').
style(unpredictable, 'skill swap').
style(unpredictable, 'substitute').
style(unpredictable, 'transform').
style(unpredictable, 'trick').

style(flow, 'hail').
style(flow, 'rain dance').
style(flow, 'sandstorm').
style(flow, 'sunny day').
style(flow, 'weather ball').

style(none, Y) :-
    \+style(preparation, Y),
    \+style(slow, Y),
    \+style(endurance, Y),
    \+style(risk, Y),
    \+style(weakening, Y),
    \+style(unpredictable, Y),
    \+style(flow, Y).

