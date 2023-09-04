#idea from https://ironscripter.us/a-powershell-warm-up-exercise/
#coded in PowerShell ISE
Clear-Host #clearing the console NOTE:If working in console and not in forms CAN NOT use PipeLine input
"Insert username and password"
$string=Read-Host #reading the console input

#spliting inputed string into two substrings and assigning them to two diffrent strings via index
$username=$string.Split(" ")[0];
$password=$string.Split(" ")[1];

$Text=$username,$password -join ':' #merging two strings into ine using char ':'
"Inputed : `"$Text`""

#actual encoding
$Bytes=[System.Text.Encoding]::UTF8.GetBytes($Text)
$EncodedTxt=[Convert]::ToBase64String($Bytes)

"Encoded text: $EncodedTxt"

$DecodedTxt=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($EncodedTxt))
Write-Host "DecodedTxt: $DecodedTxt" #write to console
