# batch-win-installer
Automatic Windows batch packages installer script based on `winget` and `chocolatey`.

## How to Run
Open `powershell` as administrator:

```
Set-ExecutionPolicy AllSigned
.\batch-win-installer.ps1
```

## Functions
1. Install packages using `winget` and `chocolatey`.
2. First check if `chocolatey` is installed; if not, install `chocolatey` automatically.
3. Allows for custom packages installation commands.

## Available Packages
You can check available packages for `winget` and `chocolatey` in the links below.

- Winget
https://winget.run/

- Chocolatey
https://community.chocolatey.org/packages
