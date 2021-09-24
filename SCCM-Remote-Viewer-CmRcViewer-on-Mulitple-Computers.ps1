<# This connects SCCM Remote Viewer to multiple computers listed in C:\temp\computers.txt
Create and enter the computer names or IP address's in C:\temp\computers.txt
Created by Aric Galloso, 9/24/2021
#>


Function SCCM_RcViewer
{

$computers = GC C:\temp\computers.txt
Foreach($Computer in $Computers){
	IF((test-connection -ComputerName $Computer -Quiet) -eq $True){
		start-process 'C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\i386\CmRcViewer.exe' $Computer}
ELSE{Write-Host "Could Not Connect to $computer"
}}}

SCCM_RcViewer

<# Notes: For a single computer we used, start-process '\\SharedDrive\Aric Galloso\SCCM_Remote\CmRcViewer.exe' ComputerName
This script uses the local CmRcViewer.exe path instead of a UNC path to a shared folder.
#>


