; Footprints are 2x2 tiles each, but are stored as a 16x64-tile image
; (32 rows of 8 footprints per row).
; That means there's a row of the top two tiles for eight footprints,
; then a row of the bottom two tiles for those eight footprints.

; These macros help extract the first and the last two tiles, respectively.
footprint_top    EQUS "0,                 2 * LEN_1BPP_TILE"
footprint_bottom EQUS "2 * LEN_1BPP_TILE, 2 * LEN_1BPP_TILE"

; Entries correspond to Pokémon species, two apiece, 8 tops then 8 bottoms

Footprints:
; 001-008 top halves
INCBIN "gfx/footprints/bulbasaur.1bpp",  footprint_top
INCBIN "gfx/footprints/ivysaur.1bpp",    footprint_top
INCBIN "gfx/footprints/venusaur.1bpp",   footprint_top
INCBIN "gfx/footprints/charmander.1bpp", footprint_top
INCBIN "gfx/footprints/charmeleon.1bpp", footprint_top
INCBIN "gfx/footprints/charizard.1bpp",  footprint_top
INCBIN "gfx/footprints/squirtle.1bpp",   footprint_top
INCBIN "gfx/footprints/wartortle.1bpp",  footprint_top
; 001-008 bottom halves
INCBIN "gfx/footprints/bulbasaur.1bpp",  footprint_bottom
INCBIN "gfx/footprints/ivysaur.1bpp",    footprint_bottom
INCBIN "gfx/footprints/venusaur.1bpp",   footprint_bottom
INCBIN "gfx/footprints/charmander.1bpp", footprint_bottom
INCBIN "gfx/footprints/charmeleon.1bpp", footprint_bottom
INCBIN "gfx/footprints/charizard.1bpp",  footprint_bottom
INCBIN "gfx/footprints/squirtle.1bpp",   footprint_bottom
INCBIN "gfx/footprints/wartortle.1bpp",  footprint_bottom
; 009-016 top halves
INCBIN "gfx/footprints/blastoise.1bpp",  footprint_top
INCBIN "gfx/footprints/caterpie.1bpp",   footprint_top
INCBIN "gfx/footprints/metapod.1bpp",    footprint_top
INCBIN "gfx/footprints/butterfree.1bpp", footprint_top
INCBIN "gfx/footprints/weedle.1bpp",     footprint_top
INCBIN "gfx/footprints/kakuna.1bpp",     footprint_top
INCBIN "gfx/footprints/beedrill.1bpp",   footprint_top
INCBIN "gfx/footprints/pidgey.1bpp",     footprint_top
; 009-016 bottom halves
INCBIN "gfx/footprints/blastoise.1bpp",  footprint_bottom
INCBIN "gfx/footprints/caterpie.1bpp",   footprint_bottom
INCBIN "gfx/footprints/metapod.1bpp",    footprint_bottom
INCBIN "gfx/footprints/butterfree.1bpp", footprint_bottom
INCBIN "gfx/footprints/weedle.1bpp",     footprint_bottom
INCBIN "gfx/footprints/kakuna.1bpp",     footprint_bottom
INCBIN "gfx/footprints/beedrill.1bpp",   footprint_bottom
INCBIN "gfx/footprints/pidgey.1bpp",     footprint_bottom
; 017-024 top halves
INCBIN "gfx/footprints/pidgeotto.1bpp",  footprint_top
INCBIN "gfx/footprints/pidgeot.1bpp",    footprint_top
INCBIN "gfx/footprints/rattata.1bpp",    footprint_top
INCBIN "gfx/footprints/raticate.1bpp",   footprint_top
INCBIN "gfx/footprints/spearow.1bpp",    footprint_top
INCBIN "gfx/footprints/fearow.1bpp",     footprint_top
INCBIN "gfx/footprints/ekans.1bpp",      footprint_top
INCBIN "gfx/footprints/arbok.1bpp",      footprint_top
; 017-024 bottom halves
INCBIN "gfx/footprints/pidgeotto.1bpp",  footprint_bottom
INCBIN "gfx/footprints/pidgeot.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rattata.1bpp",    footprint_bottom
INCBIN "gfx/footprints/raticate.1bpp",   footprint_bottom
INCBIN "gfx/footprints/spearow.1bpp",    footprint_bottom
INCBIN "gfx/footprints/fearow.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ekans.1bpp",      footprint_bottom
INCBIN "gfx/footprints/arbok.1bpp",      footprint_bottom
; 025-032 top halves
INCBIN "gfx/footprints/pikachu.1bpp",    footprint_top
INCBIN "gfx/footprints/raichu.1bpp",     footprint_top
INCBIN "gfx/footprints/sandshrew.1bpp",  footprint_top
INCBIN "gfx/footprints/sandslash.1bpp",  footprint_top
INCBIN "gfx/footprints/nidoran_f.1bpp",  footprint_top
INCBIN "gfx/footprints/nidorina.1bpp",   footprint_top
INCBIN "gfx/footprints/nidoqueen.1bpp",  footprint_top
INCBIN "gfx/footprints/nidoran_m.1bpp",  footprint_top
; 025-032 bottom halves
INCBIN "gfx/footprints/pikachu.1bpp",    footprint_bottom
INCBIN "gfx/footprints/raichu.1bpp",     footprint_bottom
INCBIN "gfx/footprints/sandshrew.1bpp",  footprint_bottom
INCBIN "gfx/footprints/sandslash.1bpp",  footprint_bottom
INCBIN "gfx/footprints/nidoran_f.1bpp",  footprint_bottom
INCBIN "gfx/footprints/nidorina.1bpp",   footprint_bottom
INCBIN "gfx/footprints/nidoqueen.1bpp",  footprint_bottom
INCBIN "gfx/footprints/nidoran_m.1bpp",  footprint_bottom
; 033-040 top halves
INCBIN "gfx/footprints/nidorino.1bpp",   footprint_top
INCBIN "gfx/footprints/nidoking.1bpp",   footprint_top
INCBIN "gfx/footprints/clefairy.1bpp",   footprint_top
INCBIN "gfx/footprints/clefable.1bpp",   footprint_top
INCBIN "gfx/footprints/vulpix.1bpp",     footprint_top
INCBIN "gfx/footprints/ninetales.1bpp",  footprint_top
INCBIN "gfx/footprints/jigglypuff.1bpp", footprint_top
INCBIN "gfx/footprints/wigglytuff.1bpp", footprint_top
; 033-040 bottom halves
INCBIN "gfx/footprints/nidorino.1bpp",   footprint_bottom
INCBIN "gfx/footprints/nidoking.1bpp",   footprint_bottom
INCBIN "gfx/footprints/clefairy.1bpp",   footprint_bottom
INCBIN "gfx/footprints/clefable.1bpp",   footprint_bottom
INCBIN "gfx/footprints/vulpix.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ninetales.1bpp",  footprint_bottom
INCBIN "gfx/footprints/jigglypuff.1bpp", footprint_bottom
INCBIN "gfx/footprints/wigglytuff.1bpp", footprint_bottom
; 041-048 top halves
INCBIN "gfx/footprints/zubat.1bpp",      footprint_top
INCBIN "gfx/footprints/golbat.1bpp",     footprint_top
INCBIN "gfx/footprints/oddish.1bpp",     footprint_top
INCBIN "gfx/footprints/gloom.1bpp",      footprint_top
INCBIN "gfx/footprints/vileplume.1bpp",  footprint_top
INCBIN "gfx/footprints/paras.1bpp",      footprint_top
INCBIN "gfx/footprints/parasect.1bpp",   footprint_top
INCBIN "gfx/footprints/venonat.1bpp",    footprint_top
; 041-048 bottom halves
INCBIN "gfx/footprints/zubat.1bpp",      footprint_bottom
INCBIN "gfx/footprints/golbat.1bpp",     footprint_bottom
INCBIN "gfx/footprints/oddish.1bpp",     footprint_bottom
INCBIN "gfx/footprints/gloom.1bpp",      footprint_bottom
INCBIN "gfx/footprints/vileplume.1bpp",  footprint_bottom
INCBIN "gfx/footprints/paras.1bpp",      footprint_bottom
INCBIN "gfx/footprints/parasect.1bpp",   footprint_bottom
INCBIN "gfx/footprints/venonat.1bpp",    footprint_bottom
; 049-056 top halves
INCBIN "gfx/footprints/venomoth.1bpp",   footprint_top
INCBIN "gfx/footprints/diglett.1bpp",    footprint_top
INCBIN "gfx/footprints/dugtrio.1bpp",    footprint_top
INCBIN "gfx/footprints/meowth.1bpp",     footprint_top
INCBIN "gfx/footprints/persian.1bpp",    footprint_top
INCBIN "gfx/footprints/psyduck.1bpp",    footprint_top
INCBIN "gfx/footprints/golduck.1bpp",    footprint_top
INCBIN "gfx/footprints/mankey.1bpp",     footprint_top
; 049-056 bottom halves
INCBIN "gfx/footprints/venomoth.1bpp",   footprint_bottom
INCBIN "gfx/footprints/diglett.1bpp",    footprint_bottom
INCBIN "gfx/footprints/dugtrio.1bpp",    footprint_bottom
INCBIN "gfx/footprints/meowth.1bpp",     footprint_bottom
INCBIN "gfx/footprints/persian.1bpp",    footprint_bottom
INCBIN "gfx/footprints/psyduck.1bpp",    footprint_bottom
INCBIN "gfx/footprints/golduck.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mankey.1bpp",     footprint_bottom
; 057-064 top halves
INCBIN "gfx/footprints/primeape.1bpp",   footprint_top
INCBIN "gfx/footprints/growlithe.1bpp",  footprint_top
INCBIN "gfx/footprints/arcanine.1bpp",   footprint_top
INCBIN "gfx/footprints/poliwag.1bpp",    footprint_top
INCBIN "gfx/footprints/poliwhirl.1bpp",  footprint_top
INCBIN "gfx/footprints/poliwrath.1bpp",  footprint_top
INCBIN "gfx/footprints/abra.1bpp",       footprint_top
INCBIN "gfx/footprints/kadabra.1bpp",    footprint_top
; 057-064 bottom halves
INCBIN "gfx/footprints/primeape.1bpp",   footprint_bottom
INCBIN "gfx/footprints/growlithe.1bpp",  footprint_bottom
INCBIN "gfx/footprints/arcanine.1bpp",   footprint_bottom
INCBIN "gfx/footprints/poliwag.1bpp",    footprint_bottom
INCBIN "gfx/footprints/poliwhirl.1bpp",  footprint_bottom
INCBIN "gfx/footprints/poliwrath.1bpp",  footprint_bottom
INCBIN "gfx/footprints/abra.1bpp",       footprint_bottom
INCBIN "gfx/footprints/kadabra.1bpp",    footprint_bottom
; 065-072 top halves
INCBIN "gfx/footprints/alakazam.1bpp",   footprint_top
INCBIN "gfx/footprints/machop.1bpp",     footprint_top
INCBIN "gfx/footprints/machoke.1bpp",    footprint_top
INCBIN "gfx/footprints/machamp.1bpp",    footprint_top
INCBIN "gfx/footprints/bellsprout.1bpp", footprint_top
INCBIN "gfx/footprints/weepinbell.1bpp", footprint_top
INCBIN "gfx/footprints/victreebel.1bpp", footprint_top
INCBIN "gfx/footprints/tentacool.1bpp",  footprint_top
; 065-072 bottom halves
INCBIN "gfx/footprints/alakazam.1bpp",   footprint_bottom
INCBIN "gfx/footprints/machop.1bpp",     footprint_bottom
INCBIN "gfx/footprints/machoke.1bpp",    footprint_bottom
INCBIN "gfx/footprints/machamp.1bpp",    footprint_bottom
INCBIN "gfx/footprints/bellsprout.1bpp", footprint_bottom
INCBIN "gfx/footprints/weepinbell.1bpp", footprint_bottom
INCBIN "gfx/footprints/victreebel.1bpp", footprint_bottom
INCBIN "gfx/footprints/tentacool.1bpp",  footprint_bottom
; 073-080 top halves
INCBIN "gfx/footprints/tentacruel.1bpp", footprint_top
INCBIN "gfx/footprints/geodude.1bpp",    footprint_top
INCBIN "gfx/footprints/graveler.1bpp",   footprint_top
INCBIN "gfx/footprints/golem.1bpp",      footprint_top
INCBIN "gfx/footprints/ponyta.1bpp",     footprint_top
INCBIN "gfx/footprints/rapidash.1bpp",   footprint_top
INCBIN "gfx/footprints/slowpoke.1bpp",   footprint_top
INCBIN "gfx/footprints/slowbro.1bpp",    footprint_top
; 073-080 bottom halves
INCBIN "gfx/footprints/tentacruel.1bpp", footprint_bottom
INCBIN "gfx/footprints/geodude.1bpp",    footprint_bottom
INCBIN "gfx/footprints/graveler.1bpp",   footprint_bottom
INCBIN "gfx/footprints/golem.1bpp",      footprint_bottom
INCBIN "gfx/footprints/ponyta.1bpp",     footprint_bottom
INCBIN "gfx/footprints/rapidash.1bpp",   footprint_bottom
INCBIN "gfx/footprints/slowpoke.1bpp",   footprint_bottom
INCBIN "gfx/footprints/slowbro.1bpp",    footprint_bottom
; 081-088 top halves
INCBIN "gfx/footprints/magnemite.1bpp",  footprint_top
INCBIN "gfx/footprints/magneton.1bpp",   footprint_top
INCBIN "gfx/footprints/farfetch_d.1bpp", footprint_top
INCBIN "gfx/footprints/doduo.1bpp",      footprint_top
INCBIN "gfx/footprints/dodrio.1bpp",     footprint_top
INCBIN "gfx/footprints/seel.1bpp",       footprint_top
INCBIN "gfx/footprints/dewgong.1bpp",    footprint_top
INCBIN "gfx/footprints/grimer.1bpp",     footprint_top
; 081-088 bottom halves
INCBIN "gfx/footprints/magnemite.1bpp",  footprint_bottom
INCBIN "gfx/footprints/magneton.1bpp",   footprint_bottom
INCBIN "gfx/footprints/farfetch_d.1bpp", footprint_bottom
INCBIN "gfx/footprints/doduo.1bpp",      footprint_bottom
INCBIN "gfx/footprints/dodrio.1bpp",     footprint_bottom
INCBIN "gfx/footprints/seel.1bpp",       footprint_bottom
INCBIN "gfx/footprints/dewgong.1bpp",    footprint_bottom
INCBIN "gfx/footprints/grimer.1bpp",     footprint_bottom
; 089-096 top halves
INCBIN "gfx/footprints/muk.1bpp",        footprint_top
INCBIN "gfx/footprints/shellder.1bpp",   footprint_top
INCBIN "gfx/footprints/cloyster.1bpp",   footprint_top
INCBIN "gfx/footprints/gastly.1bpp",     footprint_top
INCBIN "gfx/footprints/haunter.1bpp",    footprint_top
INCBIN "gfx/footprints/gengar.1bpp",     footprint_top
INCBIN "gfx/footprints/onix.1bpp",       footprint_top
INCBIN "gfx/footprints/drowzee.1bpp",    footprint_top
; 089-096 bottom halves
INCBIN "gfx/footprints/muk.1bpp",        footprint_bottom
INCBIN "gfx/footprints/shellder.1bpp",   footprint_bottom
INCBIN "gfx/footprints/cloyster.1bpp",   footprint_bottom
INCBIN "gfx/footprints/gastly.1bpp",     footprint_bottom
INCBIN "gfx/footprints/haunter.1bpp",    footprint_bottom
INCBIN "gfx/footprints/gengar.1bpp",     footprint_bottom
INCBIN "gfx/footprints/onix.1bpp",       footprint_bottom
INCBIN "gfx/footprints/drowzee.1bpp",    footprint_bottom
; 097-104 top halves
INCBIN "gfx/footprints/hypno.1bpp",      footprint_top
INCBIN "gfx/footprints/krabby.1bpp",     footprint_top
INCBIN "gfx/footprints/kingler.1bpp",    footprint_top
INCBIN "gfx/footprints/voltorb.1bpp",    footprint_top
INCBIN "gfx/footprints/electrode.1bpp",  footprint_top
INCBIN "gfx/footprints/exeggcute.1bpp",  footprint_top
INCBIN "gfx/footprints/exeggutor.1bpp",  footprint_top
INCBIN "gfx/footprints/cubone.1bpp",     footprint_top
; 097-104 bottom halves
INCBIN "gfx/footprints/hypno.1bpp",      footprint_bottom
INCBIN "gfx/footprints/krabby.1bpp",     footprint_bottom
INCBIN "gfx/footprints/kingler.1bpp",    footprint_bottom
INCBIN "gfx/footprints/voltorb.1bpp",    footprint_bottom
INCBIN "gfx/footprints/electrode.1bpp",  footprint_bottom
INCBIN "gfx/footprints/exeggcute.1bpp",  footprint_bottom
INCBIN "gfx/footprints/exeggutor.1bpp",  footprint_bottom
INCBIN "gfx/footprints/cubone.1bpp",     footprint_bottom
; 105-112 top halves
INCBIN "gfx/footprints/marowak.1bpp",    footprint_top
INCBIN "gfx/footprints/hitmonlee.1bpp",  footprint_top
INCBIN "gfx/footprints/hitmonchan.1bpp", footprint_top
INCBIN "gfx/footprints/lickitung.1bpp",  footprint_top
INCBIN "gfx/footprints/koffing.1bpp",    footprint_top
INCBIN "gfx/footprints/weezing.1bpp",    footprint_top
INCBIN "gfx/footprints/rhyhorn.1bpp",    footprint_top
INCBIN "gfx/footprints/rhydon.1bpp",     footprint_top
; 105-112 bottom halves
INCBIN "gfx/footprints/marowak.1bpp",    footprint_bottom
INCBIN "gfx/footprints/hitmonlee.1bpp",  footprint_bottom
INCBIN "gfx/footprints/hitmonchan.1bpp", footprint_bottom
INCBIN "gfx/footprints/lickitung.1bpp",  footprint_bottom
INCBIN "gfx/footprints/koffing.1bpp",    footprint_bottom
INCBIN "gfx/footprints/weezing.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rhyhorn.1bpp",    footprint_bottom
INCBIN "gfx/footprints/rhydon.1bpp",     footprint_bottom
; 113-120 top halves
INCBIN "gfx/footprints/chansey.1bpp",    footprint_top
INCBIN "gfx/footprints/tangela.1bpp",    footprint_top
INCBIN "gfx/footprints/kangaskhan.1bpp", footprint_top
INCBIN "gfx/footprints/horsea.1bpp",     footprint_top
INCBIN "gfx/footprints/seadra.1bpp",     footprint_top
INCBIN "gfx/footprints/goldeen.1bpp",    footprint_top
INCBIN "gfx/footprints/seaking.1bpp",    footprint_top
INCBIN "gfx/footprints/staryu.1bpp",     footprint_top
; 113-120 bottom halves
INCBIN "gfx/footprints/chansey.1bpp",    footprint_bottom
INCBIN "gfx/footprints/tangela.1bpp",    footprint_bottom
INCBIN "gfx/footprints/kangaskhan.1bpp", footprint_bottom
INCBIN "gfx/footprints/horsea.1bpp",     footprint_bottom
INCBIN "gfx/footprints/seadra.1bpp",     footprint_bottom
INCBIN "gfx/footprints/goldeen.1bpp",    footprint_bottom
INCBIN "gfx/footprints/seaking.1bpp",    footprint_bottom
INCBIN "gfx/footprints/staryu.1bpp",     footprint_bottom
; 121-128 top halves
INCBIN "gfx/footprints/starmie.1bpp",    footprint_top
INCBIN "gfx/footprints/mr__mime.1bpp",   footprint_top
INCBIN "gfx/footprints/scyther.1bpp",    footprint_top
INCBIN "gfx/footprints/jynx.1bpp",       footprint_top
INCBIN "gfx/footprints/electabuzz.1bpp", footprint_top
INCBIN "gfx/footprints/magmar.1bpp",     footprint_top
INCBIN "gfx/footprints/pinsir.1bpp",     footprint_top
INCBIN "gfx/footprints/tauros.1bpp",     footprint_top
; 121-128 bottom halves
INCBIN "gfx/footprints/starmie.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mr__mime.1bpp",   footprint_bottom
INCBIN "gfx/footprints/scyther.1bpp",    footprint_bottom
INCBIN "gfx/footprints/jynx.1bpp",       footprint_bottom
INCBIN "gfx/footprints/electabuzz.1bpp", footprint_bottom
INCBIN "gfx/footprints/magmar.1bpp",     footprint_bottom
INCBIN "gfx/footprints/pinsir.1bpp",     footprint_bottom
INCBIN "gfx/footprints/tauros.1bpp",     footprint_bottom
; 129-136 top halves
INCBIN "gfx/footprints/magikarp.1bpp",   footprint_top
INCBIN "gfx/footprints/gyarados.1bpp",   footprint_top
INCBIN "gfx/footprints/lapras.1bpp",     footprint_top
INCBIN "gfx/footprints/ditto.1bpp",      footprint_top
INCBIN "gfx/footprints/eevee.1bpp",      footprint_top
INCBIN "gfx/footprints/vaporeon.1bpp",   footprint_top
INCBIN "gfx/footprints/jolteon.1bpp",    footprint_top
INCBIN "gfx/footprints/flareon.1bpp",    footprint_top
; 129-136 bottom halves
INCBIN "gfx/footprints/magikarp.1bpp",   footprint_bottom
INCBIN "gfx/footprints/gyarados.1bpp",   footprint_bottom
INCBIN "gfx/footprints/lapras.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ditto.1bpp",      footprint_bottom
INCBIN "gfx/footprints/eevee.1bpp",      footprint_bottom
INCBIN "gfx/footprints/vaporeon.1bpp",   footprint_bottom
INCBIN "gfx/footprints/jolteon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/flareon.1bpp",    footprint_bottom
; 137-144 top halves
INCBIN "gfx/footprints/porygon.1bpp",    footprint_top
INCBIN "gfx/footprints/omanyte.1bpp",    footprint_top
INCBIN "gfx/footprints/omastar.1bpp",    footprint_top
INCBIN "gfx/footprints/kabuto.1bpp",     footprint_top
INCBIN "gfx/footprints/kabutops.1bpp",   footprint_top
INCBIN "gfx/footprints/aerodactyl.1bpp", footprint_top
INCBIN "gfx/footprints/snorlax.1bpp",    footprint_top
INCBIN "gfx/footprints/articuno.1bpp",   footprint_top
; 137-144 bottom halves
INCBIN "gfx/footprints/porygon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/omanyte.1bpp",    footprint_bottom
INCBIN "gfx/footprints/omastar.1bpp",    footprint_bottom
INCBIN "gfx/footprints/kabuto.1bpp",     footprint_bottom
INCBIN "gfx/footprints/kabutops.1bpp",   footprint_bottom
INCBIN "gfx/footprints/aerodactyl.1bpp", footprint_bottom
INCBIN "gfx/footprints/snorlax.1bpp",    footprint_bottom
INCBIN "gfx/footprints/articuno.1bpp",   footprint_bottom
; 145-152 top halves
INCBIN "gfx/footprints/zapdos.1bpp",     footprint_top
INCBIN "gfx/footprints/moltres.1bpp",    footprint_top
INCBIN "gfx/footprints/dratini.1bpp",    footprint_top
INCBIN "gfx/footprints/dragonair.1bpp",  footprint_top
INCBIN "gfx/footprints/dragonite.1bpp",  footprint_top
INCBIN "gfx/footprints/mewtwo.1bpp",     footprint_top
INCBIN "gfx/footprints/mew.1bpp",        footprint_top
INCBIN "gfx/footprints/chikorita.1bpp",  footprint_top
; 145-152 bottom halves
INCBIN "gfx/footprints/zapdos.1bpp",     footprint_bottom
INCBIN "gfx/footprints/moltres.1bpp",    footprint_bottom
INCBIN "gfx/footprints/dratini.1bpp",    footprint_bottom
INCBIN "gfx/footprints/dragonair.1bpp",  footprint_bottom
INCBIN "gfx/footprints/dragonite.1bpp",  footprint_bottom
INCBIN "gfx/footprints/mewtwo.1bpp",     footprint_bottom
INCBIN "gfx/footprints/mew.1bpp",        footprint_bottom
INCBIN "gfx/footprints/chikorita.1bpp",  footprint_bottom
; 153-160 top halves
INCBIN "gfx/footprints/bayleef.1bpp",    footprint_top
INCBIN "gfx/footprints/meganium.1bpp",   footprint_top
INCBIN "gfx/footprints/cyndaquil.1bpp",  footprint_top
INCBIN "gfx/footprints/quilava.1bpp",    footprint_top
INCBIN "gfx/footprints/typhlosion.1bpp", footprint_top
INCBIN "gfx/footprints/totodile.1bpp",   footprint_top
INCBIN "gfx/footprints/croconaw.1bpp",   footprint_top
INCBIN "gfx/footprints/feraligatr.1bpp", footprint_top
; 153-160 bottom halves
INCBIN "gfx/footprints/bayleef.1bpp",    footprint_bottom
INCBIN "gfx/footprints/meganium.1bpp",   footprint_bottom
INCBIN "gfx/footprints/cyndaquil.1bpp",  footprint_bottom
INCBIN "gfx/footprints/quilava.1bpp",    footprint_bottom
INCBIN "gfx/footprints/typhlosion.1bpp", footprint_bottom
INCBIN "gfx/footprints/totodile.1bpp",   footprint_bottom
INCBIN "gfx/footprints/croconaw.1bpp",   footprint_bottom
INCBIN "gfx/footprints/feraligatr.1bpp", footprint_bottom
; 161-168 top halves
INCBIN "gfx/footprints/sentret.1bpp",    footprint_top
INCBIN "gfx/footprints/furret.1bpp",     footprint_top
INCBIN "gfx/footprints/hoothoot.1bpp",   footprint_top
INCBIN "gfx/footprints/noctowl.1bpp",    footprint_top
INCBIN "gfx/footprints/ledyba.1bpp",     footprint_top
INCBIN "gfx/footprints/ledian.1bpp",     footprint_top
INCBIN "gfx/footprints/spinarak.1bpp",   footprint_top
INCBIN "gfx/footprints/ariados.1bpp",    footprint_top
; 161-168 bottom halves
INCBIN "gfx/footprints/sentret.1bpp",    footprint_bottom
INCBIN "gfx/footprints/furret.1bpp",     footprint_bottom
INCBIN "gfx/footprints/hoothoot.1bpp",   footprint_bottom
INCBIN "gfx/footprints/noctowl.1bpp",    footprint_bottom
INCBIN "gfx/footprints/ledyba.1bpp",     footprint_bottom
INCBIN "gfx/footprints/ledian.1bpp",     footprint_bottom
INCBIN "gfx/footprints/spinarak.1bpp",   footprint_bottom
INCBIN "gfx/footprints/ariados.1bpp",    footprint_bottom
; 169-176 top halves
INCBIN "gfx/footprints/crobat.1bpp",     footprint_top
INCBIN "gfx/footprints/chinchou.1bpp",   footprint_top
INCBIN "gfx/footprints/lanturn.1bpp",    footprint_top
INCBIN "gfx/footprints/pichu.1bpp",      footprint_top
INCBIN "gfx/footprints/cleffa.1bpp",     footprint_top
INCBIN "gfx/footprints/igglybuff.1bpp",  footprint_top
INCBIN "gfx/footprints/togepi.1bpp",     footprint_top
INCBIN "gfx/footprints/togetic.1bpp",    footprint_top
; 169-176 bottom halves
INCBIN "gfx/footprints/crobat.1bpp",     footprint_bottom
INCBIN "gfx/footprints/chinchou.1bpp",   footprint_bottom
INCBIN "gfx/footprints/lanturn.1bpp",    footprint_bottom
INCBIN "gfx/footprints/pichu.1bpp",      footprint_bottom
INCBIN "gfx/footprints/cleffa.1bpp",     footprint_bottom
INCBIN "gfx/footprints/igglybuff.1bpp",  footprint_bottom
INCBIN "gfx/footprints/togepi.1bpp",     footprint_bottom
INCBIN "gfx/footprints/togetic.1bpp",    footprint_bottom
; 177-184 top halves
INCBIN "gfx/footprints/natu.1bpp",       footprint_top
INCBIN "gfx/footprints/xatu.1bpp",       footprint_top
INCBIN "gfx/footprints/mareep.1bpp",     footprint_top
INCBIN "gfx/footprints/flaaffy.1bpp",    footprint_top
INCBIN "gfx/footprints/ampharos.1bpp",   footprint_top
INCBIN "gfx/footprints/bellossom.1bpp",  footprint_top
INCBIN "gfx/footprints/marill.1bpp",     footprint_top
INCBIN "gfx/footprints/azumarill.1bpp",  footprint_top
; 177-184 bottom halves
INCBIN "gfx/footprints/natu.1bpp",       footprint_bottom
INCBIN "gfx/footprints/xatu.1bpp",       footprint_bottom
INCBIN "gfx/footprints/mareep.1bpp",     footprint_bottom
INCBIN "gfx/footprints/flaaffy.1bpp",    footprint_bottom
INCBIN "gfx/footprints/ampharos.1bpp",   footprint_bottom
INCBIN "gfx/footprints/bellossom.1bpp",  footprint_bottom
INCBIN "gfx/footprints/marill.1bpp",     footprint_bottom
INCBIN "gfx/footprints/azumarill.1bpp",  footprint_bottom
; 185-192 top halves
INCBIN "gfx/footprints/sudowoodo.1bpp",  footprint_top
INCBIN "gfx/footprints/politoed.1bpp",   footprint_top
INCBIN "gfx/footprints/hoppip.1bpp",     footprint_top
INCBIN "gfx/footprints/skiploom.1bpp",   footprint_top
INCBIN "gfx/footprints/jumpluff.1bpp",   footprint_top
INCBIN "gfx/footprints/aipom.1bpp",      footprint_top
INCBIN "gfx/footprints/sunkern.1bpp",    footprint_top
INCBIN "gfx/footprints/sunflora.1bpp",   footprint_top
; 185-192 bottom halves
INCBIN "gfx/footprints/sudowoodo.1bpp",  footprint_bottom
INCBIN "gfx/footprints/politoed.1bpp",   footprint_bottom
INCBIN "gfx/footprints/hoppip.1bpp",     footprint_bottom
INCBIN "gfx/footprints/skiploom.1bpp",   footprint_bottom
INCBIN "gfx/footprints/jumpluff.1bpp",   footprint_bottom
INCBIN "gfx/footprints/aipom.1bpp",      footprint_bottom
INCBIN "gfx/footprints/sunkern.1bpp",    footprint_bottom
INCBIN "gfx/footprints/sunflora.1bpp",   footprint_bottom
; 193-200 top halves
INCBIN "gfx/footprints/yanma.1bpp",      footprint_top
INCBIN "gfx/footprints/wooper.1bpp",     footprint_top
INCBIN "gfx/footprints/quagsire.1bpp",   footprint_top
INCBIN "gfx/footprints/espeon.1bpp",     footprint_top
INCBIN "gfx/footprints/umbreon.1bpp",    footprint_top
INCBIN "gfx/footprints/murkrow.1bpp",    footprint_top
INCBIN "gfx/footprints/slowking.1bpp",   footprint_top
INCBIN "gfx/footprints/misdreavus.1bpp", footprint_top
; 193-200 bottom halves
INCBIN "gfx/footprints/yanma.1bpp",      footprint_bottom
INCBIN "gfx/footprints/wooper.1bpp",     footprint_bottom
INCBIN "gfx/footprints/quagsire.1bpp",   footprint_bottom
INCBIN "gfx/footprints/espeon.1bpp",     footprint_bottom
INCBIN "gfx/footprints/umbreon.1bpp",    footprint_bottom
INCBIN "gfx/footprints/murkrow.1bpp",    footprint_bottom
INCBIN "gfx/footprints/slowking.1bpp",   footprint_bottom
INCBIN "gfx/footprints/misdreavus.1bpp", footprint_bottom
; 201-208 top halves
INCBIN "gfx/footprints/unown.1bpp",      footprint_top
INCBIN "gfx/footprints/wobbuffet.1bpp",  footprint_top
INCBIN "gfx/footprints/girafarig.1bpp",  footprint_top
INCBIN "gfx/footprints/pineco.1bpp",     footprint_top
INCBIN "gfx/footprints/forretress.1bpp", footprint_top
INCBIN "gfx/footprints/dunsparce.1bpp",  footprint_top
INCBIN "gfx/footprints/gligar.1bpp",     footprint_top
INCBIN "gfx/footprints/steelix.1bpp",    footprint_top
; 201-208 bottom halves
INCBIN "gfx/footprints/unown.1bpp",      footprint_bottom
INCBIN "gfx/footprints/wobbuffet.1bpp",  footprint_bottom
INCBIN "gfx/footprints/girafarig.1bpp",  footprint_bottom
INCBIN "gfx/footprints/pineco.1bpp",     footprint_bottom
INCBIN "gfx/footprints/forretress.1bpp", footprint_bottom
INCBIN "gfx/footprints/dunsparce.1bpp",  footprint_bottom
INCBIN "gfx/footprints/gligar.1bpp",     footprint_bottom
INCBIN "gfx/footprints/steelix.1bpp",    footprint_bottom
; 209-216 top halves
INCBIN "gfx/footprints/snubbull.1bpp",   footprint_top
INCBIN "gfx/footprints/granbull.1bpp",   footprint_top
INCBIN "gfx/footprints/qwilfish.1bpp",   footprint_top
INCBIN "gfx/footprints/scizor.1bpp",     footprint_top
INCBIN "gfx/footprints/shuckle.1bpp",    footprint_top
INCBIN "gfx/footprints/heracross.1bpp",  footprint_top
INCBIN "gfx/footprints/sneasel.1bpp",    footprint_top
INCBIN "gfx/footprints/teddiursa.1bpp",  footprint_top
; 209-216 bottom halves
INCBIN "gfx/footprints/snubbull.1bpp",   footprint_bottom
INCBIN "gfx/footprints/granbull.1bpp",   footprint_bottom
INCBIN "gfx/footprints/qwilfish.1bpp",   footprint_bottom
INCBIN "gfx/footprints/scizor.1bpp",     footprint_bottom
INCBIN "gfx/footprints/shuckle.1bpp",    footprint_bottom
INCBIN "gfx/footprints/heracross.1bpp",  footprint_bottom
INCBIN "gfx/footprints/sneasel.1bpp",    footprint_bottom
INCBIN "gfx/footprints/teddiursa.1bpp",  footprint_bottom
; 217-224 top halves
INCBIN "gfx/footprints/ursaring.1bpp",   footprint_top
INCBIN "gfx/footprints/slugma.1bpp",     footprint_top
INCBIN "gfx/footprints/magcargo.1bpp",   footprint_top
INCBIN "gfx/footprints/swinub.1bpp",     footprint_top
INCBIN "gfx/footprints/piloswine.1bpp",  footprint_top
INCBIN "gfx/footprints/corsola.1bpp",    footprint_top
INCBIN "gfx/footprints/remoraid.1bpp",   footprint_top
INCBIN "gfx/footprints/octillery.1bpp",  footprint_top
; 217-224 bottom halves
INCBIN "gfx/footprints/ursaring.1bpp",   footprint_bottom
INCBIN "gfx/footprints/slugma.1bpp",     footprint_bottom
INCBIN "gfx/footprints/magcargo.1bpp",   footprint_bottom
INCBIN "gfx/footprints/swinub.1bpp",     footprint_bottom
INCBIN "gfx/footprints/piloswine.1bpp",  footprint_bottom
INCBIN "gfx/footprints/corsola.1bpp",    footprint_bottom
INCBIN "gfx/footprints/remoraid.1bpp",   footprint_bottom
INCBIN "gfx/footprints/octillery.1bpp",  footprint_bottom
; 225-232 top halves
INCBIN "gfx/footprints/delibird.1bpp",   footprint_top
INCBIN "gfx/footprints/mantine.1bpp",    footprint_top
INCBIN "gfx/footprints/skarmory.1bpp",   footprint_top
INCBIN "gfx/footprints/houndour.1bpp",   footprint_top
INCBIN "gfx/footprints/houndoom.1bpp",   footprint_top
INCBIN "gfx/footprints/kingdra.1bpp",    footprint_top
INCBIN "gfx/footprints/phanpy.1bpp",     footprint_top
INCBIN "gfx/footprints/donphan.1bpp",    footprint_top
; 225-232 bottom halves
INCBIN "gfx/footprints/delibird.1bpp",   footprint_bottom
INCBIN "gfx/footprints/mantine.1bpp",    footprint_bottom
INCBIN "gfx/footprints/skarmory.1bpp",   footprint_bottom
INCBIN "gfx/footprints/houndour.1bpp",   footprint_bottom
INCBIN "gfx/footprints/houndoom.1bpp",   footprint_bottom
INCBIN "gfx/footprints/kingdra.1bpp",    footprint_bottom
INCBIN "gfx/footprints/phanpy.1bpp",     footprint_bottom
INCBIN "gfx/footprints/donphan.1bpp",    footprint_bottom
; 233-240 top halves
INCBIN "gfx/footprints/porygon2.1bpp",   footprint_top
INCBIN "gfx/footprints/stantler.1bpp",   footprint_top
INCBIN "gfx/footprints/smeargle.1bpp",   footprint_top
INCBIN "gfx/footprints/tyrogue.1bpp",    footprint_top
INCBIN "gfx/footprints/hitmontop.1bpp",  footprint_top
INCBIN "gfx/footprints/smoochum.1bpp",   footprint_top
INCBIN "gfx/footprints/elekid.1bpp",     footprint_top
INCBIN "gfx/footprints/magby.1bpp",      footprint_top
; 233-240 bottom halves
INCBIN "gfx/footprints/porygon2.1bpp",   footprint_bottom
INCBIN "gfx/footprints/stantler.1bpp",   footprint_bottom
INCBIN "gfx/footprints/smeargle.1bpp",   footprint_bottom
INCBIN "gfx/footprints/tyrogue.1bpp",    footprint_bottom
INCBIN "gfx/footprints/hitmontop.1bpp",  footprint_bottom
INCBIN "gfx/footprints/smoochum.1bpp",   footprint_bottom
INCBIN "gfx/footprints/elekid.1bpp",     footprint_bottom
INCBIN "gfx/footprints/magby.1bpp",      footprint_bottom
; 241-248 top halves
INCBIN "gfx/footprints/miltank.1bpp",    footprint_top
INCBIN "gfx/footprints/blissey.1bpp",    footprint_top
INCBIN "gfx/footprints/raikou.1bpp",     footprint_top
INCBIN "gfx/footprints/entei.1bpp",      footprint_top
INCBIN "gfx/footprints/suicune.1bpp",    footprint_top
INCBIN "gfx/footprints/larvitar.1bpp",   footprint_top
INCBIN "gfx/footprints/pupitar.1bpp",    footprint_top
INCBIN "gfx/footprints/tyranitar.1bpp",  footprint_top
; 241-248 bottom halves
INCBIN "gfx/footprints/miltank.1bpp",    footprint_bottom
INCBIN "gfx/footprints/blissey.1bpp",    footprint_bottom
INCBIN "gfx/footprints/raikou.1bpp",     footprint_bottom
INCBIN "gfx/footprints/entei.1bpp",      footprint_bottom
INCBIN "gfx/footprints/suicune.1bpp",    footprint_bottom
INCBIN "gfx/footprints/larvitar.1bpp",   footprint_bottom
INCBIN "gfx/footprints/pupitar.1bpp",    footprint_bottom
INCBIN "gfx/footprints/tyranitar.1bpp",  footprint_bottom
; 249-256 top halves
INCBIN "gfx/footprints/lugia.1bpp",      footprint_top
INCBIN "gfx/footprints/ho_oh.1bpp",      footprint_top
INCBIN "gfx/footprints/celebi.1bpp",     footprint_top
INCBIN "gfx/footprints/252.1bpp",        footprint_top
INCBIN "gfx/footprints/253.1bpp",        footprint_top
INCBIN "gfx/footprints/254.1bpp",        footprint_top
INCBIN "gfx/footprints/255.1bpp",        footprint_top
INCBIN "gfx/footprints/256.1bpp",        footprint_top
; 249-256 bottom halves
INCBIN "gfx/footprints/lugia.1bpp",      footprint_bottom
INCBIN "gfx/footprints/ho_oh.1bpp",      footprint_bottom
INCBIN "gfx/footprints/celebi.1bpp",     footprint_bottom
INCBIN "gfx/footprints/252.1bpp",        footprint_bottom
INCBIN "gfx/footprints/253.1bpp",        footprint_bottom
INCBIN "gfx/footprints/254.1bpp",        footprint_bottom
INCBIN "gfx/footprints/255.1bpp",        footprint_bottom
INCBIN "gfx/footprints/256.1bpp",        footprint_bottom
; 257-264 top halves
INCBIN "gfx/footprints/yamask.1bpp",     footprint_top
INCBIN "gfx/footprints/cofagrigus.1bpp", footprint_top
INCBIN "gfx/footprints/mon_103.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_104.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_105.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_106.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_107.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_108.1bpp",    footprint_top
; 257-264 bottom halves
INCBIN "gfx/footprints/yamask.1bpp",     footprint_bottom
INCBIN "gfx/footprints/cofagrigus.1bpp", footprint_bottom
INCBIN "gfx/footprints/mon_103.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_104.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_105.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_106.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_107.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_108.1bpp",    footprint_bottom
; 265-272 top halves
INCBIN "gfx/footprints/mon_109.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_10A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_10B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_10C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_10D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_10E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_10F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_110.1bpp",    footprint_top
; 265-272 bottom halves
INCBIN "gfx/footprints/mon_109.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_10A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_10B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_10C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_10D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_10E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_10F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_110.1bpp",    footprint_bottom
; 273-280 top halves
INCBIN "gfx/footprints/mon_111.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_112.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_113.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_114.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_115.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_116.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_117.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_118.1bpp",    footprint_top
; 273-280 bottom halves
INCBIN "gfx/footprints/mon_111.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_112.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_113.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_114.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_115.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_116.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_117.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_118.1bpp",    footprint_bottom
; 281-288 top halves
INCBIN "gfx/footprints/mon_119.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_11A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_11B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_11C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_11D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_11E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_11F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_120.1bpp",    footprint_top
; 281-288 bottom halves
INCBIN "gfx/footprints/mon_119.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_11A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_11B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_11C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_11D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_11E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_11F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_120.1bpp",    footprint_bottom
; 289-296 top halves
INCBIN "gfx/footprints/mon_121.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_122.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_123.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_124.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_125.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_126.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_127.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_128.1bpp",    footprint_top
; 289-296 bottom halves
INCBIN "gfx/footprints/mon_121.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_122.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_123.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_124.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_125.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_126.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_127.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_128.1bpp",    footprint_bottom
; 297-304 top halves
INCBIN "gfx/footprints/mon_129.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_12A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_12B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_12C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_12D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_12E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_12F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_130.1bpp",    footprint_top
; 297-304 bottom halves
INCBIN "gfx/footprints/mon_129.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_12A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_12B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_12C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_12D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_12E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_12F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_130.1bpp",    footprint_bottom
; 305-312 top halves
INCBIN "gfx/footprints/mon_131.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_132.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_133.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_134.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_135.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_136.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_137.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_138.1bpp",    footprint_top
; 305-312 bottom halves
INCBIN "gfx/footprints/mon_131.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_132.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_133.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_134.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_135.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_136.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_137.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_138.1bpp",    footprint_bottom
; 313-320 top halves
INCBIN "gfx/footprints/mon_139.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_13A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_13B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_13C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_13D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_13E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_13F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_140.1bpp",    footprint_top
; 313-320 bottom halves
INCBIN "gfx/footprints/mon_139.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_13A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_13B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_13C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_13D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_13E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_13F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_140.1bpp",    footprint_bottom
; 321-328 top halves
INCBIN "gfx/footprints/mon_141.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_142.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_143.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_144.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_145.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_146.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_147.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_148.1bpp",    footprint_top
; 321-328 bottom halves
INCBIN "gfx/footprints/mon_141.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_142.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_143.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_144.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_145.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_146.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_147.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_148.1bpp",    footprint_bottom
; 329-336 top halves
INCBIN "gfx/footprints/mon_149.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_14A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_14B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_14C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_14D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_14E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_14F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_150.1bpp",    footprint_top
; 329-336 bottom halves
INCBIN "gfx/footprints/mon_149.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_14A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_14B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_14C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_14D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_14E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_14F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_150.1bpp",    footprint_bottom
; 337-344 top halves
INCBIN "gfx/footprints/mon_151.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_152.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_153.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_154.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_155.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_156.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_157.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_158.1bpp",    footprint_top
; 337-344 bottom halves
INCBIN "gfx/footprints/mon_151.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_152.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_153.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_154.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_155.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_156.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_157.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_158.1bpp",    footprint_bottom
; 345-352 top halves
INCBIN "gfx/footprints/mon_159.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_15A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_15B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_15C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_15D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_15E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_15F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_160.1bpp",    footprint_top
; 345-352 bottom halves
INCBIN "gfx/footprints/mon_159.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_15A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_15B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_15C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_15D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_15E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_15F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_160.1bpp",    footprint_bottom
; 353-360 top halves
INCBIN "gfx/footprints/mon_161.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_162.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_163.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_164.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_165.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_166.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_167.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_168.1bpp",    footprint_top
; 353-360 bottom halves
INCBIN "gfx/footprints/mon_161.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_162.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_163.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_164.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_165.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_166.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_167.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_168.1bpp",    footprint_bottom
; 361-368 top halves
INCBIN "gfx/footprints/mon_169.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_16A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_16B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_16C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_16D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_16E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_16F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_170.1bpp",    footprint_top
; 361-368 bottom halves
INCBIN "gfx/footprints/mon_169.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_16A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_16B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_16C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_16D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_16E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_16F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_170.1bpp",    footprint_bottom
; 369-376 top halves
INCBIN "gfx/footprints/mon_171.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_172.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_173.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_174.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_175.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_176.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_177.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_178.1bpp",    footprint_top
; 369-376 bottom halves
INCBIN "gfx/footprints/mon_171.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_172.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_173.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_174.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_175.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_176.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_177.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_178.1bpp",    footprint_bottom
; 377-384 top halves
INCBIN "gfx/footprints/mon_179.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_17A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_17B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_17C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_17D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_17E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_17F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_180.1bpp",    footprint_top
; 377-384 bottom halves
INCBIN "gfx/footprints/mon_179.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_17A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_17B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_17C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_17D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_17E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_17F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_180.1bpp",    footprint_bottom
; 385-392 top halves
INCBIN "gfx/footprints/mon_181.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_182.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_183.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_184.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_185.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_186.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_187.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_188.1bpp",    footprint_top
; 385-392 bottom halves
INCBIN "gfx/footprints/mon_181.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_182.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_183.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_184.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_185.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_186.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_187.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_188.1bpp",    footprint_bottom
; 393-400 top halves
INCBIN "gfx/footprints/mon_189.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_18A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_18B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_18C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_18D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_18E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_18F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_190.1bpp",    footprint_top
; 393-400 bottom halves
INCBIN "gfx/footprints/mon_189.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_18A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_18B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_18C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_18D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_18E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_18F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_190.1bpp",    footprint_bottom
; 401-408 top halves
INCBIN "gfx/footprints/mon_191.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_192.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_193.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_194.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_195.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_196.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_197.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_198.1bpp",    footprint_top
; 401-408 bottom halves
INCBIN "gfx/footprints/mon_191.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_192.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_193.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_194.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_195.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_196.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_197.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_198.1bpp",    footprint_bottom
; 409-416 top halves
INCBIN "gfx/footprints/mon_199.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_19A.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_19B.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_19C.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_19D.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_19E.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_19F.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A0.1bpp",    footprint_top
; 409-416 bottom halves
INCBIN "gfx/footprints/mon_199.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_19A.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_19B.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_19C.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_19D.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_19E.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_19F.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A0.1bpp",    footprint_bottom
; 417-424 top halves
INCBIN "gfx/footprints/mon_1A1.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A2.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A3.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A4.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A5.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A6.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A7.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1A8.1bpp",    footprint_top
; 417-424 bottom halves
INCBIN "gfx/footprints/mon_1A1.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A2.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A3.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A4.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A5.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A6.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A7.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1A8.1bpp",    footprint_bottom
; 425-432 top halves
INCBIN "gfx/footprints/mon_1A9.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1AA.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1AB.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1AC.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1AD.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1AE.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1AF.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B0.1bpp",    footprint_top
; 425-432 bottom halves
INCBIN "gfx/footprints/mon_1A9.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1AA.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1AB.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1AC.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1AD.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1AE.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1AF.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B0.1bpp",    footprint_bottom
; 433-440 top halves
INCBIN "gfx/footprints/mon_1B1.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B2.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B3.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B4.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B5.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B6.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B7.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1B8.1bpp",    footprint_top
; 433-440 bottom halves
INCBIN "gfx/footprints/mon_1B1.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B2.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B3.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B4.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B5.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B6.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B7.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1B8.1bpp",    footprint_bottom
; 441-448 top halves
INCBIN "gfx/footprints/mon_1B9.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1BA.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1BB.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1BC.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1BD.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1BE.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1BF.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C0.1bpp",    footprint_top
; 441-448 bottom halves
INCBIN "gfx/footprints/mon_1B9.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1BA.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1BB.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1BC.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1BD.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1BE.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1BF.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C0.1bpp",    footprint_bottom
; 449-456 top halves
INCBIN "gfx/footprints/mon_1C1.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C2.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C3.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C4.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C5.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C6.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C7.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1C8.1bpp",    footprint_top
; 449-456 bottom halves
INCBIN "gfx/footprints/mon_1C1.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C2.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C3.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C4.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C5.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C6.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C7.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1C8.1bpp",    footprint_bottom
; 457-464 top halves
INCBIN "gfx/footprints/mon_1C9.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1CA.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1CB.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1CC.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1CD.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1CE.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1CF.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D0.1bpp",    footprint_top
; 457-464 bottom halves
INCBIN "gfx/footprints/mon_1C9.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1CA.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1CB.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1CC.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1CD.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1CE.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1CF.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D0.1bpp",    footprint_bottom
; 465-472 top halves
INCBIN "gfx/footprints/mon_1D1.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D2.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D3.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D4.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D5.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D6.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D7.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1D8.1bpp",    footprint_top
; 465-472 bottom halves
INCBIN "gfx/footprints/mon_1D1.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D2.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D3.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D4.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D5.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D6.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D7.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1D8.1bpp",    footprint_bottom
; 473-480 top halves
INCBIN "gfx/footprints/mon_1D9.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1DA.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1DB.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1DC.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1DD.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1DE.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1DF.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E0.1bpp",    footprint_top
; 473-480 bottom halves
INCBIN "gfx/footprints/mon_1D9.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1DA.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1DB.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1DC.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1DD.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1DE.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1DF.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E0.1bpp",    footprint_bottom
; 481-488 top halves
INCBIN "gfx/footprints/mon_1E1.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E2.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E3.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E4.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E5.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E6.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E7.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1E8.1bpp",    footprint_top
; 481-488 bottom halves
INCBIN "gfx/footprints/mon_1E1.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E2.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E3.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E4.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E5.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E6.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E7.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1E8.1bpp",    footprint_bottom
; 489-496 top halves
INCBIN "gfx/footprints/mon_1E9.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1EA.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1EB.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1EC.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1ED.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1EE.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1EF.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F0.1bpp",    footprint_top
; 489-496 bottom halves
INCBIN "gfx/footprints/mon_1E9.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1EA.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1EB.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1EC.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1ED.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1EE.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1EF.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F0.1bpp",    footprint_bottom
; 497-504 top halves
INCBIN "gfx/footprints/mon_1F1.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F2.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F3.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F4.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F5.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F6.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F7.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1F8.1bpp",    footprint_top
; 497-504 bottom halves
INCBIN "gfx/footprints/mon_1F1.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F2.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F3.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F4.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F5.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F6.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F7.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1F8.1bpp",    footprint_bottom
; 505-512 top halves
INCBIN "gfx/footprints/mon_1F9.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1FA.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1FB.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1FC.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1FD.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1FE.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_1FF.1bpp",    footprint_top
INCBIN "gfx/footprints/mon_200.1bpp",    footprint_top
; 505-512 bottom halves
INCBIN "gfx/footprints/mon_1F9.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1FA.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1FB.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1FC.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1FD.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1FE.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_1FF.1bpp",    footprint_bottom
INCBIN "gfx/footprints/mon_200.1bpp",    footprint_bottom
