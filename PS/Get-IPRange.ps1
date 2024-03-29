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

function New-IPRange($start ,$end){
   # created by Dr. Tobias Weltner, MVP PowerShell
   $ip1=([System.Net.IPAddress]$start).GetAddressBytes()
   [Array]::Reverse($ip1)
   $ip1=([System.Net.IPAddress]($ip1 -join '.')).Address
   
    $ip2=([System.Net.IPAddress]$end).GetAddressBytes()
   [Array]::Reverse($ip2)
   $ip2=([System.Net.IPAddress]($ip2 -join '.')).Address
   for($x=$ip1;$x -le $ip2;$x++){
    $ip =([System.Net.IPAddress]$x).GetAddressBytes()
	[Array]::Reverse($ip)
	$ip -join '.'
   }
}
New-IPRange 192.168.1.1 192.168.1.100
