#This should go to the %USERPROFILE%\Documents\WindowsPowerShell directory
function Set-Path {
    param([string]$x)
    $Env:Path+= ";" +  $x
    Write-Output $Env:Path
    $write = Read-Host 'Set PATH permanently ? (yes|no)'
    if ($write -eq "yes")
    {
        [Environment]::SetEnvironmentVariable("Path",$env:Path, [System.EnvironmentVariableTarget]::User)
        Write-Output 'PATH updated'
    }
}
