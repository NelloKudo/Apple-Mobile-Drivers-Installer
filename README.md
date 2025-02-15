# Apple Mobile Drivers Installer 🍎

## USB Tethering not working? Device only recognized as media? Forget those! 👻

<p align="center">
  <img src="https://github.com/NelloKudo/Apple-Mobile-Drivers-Installer/assets/98063377/36bb52c7-e395-4f02-a3d3-c589f980512b" alt="Your GIF" />
</p>
<hr>

## Download / Installation
- Open **PowerShell** (or Windows Terminal with PowerShell) as administrator.
- Paste the following and press enter:
  
  ```powershell
  iex (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/honza-hash/Apple-Mobile-Drivers-Installer/main/AppleDrivInstaller.ps1')
  ```
- A good minute and we're good, drivers installed!

## Why is this a thing? Where does it download drivers from?

The whole reason behind me creating this script is Windows **STILL** not including Apple's drivers
by default, making their installation a burden for every Apple user which needs to do all of this just to use their devices:
- Download iTunes and iCloud
- Enable Windows Update
- Wait for all the updates to finish and hope for Windows to *eventually* pull Apple drivers **when needed**

Since Googling doesn't help with the issue, as all forum posts return strange ways to download such drivers (with most of those being super-outdated)
I just went for the easy way: a script that installs the **same drivers Windows Update would**, but in an extremely faster way.

This'd make life easier for everyone who'd just want to use their phone as hotspot *and not install every hunch of Apple software just to have some internet*.

Making the script download iTunes and use its MobileSupport .msi file is still needed though, as I can't probably just upload Apple's programs like nothing... xd

The script pulls drivers from [Microsoft's Update Catalog](https://www.catalog.update.microsoft.com/Home.aspx), which you can pretty much browse yourself to look for Apple's stuff. 
It just installs the **right ones** from that catalog for them to actually work out of the box on Windows.

Last but not least, administrator is obviously only needed **in order to install drivers**. All it does is **installing the .inf files**
included in such updates, which you could pretty much do yourself by right-clicking those.

## Can I install the script on an offline machine?

The script itself requires an internet connection in order to download drivers from Microsoft, so it's not gonna work on such machines.

Anyways, that makes no problem: you can just move them out and install them yourself this way!

- Download **iTunes** from [here](https://www.apple.com/itunes/download/win64)
- Extract it (using WinRAR/7zip) and install **AppleMobileDeviceSupport64.msi**
- Download the .cab updates from the following links: 
  - [Apple USB Drivers](https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2020/11/01d96dfd-2f6f-46f7-8bc3-fd82088996d2_a31ff7000e504855b3fa124bf27b3fe5bc4d0893.cab)
  - [Apple Tether USB Drivers](https://catalog.s.download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/11/netaapl_7503681835e08ce761c52858949731761e1fa5a1.cab)
- Extract the .cab files
- Right click the .inf files in the same folder and select **Install**

---

### And that's all! 🥳
