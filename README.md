16-Bit Pokémon Crystal
======================

This is a hack of pokecrystal in which pokémon species and moves are indexed by 16-bit numbers. The game is as close to the original as possible. As a base it uses mid_kid's excellent Optimised Crystal.

The Goals
---------

* 16-bit moves and species.
* Keep the regular gameplay and logic intact, don't remove working features.
* Change as little as possible.

The Current Status
------------------

Pokémon species are now 16-bit. Moves are still 8-bit.

The following pokémon were added for testing. They don't appear in the game.
* Yamask, Cofagrigus.
* Froakie, Frogadier, Greninja.

Thus the game contains 256 pokémon species in total. There are also 250 'placeholder' pokémon in the code, giving a total of 506 pokémon which already have allocated space. The theoretical max is of course much higher, but adding more than 506 might involve moving some stuff around.

Gameplay changes:
* ABC mode in the pokédex now shows blank spaces.
* Search mode in the pokédex always shows mons in old order, regardless of selected mode.
* Bug fixes, done because the function was being edited anyway:
	* Fixed Wildmons bug where it checks level instead of species.
	* Fixed bug where every transformed pokémon is a DITTO upon being caught.
	* Fixed Beat Up bug that can desynchronize link battles. Also fixed 'Beat Up works incorrectly with only one pokémon in the party' bug.
	* Fixed fast ball bug that only checked 3 flee mons.

Engine changes:
* The flag arrays wPokedexCaught and wPokedexSeen now have a hardcoded length in wram (of 600 bits), rather than of NUM_POKEMON, in order that adding mons doesn't break saves.
* Pokédex modes draw directly from the data lists, without copying to wPokedexOrder. The only use of wPokedexOrder is for search mode. It's 256 bytes long, meaning the max number of search mons that can be displayed is 128 (defined by NUM_SEARCH_MONS).
* NUM_DEX_MONS is the length of the pokédex data lists and is defined by NUM_POKEMON minus #dead space mons (EGG, CANCEL, etc.) 
* FixPicBank is no longer used. Pic banks can go anywhere.
* Mon base data is split between 2 banks.

Bugs:
* Link and mystery gift don't work. 
* Printing can crash the game.
* All vanilla bugs not mentioned in 'Gameplay changes'.

Future improvements:
* 16-bit moves.
* Uncouple pokémon dex number from position in constant list.
