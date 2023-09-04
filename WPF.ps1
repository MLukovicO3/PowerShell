#idea taken from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE
Clear-Host #clearing the console NOTE:If working in console and not in forms CAN NOT use PipeLine input

#function for encoding the given text
function Encode{
    param(
        #naming a parameter and defining its type
        [Parameter(Mandatory,ValueFromPipeLine)]
        [string]
        $text
    )

    begin{
        #initialization of needed variables
        $encodedTxt=[System.String]::new("") #new empty String
    }

    process{
        #actual encoding
        $Bytes=[System.Text.Encoding]::UTF8.GetBytes($text)
        $encodedTxt=[Convert]::ToBase64String($Bytes)
    }

    end{
       #change text of output label in form to encoded text
       $outputLbl.Text=$encodedTxt
    }
}

#function for decoding the given text
function Decode{
    param(
        [Parameter(Mandatory,ValueFromPipeLine)]
        [string]
        $text
    )

    begin{
        $decodedTxt=[System.String]::new("")
    }

    process{
        #actual decoding
        $decodedTxt=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($text))
    }

    end{
        $outputLbl.Text=$decodedTxt
    }
}

#function for reversing the inputed sentance with chaing uppercase and lowercase letters
function Reverse{
    param(
        [Parameter(Mandatory,ValueFromPipeLine)]
        [string]
        $text
    )

    begin{
        $reversedTxt=New-Object System.String("")
        $words=New-Object System.Collections.ArrayList #new ArrayList
    }

    process{
        $words=$text.Split(" "); #splitting the given text into substrings and placing them into ArrayList

        #going trough every string in substrings
        foreach($word in $words){
            $reversedWord = New-Object System.String("")
            for(($i = $word.Length);($i -gt -1);($i--)){
                #cheking for lowercase letters
                if($word[$i] -cmatch "^[a-z]*$"){
                    $reversedWord = $reversedWord.Insert($reversedWord.Length,$word[$i].toString().toUpper())#switching to uppercase while adding the char at the end
                }
                else{
                    $reversedWord = $reversedWord.Insert($reversedWord.Length,$word[$i].toString().toLower())#switching to lowercase while adding the char at the end
                }
            }
            
            $reversedTxt = $reversedTxt + $reversedWord +" " #making a reversed sentance
        }
    }

    end{
        $outputLbl.Text = $reversedTxt #change the text of output label to reversed text
    }
}

#form initialization
[reflection.assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$basicForm = [System.Windows.Forms.Form]::new()
$basicForm.Width = "280"

#making the form not resizeable
$basicForm.MinimumSize = New-Object System.Drawing.Size(280,280)
$basicForm.MaximumSize = New-Object System.Drawing.Size(280,280)

#layout initialization
$TableLayout = New-Object System.Windows.Forms.TableLayoutPanel
$TableLayout.Dock="Fill"
$TableLayout.RowCount = 3
$TableLayout.ColumnCount=3

#elements initialization
$inputTxtBox = New-Object System.Windows.Forms.TextBox
$encodeBttn = New-Object System.Windows.Forms.Button
$decodeBttn =  New-Object System.Windows.Forms.Button
$reverseBttn = New-Object System.Windows.Forms.Button
$outputLbl = New-Object System.Windows.Forms.Label

$encodeBttn.Text="Encode"
$decodeBttn.Text="Decode"
$reverseBttn.Text="Reverse"
$outputLbl.Text="Output"

$outputLbl.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$outputLbl.Margin= "0,20,0,0"
$inputTxtBox.Dock="Fill"
$reverseBttn.Dock="Fill"

#setting up the layout
$TableLayout.Controls.Add($inputTxtBox,0,0) #[System.Windows.Forms.TableLayoutPanel].Controls.Add([System.Windows.Forms.Contorl],column,row)
$TableLayout.SetColumnSpan($inputTxtBox,3)  #NOTE:Columns and rows are counted by index so 0 is the 1st, 1 is 2nd,etc.
$TableLayout.Controls.Add($encodeBttn,0,1)
$TableLayout.Controls.Add($reverseBttn,1,1)
$TableLayout.Controls.Add($decodeBttn,2,1)
$TableLayout.Controls.Add($outputLbl,1,2)

#adding elements with layout to form
$basicForm.Controls.Add($TableLayout)

#setting up actions
$encode = { $inputTxtBox.Text | Encode }
$decode = { $inputTxtBox.Text | Decode }
$reverse = { $inputTxtBox.Text | Reverse }

#adding evenets
$encodeBttn.Add_Click($encode)
$decodeBttn.Add_Click($decode)
$reverseBttn.Add_Click($reverse)

#show the form
$basicForm.ShowDialog()
