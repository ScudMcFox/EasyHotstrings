#SingleInstance, Force
SetBatchLines, -1

; routines

    global configfile := "settings.ini"
  R_ReadConfig()
  { if (FileExist(configfile))
    { IniRead, lastmod, % configfile, Main, lastmod
    }
  }
  R_SaveConfig()
  { IniWrite, % lastmod, % configfile, Main, lastmod
  }
  
    global areload := 0
    FileGetTime, areload, % A_ScriptFullPath, M
  R_AutoReload()
  { FileGetTime, areload_check, % A_ScriptFullPath, M
    if (areload_check != areload)
    { areload := areload_check
      OnExit
      Reload
    }
  }

    global lastmod := ""
  R_CheckForNewHotstringFiles()
  { modtimes := Object()
    Loop, Files, % "hotstrings\*.txt"
      modtimes[A_LoopFileTimeModified] := A_LoopFileTimeModified
    lastmod_check := modtimes[modtimes.MaxIndex()]
    if (lastmod_check != lastmod)
    { lastmod := lastmod_check
      R_SaveConfig()
      R_RebuildHotStrings()
    }
  }
  
  R_RebuildHotStrings()
  { FileDelete, % "_hotstrings_new.ahk"
    NewScript := "; HOTSTRINGS`n`n"
    Loop, Files, % "hotstrings\*.txt"
    { NewScript .= ":o:." StrReplace(A_LoopFileName,".txt") "::`n"
      NewScript .= "R_PasteHotStringFile(""" A_LoopFilePath """)`n"
      NewScript .= "return`n`n"
    }
    FileAppend, % NewScript, % "_hotstrings_new.ahk"
    sleep 100
    FileMove, % "_hotstrings_new.ahk", % "_hotstrings.ahk", true
    OnExit
    Reload
  }

  R_PasteHotStringFile(hfile)
  { oldclp := clipboard
    FileRead, hstr, % hfile
    clipboard := hstr
    send ^v
    sleep 500
    clipboard := oldclp
  }
  
; program

  FileCreateDir, % "hotstrings"
  R_ReadConfig()

  loop
  { R_AutoReload()
    R_CheckForNewHotstringFiles()
    sleep 5000
  }

; hotstrings

#include *i _hotstrings.ahk
