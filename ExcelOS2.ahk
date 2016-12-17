SendMode Input
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance, force
breakout=0

!r::

IfWinActive ahk_exe RocketLeague.exe 
{
Loop{
ToolTip, "LOOP RESTART", 1732, 174
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
ToolTip, "LOOP RESTART", 1732, 174
PlayGame:
IfWinNotActive ahk_exe RocketLeague.exe
{
Break
} 
CoordMode, Pixel, Window
PixelSearch, OutX, OutY, 3500, 1900, 3600, 2020, 0xFFFFFF, 20, Fast
If ErrorLevel = 0
{
Send {z}
}

ToolTip, "LOOP RESTART", 1732, 174
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


;ImageSearch OutX, OutY, 1830, 1495, 2070, 1620, *50 H:\Shadowplay Captures\Rocket League\Macro\TakumiNOS2.png
PixelSearch, OutX, OutY, 1850, 1400, 2100, 1600, 0x3BFF5A, 30, Fast

if ErrorLevel = 0
{
	ToolTip, "Center found in 1850-2000 w/ 20", 1732, 174
	Send {w down}
	Send {RShift down}
	Sleep, %turnwait%
	
	PreciseLoop:
Loop
{
	
	If (breakout = 1)
	{
		b=0
		break
	}
	Random, preciseturnwait, 42, 80
	PixelSearch, OutX, OutY, 1500, 1300, 2300, 1600, 0x3BFF5A, 30, Fast
	If ErrorLevel = 0
	{
	If OutX < 1850
	{
	turndir = a
	Break
	}
	Else If OutX > 1950
	{
	turndir = d
	Break
	}
	}

	Else If ErrorLevel = 1
	{
	Goto Turn
	}
	
	PixelSearch, OutX, OutY, 1900, 1400, 1930, 1600, 0x3BFF5A, 30, Fast
	If ErrorLevel = 0
	{
	ToolTip, "Center found in 1900-1930 w/ 20", 1732, 174
	Send {w down}
	Sleep, %turnwait2%
	PixelSearch, OutX, OutY, 3480, 1790, 3500, 1820, 0x83EDFF, 10, Fast
	If ErrorLevel = 0
	{
	If (tinywait > 50)
	{
	ActionBatch(1)
	Sleep, %turnwait%
	Sleep, %tinywait%
	}
	}
	Else
	{
	Send {RShift down}
	}
	Send {w down}
	Sleep, %turnwait%

	PixelCheck:
	PixelSearch, OutX, OutY, 1900, 1480, 1930, 1520, 0x3BFF5A, 30, Fast
	If ErrorLevel = 0
	{
	ToolTip, "Center found in 1900-1925 w/ 15", 1732, 174
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
		PixelSearch, OutX, OutY, 1900, 1480, 1930, 1520, 0x3BFF5A, 30, Fast
		If ErrorLevel = 1
		{
		Break
		}
		Sleep, %turnwait2%
		}
	;Goto PixelCheck
	Break
	}
	
	}
	Else
	{
		Loop
		{
		ToolTip, "TinyTurn Loop", 1732, 174
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
		PixelSearch, OutX, OutY, 1900, 1480, 1930, 1520, 0x3BFF5A, 30, Fast
		If ErrorLevel = 0
		{
		ToolTip, "Center found in 1900-1930 During tiny turn", 1732, 174
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
		PixelSearch, OutX, OutY, 1900, 1480, 1930, 1520, 0x3BFF5A, 30, Fast
		If ErrorLevel = 1
		{
		Break
		}
		Sleep, %turnwait2%
		}
		}
		PixelSearch, OutX, OutY, 1500, 1350, 2300, 1600, 0x3BFF5A, 30, Fast
		If ErrorLevel = 0
		{
			If OutX < 1850
			{
			turndir = a
			}
			Else If OutX > 1925
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
	PixelSearch, OutX, OutY, 1500, 1350, 2300, 1600, 0x3BFF5A, 30, Fast
	If ErrorLevel = 0
	{
	If OutX < 1850
	{
	turndir = a
	}
	Else If OutX > 1950
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
	PixelSearch, OutX, OutY, 1850, 1400, 2100, 1600, 0x3BFF5A, 30, Fast
	If ErrorLevel = 1
	{
	TimeToBreak := A_Sec + 4
	Loop
	{
	Random, slowdownturn, 0, 250
	Random, slowdownturnwait, 58, 145
	
	If slowdownturn = 55
	{
	ToolTip, "1-250 flip!", 1732, 174
	ActionBatch(1)
	Sleep, %turnwait2%
	Send {%turndir% down}
	Sleep, %slowdownturn%
	Sleep, %turnwait%
	Send {%turndir% up}
	Sleep, %slowdownturn%
	Sleep, %tinywait%
	TimeToBreak:= TimeToBreak + 2
	}
	
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
	PixelSearch, OutX, OutY, 1850, 1400, 2100, 1600, 0x3BFF5A, 30, Fast
	If (ErrorLevel = 0) Or (A_Sec >= TimeToBreak)
	{
	Send {%turndir% up}
	Send {RShift up}
	If turndir = a
	{
	Send {%turndir% up}
	Send {%turndir% up}
	Send {d down}
	Sleep, %turnwait%
	Send {d up}
	}
	Else If turndir = d
	{
	Send {%turndir% up}
	Send {%turndir% up}
	Send {a down}
	Sleep, %turnwait%
	Send {a up}
	}
	Break
	}
	If slowdownturn = 69 Or slowdownturn = 42 Or slowdownturn = 101
	{
	Send {w up}
	Send {%turndir% up}
	Send {s down}
	Sleep, %slowdownturnwait%
	Sleep, %slowdownturn%
	Send {s up}
	Send {w down}
	Send {%turndir% down}
	}
	PixelSearch, OutX, OutY, 1850, 1400, 2100, 1600, 0x3BFF5A, 30, Fast
	If (ErrorLevel = 0) Or (A_Sec >= TimeToBreak)
	{
	Send {%turndir% up}
	Send {RShift up}
	If turndir = a
	{
	Send {%turndir% up}
	Send {%turndir% up}
	Send {d down}
	Sleep, %turnwait%
	Send {d up}
	}
	Else If turndir = d
	{
	Send {%turndir% up}
	Send {%turndir% up}
	Send {a down}
	Sleep, %turnwait%
	Send {a up}
	}
	Break
	}
	;goto Turn
	}
	}
	Else If ErrorLevel = 0
	{
	Continue
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
Random, chatterbox, 0, 20

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