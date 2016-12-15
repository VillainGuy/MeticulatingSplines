SendMode Input
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
breakout=0

!r::

IfWinActive ahk_exe RocketLeague.exe 
{
Loop{
IfWinNotActive ahk_exe RocketLeague.exe
{
Break
} 
If (breakout = 1)
	{
	breakout=0
	Send {w up}
	Send {RShift up}
	Send {s up}
	Send {a up}
	Send {LShift up}
	ExitApp
	}
Looped = False

PlayGame:
IfWinNotActive ahk_exe RocketLeague.exe
{
Break
} 
CoordMode, Pixel, Window
PixelSearch, OutX, OutY, 3500, 1900, 3600, 2020, 0xFFFFFF, 0, Fast
If ErrorLevel = 0
{
Send {z}
}


Send {w down}
Send {RShift down}
Random, turnleftright, 1, 2
If (turnleftright = 1) 
{
turndir = d
}
Else If (turnleftright = 2) 
{
turndir = a
}

Turn:
IfWinNotActive ahk_exe RocketLeague.exe
{
Break
} 
If (breakout = 1)
	{
		breakout=0
		Send {w up}
		Send {RShift up}
		Send {s up}
		Send {a up}
		Send {LShift up}
		ExitApp
		break
	}
Random, turnwait, 52, 133
Random, turnwait2, 101, 500
Random, tinywait, 22, 66
Random, counterturnwait, 250, 565

If (turnwait = 69) or (turnwait = 77)
{
ToolTip, "RANDOM FLIP GOOOOO!", 1732, 174
ActionBatch(1)
Goto PlayGame
}
;ImageSearch OutX, OutY, 1830, 1495, 2070, 1620, *50 H:\Shadowplay Captures\Rocket League\Macro\TakumiNOS2.png
PixelSearch, OutX, OutY, 1875, 1455, 1950, 1520, 0x3BFF5A, 20, Fast

if ErrorLevel = 0
{
	ToolTip, "Center found in 1875-1950 w/ 20", 1732, 174
	Send {w down}
	Send {RShift down}
	Sleep, %counterturnwait%
	
	PreciseLoop:
Loop
{
	
	If (breakout = 1)
	{
		b=0
		break
	}
	Random, preciseturnwait, 42, 125
	PixelSearch, OutX, OutY, 1500, 1350, 2300, 1600, 0x3BFF5A, 20, Fast
	If ErrorLevel = 0
	{
	If OutX < 1850
	{
	turndir = a
	Break
	}
	Else If OutX > 2150
	{
	turndir = d
	Break
	}
	

	Else If ErrorLevel = 1
	{
	Goto Turn
	}
	
	PixelSearch, OutX, OutY, 1845, 1455, 1925, 1520, 0x3BFF5A, 20, Fast
	If ErrorLevel = 0
	{
	ToolTip, "Center found in 1845-1925 w/ 20", 1732, 174
	Send {w down}
	Sleep, %turnwait2%
	PixelSearch, OutX, OutY, 3480, 1790, 3500, 1820, 0x83EDFF, 20, Fast
	If ErrorLevel = 0
	{
	If (tinywait > 30)
	{
	ActionBatch(1)
	}
	}
	Else
	{
	Send {RShift down}
	}
	Send {w down}
	Sleep, %turnwait%

	PixelCheck:
	PixelSearch, OutX, OutY, 1845, 1455, 1925, 1520, 0x3BFF5A, 15, Fast
	If ErrorLevel = 0
	{
	ToolTip, "Center found in 1845-1925 w/ 15", 1732, 174
		Loop
		{
			If (breakout = 1)
			{
			breakout=0
			Send {w up}
			Send {RShift up}
			Send {s up}
			Send {a up}
			Send {LShift up}
			ExitApp
			break
			}
		PixelSearch, OutX, OutY, 1845, 1455, 1925, 1520, 0x3BFF5A, 15, Fast
		If ErrorLevel = 1
		{
		Break
		}
		Sleep, %turnwait2%
		}
	Goto PixelCheck
	}
	}
	Break
	}
	
	Else
	{
		Loop
		{
			If (breakout = 1)
			{
			breakout=0
			break
			}
			IfWinNotActive ahk_exe RocketLeague.exe
			{
			Break
			} 
		Send {w down}
		Send {%turndir% down}
		Sleep, %preciseturnwait%
		Send {%turndir% up}
		PixelSearch, OutX, OutY, 1845, 1455, 1925, 1520, 0x3BFF5A, 15, Fast
		If ErrorLevel = 0
		{
		ToolTip, "Center found in 1845-1925 w/ 15'nDuring tiny turn", 1732, 174
		Sleep, %preciseturnwait%
		Sleep, %tinywait%
		Break
		}
		PixelSearch, OutX, OutY, 1500, 1350, 2300, 1600, 0x3BFF5A, 20, Fast
		If ErrorLevel = 0
		{
			If OutX < 1850
			{
			turndir = a
			}
			Else If OutX > 2150
			{
			turndir = d
			}
		
		}
		Else If ErrorLevel = 1
		{
		Break
		}
		}
	}
}

}
else if ErrorLevel = 1
{
ToolTip, "Center not found in 1875-1950 - Wide Turn", 1732, 174
	Looped = True
	;ImageSearch OutX, OutY, 1830, 1495, 2070, 1620, *50 H:\Shadowplay Captures\Rocket League\Macro\TakumiNOS2.png
	PixelSearch, OutX, OutY, 1500, 1350, 2300, 1600, 0x3BFF5A, 25, Fast
	If ErrorLevel = 0
	{
	If OutX < 1850
	{
	turndir = a
	}
	Else If OutX > 2150
	{
	turndir = d
	}
	}
	Else If ErrorLevel = 1
	{
	tinywait = turnwait2
	Send {LShift down}
	Send {RShift down}
	}
	PixelSearch, OutX, OutY, 1875, 1455, 1950, 1520, 0x3BFF5A, 20, Fast
	If ErrorLevel = 1
	{
	Loop
	{
	ToolTip, "Wide Turn Until Centered", 1732, 174
		If (breakout = 1)
			{
			breakout=0
			Send {w up}
			Send {RShift up}
			Send {s up}
			Send {a up}
			Send {LShift up}
			ExitApp
			break
			}
	Send {w down}
	Send {%turndir% down}
	;Sleep, %turnwait2%
	;Send {LShift up}
	;Send {%turndir% up}
	;Sleep, %turnwait2%
	;Send {RShift up}
	PixelSearch, OutX, OutY, 1875, 1455, 1950, 1520, 0x3BFF5A, 20, Fast
	If ErrorLevel = 0
	{
	Send {%turndir% up}
	Send {RShift up}
	;Sleep, %turnwait2%
	Break
	}
	;goto Turn
	}
	}
}

If (breakout = 1)
			{
			Send {w up}
			Send {RShift up}
			Send {s up}
			Send {a up}
			Send {LShift up}
			breakout=0
			ExitApp
			break
			}
			

SkipTurn:
Random, chatterbox, 0, 10

If chatterbox = 3 
{
RandChat()
}

}












RandChat() 
{
Random, rando, 1, 4
Random, sleepo, 10, 100

Send {3}
Send {%rando%}

Sleep, %sleepo%

Send {4}
Send {%rando%}

Return
} 
 

ActionBatch(ByRef x) 
{
Random, randaction, 1, 5
Random, randsleep1, 70, 100
Random, randsleep2, 50, 1000
Random, randtinysleep, 41, 75
Random, randinput, 1, 2
If (randinput = 1)
{
inputrand = a
}
else if (randinput = 2)
{
inputrand = d
}


If (randaction = 1) Or (x = 1)
{
Send {a up}
Send {d up}
Send {m Down}
Sleep, %randtinysleep%
Send {m Up}
Sleep, %randsleep1%
Send {m Down}
Sleep, %randtinysleep%
Send {m up}
Sleep, %randsleep1%
Sleep, %randsleep1%
Sleep, %randsleep1%
Sleep, %randsleep1%
Sleep, %randsleep1%
Sleep, %randsleep1%
Sleep, %randsleep1%
Return
}
else if (randaction = 2) 
{
Send {RShift up}
Send {%inputrand% down}
Sleep, %randsleep2%
Send {%inputrand% up}
Send {RShift down}
Return
}
else if (randaction = 3) 
{
Send {%inputrand% down}
Sleep, %randsleep2%
Send {%inputrand% up}
Return
}
else if (randaction = 4) 
{
Send {RShift up}
Send {%inputrand% down}
Sleep, %randsleep2%
Send {%inputrand% up}

Send {m}
Sleep, %randsleep1%
Send {m}

Send {%inputrand% down}
Sleep, %randsleep2%
Send {%inputrand% up}

Send {RShift down}
Return
}
else if (randaction = 5)
{
Send {w up}
Send {RShift up}
Sleep, %randsleep1%
Send {LShift down}
Send {%inputrand% down}
Sleep, %randsleep1%
Send {LShift up}
Send {%inputrand% up}
Sleep, %randsleep2%
Send {w down}
Send {RShift down}
Return
}
Return




}
Return

}

Return


!x:: 
breakout := !breakout
Send {w up}
Send {RShift up}
Send {s up}
Send {a up}
Send {LShift up}
ExitApp

!+x:: 
breakout := !breakout
Send {w up}
Send {RShift up}
Send {s up}
Send {a up}
Send {LShift up}
ExitApp