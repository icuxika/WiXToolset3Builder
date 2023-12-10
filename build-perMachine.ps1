$candlePath = Get-Command candle.exe | Select-Object -ExpandProperty Source
$lightPath = Get-Command light.exe | Select-Object -ExpandProperty Source

try {
    $productWxsFileName = "Product-perMachine.wxs"
    $applicationWxsFileName = "Application.wxs"
    $productWixobjFileName = "Product-perMachine.wixobj"
    $applicationWixobjFileName = "Application.wixobj"
    $msiFileName = "Product.msi"

    & "$candlePath" -dPlatform=x64 -arch x64 $productWxsFileName $applicationWxsFileName
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