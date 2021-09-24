<# This connects SCCM Remote Viewer to multiple computers listed in C:\temp\computers.txt
Create and enter the computer names or IP addresses in C:\temp\computers.txt
Copy and paste the contents of this script into an elevated PowerShell terminal.
Script is dependent on CmRcViewer.exe residing in this path, C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\i386\CmRcViewer.exe
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


<# Notes: For a single computer we used, start-process '\\SharedDrive\Aric Galloso\SCCM_Remote\CmRcViewer.exe' DB-1234567
This script uses the local CmRcViewer.exe path instead of a UNC path to a shared folder.
#>

SCCM_RcViewer

