# put [CreationTime] into [LastWriteTime] for each files.
# 指定したフォルダ内のすべてのファイルの [更新日時] を [作成日時] の値で上書きする。
# Google Photo へのアップロード時の日時判定が [更新日時] 依存?
# Google Backup を使用した同期時に [更新日時] が更新される現象への対処のために作成。

Param(
    [String]$Dir
)

if ( [string]::IsNullOrEmpty($Dir) ) {
    Write-Output "need: -Path <path of the target directory>"
    exit
}

$files = (Get-ChildItem -Path $Dir)

foreach ($fi in $files){
# Write-Output $fi.CreationTime
$v_creationtime = (Get-ItemProperty -Path $fi.FullName).CreationTime
Set-ItemProperty -Path $fi.FullName -Name LastWriteTime -Value $v_creationtime

Write-Output ($fi.FullName + "  :  " + $v_creationtime)
}

