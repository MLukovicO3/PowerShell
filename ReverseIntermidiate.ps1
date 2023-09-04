#idea from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE
Clear-Host  #clearing the console NOTE:If working in console and not in forms CAN NOT use PipeLine input
"Input a sentance"
$string=Read-Host #reading input from console

#reversing a single word function
function ReverseWord($word){
    $newWord= New-Object System.String("") #new empty string

    #iterating trough string from last to first char
    for(($i=$word.Length);($i -gt -1);($i--)){
        $newWord=$newWord.Insert($newWord.Length,$word[$i]) #making string by insertion of given char to the end of string each iteration
    }

    return $newWord #returnign the reversed word
}

#reversing the sentance function
function ReverseSentance($sentance){
    $newSentance= New-Object System.String("")
    $newWord= New-Object System.String("")
    $substrings = $sentance.Split(" ") #spliting the sentance into substrings

    foreach($s in $substrings){
        $newWord=ReverseWord($s) #calling the function to reverse the word
        $newSentance=$newSentance + $newWord +" " #creating a new sentance
    }

    Write-Host $newSentance #write to console
}

#calling the function that will reverse and print the inputed sentacne
ReverseSentance($string)
