PlaySlowCry:
; A temporary and unsatisfactory sol.
; Used for lighthouse amph in OlivineLighthouse6F
; and miltank in Route39Barn
	ld a, [wScriptVar]
	ld d, a
	xor a
	ld e, a	
	call LoadCry
	jr c, .done

	ld hl, wCryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, -$140
	add hl, bc
	ld a, l
	ld [wCryPitch], a
	ld a, h
	ld [wCryPitch + 1], a
	ld hl, wCryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $60
	add hl, bc
	ld a, l
	ld [wCryLength], a
	ld a, h
	ld [wCryLength + 1], a
	farcall _PlayCry
	call WaitSFX

.done
	ret
