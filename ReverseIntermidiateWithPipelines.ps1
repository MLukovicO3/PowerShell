#idea from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE

#function for reversing the word using pipeline input
function ReverseWord-PipelineInput{
    param(
        #naming a parameter and defining its type
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]
        $word
    )

    begin{
        #initialization of needed variables
        $newWord=[System.String]::new("");
    }

    process{
        #reversing the word
        for(($i=$word.Length);($i -gt -1);($i--)){
            $newWord=$newWord.Insert($newWord.Length,$word[$i])
        }
    }

    end{
        #at the end of pipline retutn the word
        return $newWord
    }
}

#function for reversing the sentance using pipeline input
function ReverseSentance-PiplineInput{
    param(
        #naming the parameter
        [Parameter(Mandatory,ValueFromPipeline)]
        [string]
        $sentance
    )

    begin{
        #initialization
        $newSentance=[System.String]::new(""); #new empty string
        $newWord=[System.String]::new("");
        $words=[System.Collections.ArrayList]::new(); #new arraylist
    }

    process{
        #splting the words wrom pipeline input into an ArrayList
        $words=$sentance.Split(" ");
        #reversing each word from sentance and adding it to a new sentance
        foreach($s in $words){
            $newWord = $s | ReverseWord-PipelineInput #calling reverse word function using pipeline input
            $newSentance= $newSentance + $newWord + " " #making a new sentance
        }
    }

    end{
        Write-Host $newSentance #write to console
    }
}

Read-Host | ReverseSentance-PiplineInput #calling the reverse sentance function that will take the input from console and print it reversed