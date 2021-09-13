# put [LastWriteTime] into [CreationTime] for each files.

Param(
    [String]$Dir
)

if ( [string]::IsNullOrEmpty($Dir) ) {
    Write-Output "need: -Path <path of the target directory>"
    exit
}

$files = (Get-ChildItem -Path $Dir)

foreach ($fi in $files){
# Write-Output $fi.LastWriteTime
$v_lastwritetime = (Get-ItemProperty -Path $fi).LastWriteTime
Set-ItemProperty -Path $fi -Name CreationTime -Value $v_lastwritetime

Write-Output ($fi.Name + "  :  " + $v_lastwritetime)
}

