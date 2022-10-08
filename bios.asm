;###############################################################################
; BIOS library
;###############################################################################
	module BIOS
;===============================================================================
; constants and calls
;===============================================================================
dcompr	equ	020h	; de,hl comparison
enaslt	equ	024h	; make specified slot available
msxver	equ	02Dh	; MSX version (unofficial)
disscr	equ	041h	; screen off
enascr	equ	044h	; screen on
wrtvdp	equ	047h	; writes in a VDP register
wrtvrm	equ	04Dh	; write VRAM
setwrt	equ	053h	; set write VRAM
filvrm	equ	056h	; fill VRAM
ldirvm	equ	05Ch	; ldir VRAM
chgmod	equ	05Fh	; change graphic mode
chsns	equ	09Ch	; tests the status of the keyboard buffer
chget	equ	09Fh	; one character input (waiting)
chput	equ	0A2h	; displays one character
gtstck	equ	0D5h	; joystick input
gttrig	equ	0D8h	; trigger input
rslreg	equ	138h	; read the basic slot selection	register

;===============================================================================
; system variables and work area
;===============================================================================
;-------------------------------------------------------------------------------
; MSX1
;-------------------------------------------------------------------------------
linl40	equ	0F3AEh	; nombre de caractère par ligne en SCREEN0
txtnam	equ	0F3B3h	; name table SC2
txtcol	equ	0F3B5h	; color table SC2
txtcgp	equ	0F3B7h	; pattern table SC2
txtatr	equ	0F3B9h	; sprite attribute table SC2
txtpat	equ	0F3BBh	; sprite patterns table SC2
cliksw	equ	0F3DBh	; clic clavier
rg0sav	equ	0F3DFh	; registre R#0 VDP
forclr	equ	0F3E9h	; couleur d'écriture
bakclr	equ	0F3EAh	; couleur de fond
bdrclr	equ	0F3EBh	; couleur de bordure
getpnt	equ	0F3FAh
putpnt	equ	0F3F8h
cs120	equ	0F3FCh	; zone utilisable dans system variables (F3FCh-F921h: 1318 bytes)
voicaq	equ	0F975h	; adresse de base des 384 octets de queues PLAY
newkey	equ	0FBE5h	; matrice des touches pressées
scrmod	equ	0FCAFh	; screen mode

; bit correspondence for a European Keyboard Layout:
; NEWKEY+0  = 7	     6	    5	   4	  3	 2	1      0
; NEWKEY+1  = ;	     ]	    [	   \	  =	 -	9      8
; NEWKEY+2  = B	     A	  ACCENT   /	  .	 ,	`      '
; NEWKEY+3  = J	     I	    H	   G	  F	 E	D      C
; NEWKEY+4  = R	     Q	    P	   O	  N	 M	L      K
; NEWKEY+5  = Z	     Y	    X	   W	  V	 U	T      S
; NEWKEY+6  = F3     F2	    F1	  CODE	 CAPS	GRPH   CTRL  SHIFT
; NEWKEY+7  = RET    SEL    BS	  STOP	 TAB	ESC    F5     F4
; NEWKEY+8  = RIGHT  DOWN   UP	  LEFT	 DEL	INS    HOME  SPACE
; NEWKEY+9  = 4	     3	    2	   1	  0	 /	+      *
; NEWKEY+10 = .	     ,	    -	   9	  8	 7	6      5
; https://www.msx.org/wiki/System_variables_and_work_area

keybuf	equ	0FBF0h	; buffer clavier
himem	equ	0FC4Ah	; adresse mémoire maxi
jiffy	equ	0FC9Eh	; compteur jiffy
exptbl	equ	0FCC1h	; slot address of extended ROM

;-------------------------------------------------------------------------------
; MSX2
;-------------------------------------------------------------------------------
rg8sav	equ	0FFE7h	; registre R#8 VDP

;===============================================================================
; hooks
;===============================================================================
h_keyi	equ	0FD9Ah
h_timi	equ	0FD9Fh

	endmodule BIOS