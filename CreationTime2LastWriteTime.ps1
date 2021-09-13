# put [LastWriteTime] into [CreationTime] for each files.
# 指定したフォルダ内のすべてのファイルの [作成日時] を [更新日時] の値で上書きする。
# Google Photo へのアップロード時の日時判定が [作成日時] 依存、
# Google Backup を使用した同期時に [作成日時] が更新される現象への対処のために作成。

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
$v_lastwritetime = (Get-ItemProperty -Path $fi.FullName).LastWriteTime
Set-ItemProperty -Path $fi.FullName -Name CreationTime -Value $v_lastwritetime

Write-Output ($fi.FullName + "  :  " + $v_lastwritetime)
}

