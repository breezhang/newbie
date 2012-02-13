function Get-CodeSnippet {
  
  Param(
[Parameter(Mandatory=$true)]
[string]$InitialDirectory,
[switch]$add
)

If($ExecutionContext.Host.name -notmatch "ISE Host$")
{
$response = Read-Host -Prompt "This script must run in Windows PowerShell ISE. <Y> to exit."
if($response -match "y") { Exit }
} #end if


Try
{
if(!$add)
{ notepad $openfileDialog.filename }
if($add)
{
Import-Module WPK
$ofd = New-OpenFileDialog
$ofd.InitialDirectory = $InitialDirectory
$ofd.Filter ="PowerShell Scripts (*.ps1;*.psm1)|*.ps1;*.psm1|All files (*.*)| *.*"
if ($ofd.ShowDialog())
{
   $content = Get-Content -Path $ofd.FileName -Encoding Ascii -Delimiter `r`n
   $psise.CurrentFile.Editor.InsertText($content) 
}

} #end if $add
} #end try
Catch [System.Exception]
{ "No file was selected." }
} #end function Get-CodeSnippet

