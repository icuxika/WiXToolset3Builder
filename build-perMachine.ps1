$candlePath = Get-Command candle.exe | Select-Object -ExpandProperty Source
$lightPath = Get-Command light.exe | Select-Object -ExpandProperty Source

$majorVersion = "1"
$minorVersion = "0"
$patchVersion = "0"

try {
    $productWxsFileName = "Product-perMachine.wxs"
    $applicationWxsFileName = "Application.wxs"
    $productWixobjFileName = "Product-perMachine.wixobj"
    $applicationWixobjFileName = "Application.wixobj"
    $msiFileName = "Product.msi"

    $applicationName = "ComposeMultiplatformProject"
    $startupProgramName = "ComposeMultiplatformProject"
    $manufacturer = "My Manufacturer Name"

    & "$candlePath" -dApplicationName="$applicationName" -dstartupProgramName="$startupProgramName" -dManufacturer="$manufacturer" -dMajorVersion="$majorVersion" -dMinorVersion="$minorVersion" -dPatchVersion="$patchVersion" -dPlatform=x64 -arch x64 $productWxsFileName $applicationWxsFileName
    & "$lightPath" -ext WixUIExtension -cultures:zh-CN $productWixobjFileName $applicationWixobjFileName -out $msiFileName
}
catch {
    Write-Error $_
    exit 1
}
finally {
    Remove-Item Product-perMachine.wixobj
    Remove-Item Application.wixobj
    Remove-Item Product.wixpdb
}