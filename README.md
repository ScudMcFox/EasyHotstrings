# Easy AutoHotStrings
AutoHotkey v1 - Easy Auto-HotString-Manager

Install Instructions:
1. create a folder on your drive. for example: "C:\AHK\SMF AutoHotStrings"
2. copy/create the "SMF AutoHotStrings.ahk" into the new created folder from instruction 1.
3. run the "SMF AutoHotStrings.ahk" script file.
4. info: the script creates a subfolder named "hotstrings".

Create a HotString (example here "help"):
1. open the subfolder "hotstrings".
2. create a ".txt" file. for example "help.txt".
3. edit this "help.txt" file and put some text into it. example: "this is my first hostring help".
4. save the file.
5. info: you created your first hotstring with this data. the script is reloading itself and your hotstring is ready.

How to use the "help"-HotString now:
1. you can use it anywhere but for an easy test, open NotePad.
2. type ".help" and hit {spacebar} or {enter}.
3. the text ".help" is instantly replaced with the text from your help.txt file.

How to add/use more HotStrings:
1. follow the instructions from "Create a HotString" but with a different filename.txt
2. the filename you choose is the trigger for the HotString.
3. if the filename is set to "hello.txt", the HotString would be ".hello" and inserts the content of hello.txt
4. if the filename is set to "apples.txt", the HotString would be ".apples".
