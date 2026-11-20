#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

CoordMode "Mouse", "Screen"

CornerSize := 3       ; NxN pixel target in the far top-left
IsTriggered := false  ; Prevents re-triggering until the mouse leaves the corner

SetTimer CheckHotCorner, 15  ; Fires once per Windows system tick (~64 Hz)

CheckHotCorner() {
    global IsTriggered
    MouseGetPos &MouseX, &MouseY

    if (MouseX >= 0 && MouseX <= CornerSize && MouseY >= 0 && MouseY <= CornerSize) {
        if (!IsTriggered && !WinActive("ahk_class XamlExplorerHostIslandWindow")) {
            Send "#{Tab}"
        }
        IsTriggered := true
    } else {
        IsTriggered := false
    }
}