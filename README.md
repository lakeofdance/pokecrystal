16-Bit Pokémon Crystal
======================

This is a hack of pokecrystal in which Pokémon species and moves are indexed by 16-bit numbers. The game is as close to the original as possible. As a base it uses mid_kid's excellent Optimised Crystal.

The Goals
---------

* 16-bit moves and species.
* Keep the regular gameplay and logic intact, don't remove working features.
* Change as little as possible.

The Current Status
------------------

Pokémon species are now 16-bit. Moves are still 8-bit.

Gameplay changes:
* ABC mode in the pokedex now shows blank spaces.
* Search mode in the pokedex always shows mons in old order, regardless of selected mode.
* Bug fixes, done because the function was being edited anyway:
	* Fixed Wildmons bug where it checks level instead of species.
	* Fixed bug where every transformed mon is a DITTO upon being caught.
	* Fixed Beat Up bug that can desynchronize link battles. Also fixed 'Beat Up works incorrectly with only one Pokémon in the party' bug.
	* Fixed fast ball bug that only checked 3 roam mons.
* The following Pokémon were added for testing. They don't appear in the game.
	* Yamask, Cofagrigus.

Engine changes:
* The flag arrays wPokedexCaught and wPokedexSeen now have a hardcoded length in wram (of 600 bits), rather than of NUM_POKEMON, in order that adding mons doesn't break saves.
* Pokedex modes draw directly from the data lists, without copying to wPokedexOrder. The only use of wPokedexOrder is for search mode. It's 256 bytes long, meaning the max number of search mons that can be displayed is 128 (defined by NUM_SEARCH_MONS).
* NUM_DEX_MONS is the length of the pokedex data lists and is defined by NUM_POKEMON minus #dead space mons (EGG, CANCEL, etc.) 

Bugs:
* Link and mystery gift don't work. 
* Printing can crash the game.

Future improvements:
* 16-bit moves.
