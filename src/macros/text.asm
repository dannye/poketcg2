DEF text EQUS "db TX_HALFWIDTH, "
DEF line EQUS "db TX_LINE, "
DEF done EQUS "db TX_END"

DEF half2full EQUS "db TX_HALF2FULL"

MACRO _textfw
	REPT _NARG
		DEF str_len = STRLEN(\1)
		IF str_len > 0
			IF !STRCMP(STRSLICE(\1, 0, 1), "<") && str_len > 1
				db \1
			ELIF STRCMP(\1, "[相手]") == 0
				db "FW_7a", "FW_7b", "FW_7c"
			ELIF STRCMP(\1, "[自分]") == 0
				db "FW_7d", "FW_7e", "FW_7f"
			ELSE
				FOR i, 0, str_len
					REDEF char EQUS STRSLICE(\1, i, i+1)
					IF INCHARMAP("FWK_{char}")
						IF cur_set != TX_KATAKANA
							DEF cur_set = TX_KATAKANA
							db cur_set
						ENDC
						db "FWK_{char}"
					ELIF INCHARMAP("FWH_{char}")
						IF cur_set != TX_HIRAGANA
							DEF cur_set = TX_HIRAGANA
							db cur_set
						ENDC
						db "FWH_{char}"
					ELSE
						db "FW_{char}"
					ENDC
				ENDR
			ENDC
		ENDC
		SHIFT
	ENDR
ENDM

MACRO textfw
	DEF cur_set = TX_KATAKANA
	_textfw \#
ENDM

MACRO linefw
	db TX_LINE
	_textfw \#
ENDM

MACRO katakana
	DEF cur_set = TX_KATAKANA
	db TX_KATAKANA
	_textfw \#
ENDM

MACRO hiragana
	DEF cur_set = TX_HIRAGANA
	db TX_HIRAGANA
	_textfw \#
ENDM

MACRO ldfw
	PUSHO
	OPT Wno-obsolete
	REDEF char EQUS \2
	ld \1, "FW_{char}"
	POPO
ENDM
