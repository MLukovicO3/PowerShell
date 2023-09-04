#idea from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE
#functions with pipeline
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
        #at the end of pipline print the word
        Write-Host $newWord
    }
}

#call of the function
Read-Host | ReverseWord-PipelineInput