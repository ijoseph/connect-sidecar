--
-- 
set IPAD_NAME to  "Isaac‚Äôs iPad"
-- Change the above line to the name of your iPad.
-- Note the likelihood of the *right* single quotation mark, `’`(Unicode Codepoint 2019) character being used for possession,
-- which you might want to copy and paste, as it's not the same as the non-slanted one on the keyboard,`'` (Unicode Codepoint 27).

on sidecar_connection(ipad_name)
	tell application "System Events"
		tell application process "System Settings"
			repeat until exists pop up button 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
				delay 0
			end repeat

			tell splitter group 1 of group 1 of window 1
				tell pop up button 1 of group 1 of group 2
					click
					delay 0.5
					set add_display_items to name of menu items of menu 1 as list
					#set add_display_items to item 1 of add_display_items
					log add_display_items
					set sel_item to 0
					set section_break to 0
					repeat with i from 1 to number of items in add_display_items
						if item i of add_display_items = missing value then
							set section_break to i
							exit repeat
						end if
					end repeat
					if section_break = 0 then
						set section_break to 1
					end if
					repeat with i from section_break to number of items in add_display_items
						if item i of add_display_items = ipad_name then
							set sel_item to i
							log sel_item
							exit repeat
						end if
					end repeat
					click menu item sel_item of menu 1
					return sel_item
				end tell
			end tell
		end tell
	end tell
end sidecar_connection

do shell script "/usr/bin/open file:///System/Library/PreferencePanes/Displays.prefPane/"
delay 1

sidecar_connection(IPAD_NAME)



