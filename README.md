<h1 align="center"> Apple Mobile Drivers Installer 🍎</h1>
<p align="center"> USB Tethering not working? Device only recognized as media? Forget those! 👻</p>

<p align="center">
  <img src="https://github.com/NelloKudo/Apple-Mobile-Drivers-Installer/assets/98063377/36bb52c7-e395-4f02-a3d3-c589f980512b" alt="Your GIF" />
</p>
<hr>

## Download / Installation

- Open **PowerShell** (or Windows Terminal with PowerShell) as administrator.
- Copy/paste the following and press enter:
  
  ```
  iex (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/NelloKudo/Apple-Mobile-Drivers-Installer/main/AppleDrivInstaller.ps1')
  ```
- And we're good, drivers installed!

## Why is this a thing? Where does it download drivers from?

The whole reason behind me creating this script is Windows **STILL** not including Apple's devices drivers
in the OS by default, therefore making their installation a burden for every Apple user which needs to:
- Download iTunes and iCloud
- Enable Windows Update
- Wait for all the updates to finish and hope for Windows to *eventually* pull Apple drivers **when needed**

Since Googling doesn't help with the issue, as any forum returns strange ways to pull such drivers (and many of those are outdated)
I just went for the easy way: a script which installs the **same drivers Windows Update would**, but in an extremely faster way.

This'd make life easier for everyone who'd just want to use their phone as hotspot *and not install every hunch of Apple software just to have some internet*.

The script pulls drivers from [Microsoft's Update Catalog](https://www.catalog.update.microsoft.com/Home.aspx), which you can pretty much browse yourself to look for Apple's stuff. 
It just install the **right ones** from that catalog to actually work out of the box on Windows.

Last but not least, administrator is obviously only needed **in order to install drivers**. All it does is **installing the .inf files**
inside such updates, which you could pretty much do yourself by right-clicking those.

## Can I install the script on an offline machine?

The script itself requires an internet connection in order to download drivers from Microsoft, so it's not gonna work on such machines.

Anyways, that makes no problem: you can just move them out and install them yourself this way!

- Download the .cab updates from the following links: [Apple USB Drivers](https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2020/11/01d96dfd-2f6f-46f7-8bc3-fd82088996d2_a31ff7000e504855b3fa124bf27b3fe5bc4d0893.cab) - [Apple Tether USB Drivers](https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/11/netaapl_7503681835e08ce761c52858949731761e1fa5a1.cab)
- Extract the .cab files
- Right click the .inf files in the same folder and select **Install**
<hr>

### And that's all! 🥳
