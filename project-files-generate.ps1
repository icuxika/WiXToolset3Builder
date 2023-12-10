$heatPath = Get-Command heat.exe | Select-Object -ExpandProperty Source

try {
    $sourceDir = "SourceDir"
    $directoryName = "APPLICATIONROOTDIRECTORY"
    $wixFileName = "Application.wxs"

    & "$heatPath" dir $sourceDir -cg Package -gg -srd -sfrag -template:fragment -dr $directoryName -out $wixFileName
}
catch {
    Write-Error $_
    exit 1
}
finally {
}