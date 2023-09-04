#idea from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE
Clear-Host #clearing the console NOTE:If working in console and not in forms CAN NOT use PipeLine input
"Insert a string"
$string=Read-Host #reading the console input

#function for reversing the word
function ReverseWord($toReverse){
    $newString= New-Object System.String("") #new empty String

    #iterating trough string from last to first char
    for(($i=$toReverse.Length);($i -gt -1);($i--)){
        $newString=$newString.Insert($newString.Length,$toReverse[$i]) #making string by insertion of given char to the end of string each iteration
    }
    
    return $newString #retruning the new string
}

#call of the function
$newString=ReverseWord($string)

Write-Host $newString #writhe to the console