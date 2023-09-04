#idea from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE
Clear-Host #clearing the console NOTE:If working in console and not in forms CAN NOT use PipeLine input
"Insert a string"
$string=Read-Host #reading the console input
#making a new empty String
$newString=New-Object System.String("")

#iterating trough string from last to first char
for(($i=$string.Length);($i -gt -1);($i--)){
    $newString=$newString.Insert($newString.Length,$string[$i]) #making string by insertion of given char to the end of string each iteration
}

Write-Host $newString #writing into console