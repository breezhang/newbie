<#
Just Demo 
PS Object Create ...
#>

#how to init PSobject
#step 1
$a=@{Name="Bree" ;Age="15"}
#step 2
$object = New-Object PSobject -Property $a

#how to Create Com Object
#Step you find ProgID
#dir  REGISTRY::HKEY_CLASSES_ROOT\CLSID -include PROGID -recurse | foreach {$_.GetValue("")}|Out-File g:\progid.txt
#Save One File you can seek
$progid = 'g:\progid.txt'
Get-Content $progid | ? {$_ -match "[\.]Application"}
$Excel= New-Object -ComObject Excel.Application










