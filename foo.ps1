function CheckCommand() {
    param(
        [Parameter(Mandatory)]
        [string] $cmd,
        [Parameter(Mandatory)]
        [string] $description
    )

    if (! (Get-Command $cmd -errorAction SilentlyContinue)) {
        Write-Host "Required dep `"$description`" is not installed"
        Exit 1
    }
}

function CheckRequirements() {
    CheckCommand "gcc" "MingW CC"
    CheckCommand "candle" "WiX Toolset"
    CheckCommand "go" "Golang"
}


# Pre-set to standard locations in-case build env does not refresh paths
$Env:Path="$Env:Path;C:\Program Files (x86)\WiX Toolset v3.14\bin;C:\ProgramData\chocolatey\lib\mingw\tools\install\mingw64\bin;;C:\Program Files\Go\bin"

CheckRequirements
