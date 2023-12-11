$candlePath = Get-Command candle.exe | Select-Object -ExpandProperty Source
$lightPath = Get-Command light.exe | Select-Object -ExpandProperty Source

try {
    $productWxsFileName = "Product-perUser.wxs"
    $applicationWxsFileName = "Application.wxs"
    $productWixobjFileName = "Product-perUser.wixobj"
    $applicationWixobjFileName = "Application.wixobj"
    $msiFileName = "Product.msi"

    & "$candlePath" -dApplicationName="ComposeMultiplatformProject" -dstartupProgramName="ComposeMultiplatformProject" -dPlatform=x64 -arch x64 $productWxsFileName $applicationWxsFileName
    & "$lightPath" -ext WixUIExtension -cultures:zh-CN -sice:ICE91 $productWixobjFileName $applicationWixobjFileName -out $msiFileName
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