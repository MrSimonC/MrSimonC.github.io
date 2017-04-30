# Background
It's amazed me how there's almost no completely free software to help you make IT training documents by simply clicking the mouse. Here is my method to gathering a folder of whole-screen screenshots by just clicking the mouse whilst performing a workflow. A benefit is that this will also only include one screen if you have a dual-monitor setup.

## Installation
We'll need 2 pieces of software to complete our setup, Greenshot and AutoHotKey.

### Greenshot
Firstly, go get and install the excellent, open source (free) [Greenshot](http://getgreenshot.org/). 

Once running, right go to "Preferences" (right click the task bar icon). Change:

* "General" tab: ensure 'Capture full screen' is linked to 'Ctrl + Prnt scrn' _(This should be the default)_.
* "Capture" tab: change 'Milliseconds to wait before capture' to 0. _(This enables context menus to be captured correctly)_
* "Output" tab: change the 'Storage location' to a folder of your choice. 
* "Destination" tab: untick "Select destination dynamically" and tick "Save directly" _(and I recommend you also tick "Copy to clipboard")_. 
* Press OK.

### AutoHotKey
We're now going to use AutoHotKey (again, open source (free)) to trigger this keyboard shortcut when the mouse is clicked. 

[Install AutoHotKey](http://ahkscript.org/) then create a new script with the following code:

```AutoHotKey
;===greenshot/psr alternative===
; Take screenshots (to a folder) when you windows+click. Assumes: Greenshot, Settings, Capture, change Milliseconds to wait before capture = 0
#~LButton::
	SendInput ^{PrintScreen}
Return

#~RButton::
	Sleep 200		;allow time for menus to appear
	SendInput ^{PrintScreen}
Return
```

Alternatively, just download my pre-made [software documentation.ahk](software_documentation.ahk) script.

## Usage
* Ensure greenshot is open and your AutoHotKey script is running (just double click the .ahk file).
* Go through your workflow but **hold the windows key whilst you click** each action.
* Holding the windows key whilst you right click will screenshot the screen with the right click context menu.
* When you have finished **each picture you take will end up in the "Output" folder** you specified earlier.

Go to your favourite Word processing program. For example microsoft word:

1. Insert, Picture _(shortcut in Word 2010: Alt+n+p)_
2. Select all pictures in your "output" folder, ensuring you shift+select them in the right order
3. Click insert

You now have all your screenshots in a document, full quality, no watermarks, etc. 

Enjoy.

## Extra: Resize Images
If you want your images to be resized (i.e. to a certain width) when output, then keep reading about the free [resize](making_software_documentation_resize.md) program I've made. 