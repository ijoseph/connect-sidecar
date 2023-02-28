set deviceName to "So and So’s iPad" -- Change this to the name of your iPad. Note the likelihood of the *right* single quotation mark, `’`(Unicode Codepoint 2019) character being used for possession, which you might want to copy and paste, as it's not the same as the non-slanted one on the keyboard,`'` (Unicode Codepoint 27).
do shell script "/usr/bin/open file:///System/Library/PreferencePanes/Displays.prefPane/"
delay 1
tell application "System Events"
	click pop up button 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Displays" of application process "System Settings"
	delay 1
	click menu item deviceName of menu 1 of pop up button 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Displays" of application process "System Settings"
end tell