clickX := 648     ; Set your click X
clickY := 827    ; Set your click Y
intervalSeconds := 0.8 ; How often to click

searchLeft := 0 ; Area to search for the image
searchTop := 0
searchRight := 1920
searchBottom := 1080

imagePath := "ivcropretry.png" ; Image to search for
imagePath2 := "teamupvcrop.png" ; Second image to search for 

global macroRunning := false

+:: ; Start macro
    if (macroRunning)
        return
    macroRunning := true
    SetTimer, ClickLoop, % intervalSeconds * 1000
return

-:: ; Stop manually
    macroRunning := false
    SetTimer, ClickLoop, Off
return

ClickLoop:
    if (!macroRunning)
        return

    ; Search for the image
    ImageSearch, foundX, foundY, searchLeft, searchTop, searchRight, searchBottom, 30 %imagePath%
    if (ErrorLevel = 0) {
        macroRunning := false
        SetTimer, ClickLoop, Off
        MsgBox, Found "found image 1" at %foundX%, %foundY%. Macro stopped.
        return
    }
     ; Search for image 2
    ImageSearch, foundX, foundY, searchLeft, searchTop, searchRight, searchBottom,30 %imagePath2%
    if (ErrorLevel = 0) {
        macroRunning := false
        SetTimer, ClickLoop, Off
        MsgBox, Found Image 2 at %foundX%, %foundY%. Macro stopped.
        return
    }

    ; Otherwise, click at desired coordinates
    Click, %clickX%, %clickY%
return
