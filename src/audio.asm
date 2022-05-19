INCLUDE "macros.asm"
INCLUDE "constants.asm"

SECTION "Audio 1", ROMX
INCLUDE "audio/music1.asm"

SECTION "Audio 2", ROMX[$5442], BANK[$78]
INCLUDE "audio/music2_headers.asm"
INCLUDE "audio/music/dueltheme1.asm"
INCLUDE "audio/music/dueltheme2.asm"
INCLUDE "audio/music/dueltheme3.asm"
INCLUDE "audio/music/pausemenu.asm"
INCLUDE "audio/music/pcmainmenu.asm"
INCLUDE "audio/music/deckmachine.asm"
INCLUDE "audio/music/cardpop.asm"
INCLUDE "audio/music/overworld.asm"
INCLUDE "audio/music/song27.asm"
	ds $149

SECTION "Audio 3", ROMX[$5442], BANK[$79]
INCLUDE "audio/music3_headers.asm"
INCLUDE "audio/music/challengehall.asm"
INCLUDE "audio/music/club1.asm"
INCLUDE "audio/music/pokemondome.asm"
INCLUDE "audio/music/club3.asm"
INCLUDE "audio/music/ronald.asm"
INCLUDE "audio/music/imakuni.asm"
INCLUDE "audio/music/hallofhonor.asm"
INCLUDE "audio/music/song12.asm"
INCLUDE "audio/music/gamecorner.asm"
INCLUDE "audio/music/grblimp.asm"
	ds $2a

SECTION "Audio 4", ROMX[$5442], BANK[$7a]
INCLUDE "audio/music4_headers.asm"
INCLUDE "audio/music/titlescreen.asm"
INCLUDE "audio/music/herecomesgr.asm"
INCLUDE "audio/music/groverworld.asm"
INCLUDE "audio/music/song3b.asm"
INCLUDE "audio/music/matchstart1.asm"
INCLUDE "audio/music/matchstart2.asm"
INCLUDE "audio/music/matchstart3.asm"
INCLUDE "audio/music/matchvictory.asm"
INCLUDE "audio/music/matchloss.asm"
INCLUDE "audio/music/matchdraw.asm"
INCLUDE "audio/music/unused2e.asm"
INCLUDE "audio/music/boosterpack.asm"
INCLUDE "audio/music/medal.asm"
INCLUDE "audio/music/unused31.asm"
INCLUDE "audio/music/ditty1.asm"
INCLUDE "audio/music/ditty2.asm"
INCLUDE "audio/music/ditty3.asm"
INCLUDE "audio/music/ditty4.asm"
INCLUDE "audio/music/ditty5.asm"
	ds $c2

SECTION "Audio 5", ROMX[$5442], BANK[$7b]
INCLUDE "audio/music5_headers.asm"
INCLUDE "audio/music/fort1.asm"
INCLUDE "audio/music/fort2.asm"
INCLUDE "audio/music/fort3.asm"
INCLUDE "audio/music/grdueltheme2.asm"
	ds $7

SECTION "Audio 6", ROMX[$5442], BANK[$7c]
INCLUDE "audio/music6_headers.asm"
INCLUDE "audio/music/fort4.asm"
INCLUDE "audio/music/grcastle.asm"
INCLUDE "audio/music/grchallengecup.asm"
INCLUDE "audio/music/imakuni2.asm"
	ds $c0

SECTION "Audio 7", ROMX[$5442], BANK[$7d]
INCLUDE "audio/music7_headers.asm"
INCLUDE "audio/music/club2.asm"
INCLUDE "audio/music/grdueltheme1.asm"
INCLUDE "audio/music/grdueltheme3.asm"
INCLUDE "audio/music/ditty6.asm"
	ds $7c5
