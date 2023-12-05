## Apple USB and Mobile Device Ethernet drivers installer!
## Please report any issues at GitHub: https://github.com/NelloKudo/Apple-Mobile-Drivers-Installer

## Download links for Apple USB Drivers and Apple Mobile Ethernet USB Drivers respectively.
## All of these are downloaded from Microsoft's Update Catalog, which you can browse yourself at here: https://www.catalog.update.microsoft.com/

$AppleDri1 = "https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2020/11/01d96dfd-2f6f-46f7-8bc3-fd82088996d2_a31ff7000e504855b3fa124bf27b3fe5bc4d0893.cab"
$AppleDri2 = "https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/11/netaapl_7503681835e08ce761c52858949731761e1fa5a1.cab"

Write-Host ""
Write-Host -ForegroundColor Cyan "Welcome to Apple USB and Mobile Device Ethernet drivers installer!!"
Write-Host ""

## Checking if the script is being run as admin..
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole('Administrators')) {
    Write-Host -ForegroundColor Yellow "This script requires administrative privileges!"
    Write-Host -ForegroundColor Yellow "Please run the script as an administrator if you want to install drivers."
    pause
    exit 1
}

## Preparing the system to actually download drivers..
$destinationFolder = [System.IO.Path]::Combine($env:TEMP, "AppleDriTemp")
if (-not (Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}


try {
    ## Downloading and extracting drivers..
    Write-Host -ForegroundColor Yellow "Downloading Apple USB and Mobile Device Ethernet drivers from Microsoft..."
    Invoke-WebRequest -Uri $AppleDri1 -OutFile ([System.IO.Path]::Combine($destinationFolder, "AppleUSB-486.0.0.0-driv.cab"))
    Invoke-WebRequest -Uri $AppleDri2 -OutFile ([System.IO.Path]::Combine($destinationFolder, "AppleNet-1.8.5.1-driv.cab"))

    Write-Host -ForegroundColor Yellow "Extracting drivers..."
    & expand.exe -F:* "$destinationFolder\AppleUSB-486.0.0.0-driv.cab" "$destinationFolder" >$null 2>&1
    & expand.exe -F:* "$destinationFolder\AppleNet-1.8.5.1-driv.cab" "$destinationFolder" >$null 2>&1

    ## Installing drivers..
    Write-Host -ForegroundColor Yellow "Installing Apple USB and Mobile Device Ethernet drivers!"
    Write-Host -ForegroundColor Yellow "If any of your peripherals stop working for a few seconds that's due to Apple stuff installing."
    Write-Host ""
    Get-ChildItem -Path "$destinationFolder\*.inf" | ForEach-Object {
        pnputil /add-driver $_.FullName /install
        Write-Host ""
        Write-Host -ForegroundColor Yellow "Driver installed.."
        Write-Host ""
    }

    ## Cleaning..
    Remove-Item -Path $destinationFolder -Recurse -Force

} catch {
    Write-Host -ForegroundColor Red "Failed to complete installation. Error: $_"
}

Write-Host ""
Write-Host -ForegroundColor Cyan "Installation complete! Enjoy your Apple devices!!"
Write-Host -ForegroundColor Yellow "(If devices are still not working, a reboot might be needed!!)"