-- Get the currennt working directory
set currentDir to do shell script "pwd"

-- Path to the .env file in the current directory
set envFilePath to currentDir & "/.env"

-- Command to source the .env file and set:
-- >> path to the Python script to execute 
-- >> path to the Python interpreter on the machine
set shellCommandToGetPythonInterpreterPath to "source " & quoted form of envFilePath & "; echo $PYTHON_INTERPRETER_PATH" 
set pythonInterpreter to do shell script shellCommandToGetPythonInterpreterPath
set pythonScriptPath to currentDir & "/" & "replace_clipboard_text.py"

-- Get the current contents of the clipboard
set clipboardContents to the clipboard as text

-- Execute the Python script and pass the clipboard contents
-- set modifiedContents to do shell script "echo " & quoted form of clipboardContents & quoted form of pythonInterpreter & pythonScriptPath
log clipboardContents
set shellCommand to quoted form of pythonInterpreter & " " & quoted form of pythonScriptPath & " " & quoted form of clipboardContents
set modifiedContents to do shell script shellCommand

-- Update the clipboard
set the clipboard to modifiedContents

-- Optional: Automatically paste the modified content into the third-party app
-- tell application "System Events"
-- 	keystroke "v" using {command down}
-- end tell