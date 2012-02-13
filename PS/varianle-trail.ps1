<#
.SYNOPSIS
   <A brief description of the script>
.DESCRIPTION
   <A detailed description of the script>
.PARAMETER <paramName>
   <Description of script parameter>
.EXAMPLE
   <An example of using the script>
#>
 
#if(Test-Path variable:\test) {del variable:\test}
  Clear-Host
 $test ="Hello world!"
 $item = New-Object System.Management.Automation.ValidateLengthAttribute -ArgumentList 4,64
 $temp = Get-Variable test
 $temp.Attributes.Add($item)
 
 #if(Test-Path variable:\email) {del variable:\email}
 $email = "masonzhang@gmail.com"
 $temp = Get-Variable email
 $pat = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b"
 $item = New-Object System.Management.Automation.ValidatePatternAttribute -ArgumentList $pat
 $temp.Attributes.Add($item)
 
 $a1, $a2 =1 , 2
 "$a1 $a2"
 
 function qping($ip) {
   ping.exe -w 100 -n 1 $ip
 }
 qping '163.com'
 
 function localdriver()
 {
    foreach($i in 67..90)
	{
	    if (Test-Path ([char]$i + ':')) 
		 {
		   [char]$i
		 }
	}
 }
 
$a = localdriver 

function prompt
{
  $curPos = $Host.ui.rawui.CursorPosition
  $newPos = $curPos
  $newPos.X+=60
  $Host.ui.rawui.CursorPosition = $newPos
  Write-Host ("{0:D} {0:T}" -f (Get-Date)) `
    -foregroundcolor Yellow
  $Host.ui.rawui.CursorPosition = $curPos
  Write-Host ("PS " + $(get-location) +">") `
    -nonewline -foregroundcolor Green
  " "
}
$global:CurrentUser = `
  [System.Security.Principal.WindowsIdentity]::GetCurrent()
function prompt
{
  $Host.ui.rawui.WindowTitle = "Line: " `
    + $Host.UI.RawUI.CursorPosition.Y + " " `
    + $CurrentUser.Name + " " + $Host.Name `
    + " " + $Host.Version
  Write-Host ("PS " + $(get-location) +">") `
    -nonewline -foregroundcolor Green
  return " "
}
#$certificate = Dir cert:\CurrentUser\My | 
#  Where-Object { $_.Subject -eq "CN=PowerShell Test Certificate" }
$certificate = Get-ChildItem cert:\CurrentUser\My| ? { $_.Subject -like "CN=Power*"}
$certificate