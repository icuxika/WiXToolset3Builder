$candlePath = Get-Command candle.exe | Select-Object -ExpandProperty Source
$lightPath = Get-Command light.exe | Select-Object -ExpandProperty Source

$majorVersion = "1"
$minorVersion = "0"
$patchVersion = "0"

try {
    $productWxsFileName = "Product-perUser.wxs"
    $applicationWxsFileName = "Application.wxs"
    $productWixobjFileName = "Product-perUser.wixobj"
    $applicationWixobjFileName = "Application.wixobj"
    $msiFileName = "Product.msi"

    $applicationName = "ComposeMultiplatformProject"
    $startupProgramName = "ComposeMultiplatformProject"
    $manufacturer = "My Manufacturer Name"

    & "$candlePath" -dApplicationName="$applicationName" -dStartupProgramName="$startupProgramName" -dManufacturer="$manufacturer" -dMajorVersion="$majorVersion" -dMinorVersion="$minorVersion" -dPatchVersion="$patchVersion" -dPlatform=x64 -arch x64 $productWxsFileName $applicationWxsFileName
    & "$lightPath" -ext WixUIExtension -cultures:zh-CN -sice:ICE38 -sice:ICE64 -sice:ICE91 $productWixobjFileName $applicationWixobjFileName -out $msiFileName
}
catch {
    Write-Error $_
    exit 1
}
finally {
    Remove-Item Product-perUser.wixobj
    Remove-Item Application.wixobj
    Remove-Item Product.wixpdb
}