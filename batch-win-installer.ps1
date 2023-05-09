# Windows Automatic Packages Installer v1.0
# By: Raihan Arvi
# 2023

# Opening screen.
Write-host "`n"
Write-Host "#########################################"
Write-Host "Windows Automatic Packages Installer." -ForegroundColor Green
Write-Host "By: Raihan Arvi." -ForegroundColor Green
Write-Host "v1.0 01/05/2023 Release." -ForegroundColor Green
Write-Host "#########################################"
Write-host "`n" # new line

# ###
# Function Blocks
# ###

# Chocolatey Code Block
Function GetChoco {
    Write-Host "Installing Chocolatey Packages..." -ForegroundColor Green
    # Edit here:
    $ChocoPackages = 'whatsapp', 'zoom', 'telegram', 'discord', 'notion', 'spotify', 'tidal', 'notepadplusplus', 'teamviewer', 'reflector-4', 'obs-studio', 'bulkrenameutility', 'geogebra-classic.install'
    ForEach ($PackageName in $ChocoPackages){
        choco install $PackageName -y
    }

    # Custom Installation Code:
    # ...

    Write-Host "Chocolatey Packages Installed" -ForegroundColor Green
}

# Winget Code Block
Function GetWinget {
    Write-Host "Installing Winget Packages..." -ForegroundColor Green
    # Edit here:
    $WingetPackages = 'RARLab.WinRAR', '7zip.7zip', 'Spotify.Spotify', 'WhatsApp.WhatsApp', 'Microsoft.PowerToys'
    ForEach ($PackageName in $WingetPackages){
        winget install -e --id $PackageName
    }
    
    # Custom Installation Code:
    # ...
    
    Write-Host "Winget Packages Installed" -ForegroundColor Green
    Write-Host "Installations done, exitting program..." -ForegroundColor Green
}

##########################################################
##########################################################
##########################################################

# Function Install Chocolatey
Function InstallChoco {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

#
# Pause screen function.
# No need to change.
#

Function Pause-Screen ($Message = "Press any key to continue . . . ") {
    if ((Test-Path variable:psISE) -and $psISE) {
        $Shell = New-Object -ComObject "WScript.Shell"
        $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
    }
    else {     
        Write-Host -NoNewline $Message
        [void][System.Console]::ReadKey($true)
        Write-Host
    }
}

# Main Function
# do not edit. final version.
Function Main-Function {
    If(Test-Path -Path "$env:ProgramData\chocolatey") { # check if chocolatey is installed.
        Write-Host "Chocolatey found." -ForegroundColor Green
        GetChoco
        GetWinget
        Pause-Screen
    }

        Else {
            Write-Host "Chocolatey not found." -ForegroundColor Green
            Write-Host "Installing Choco..." -ForegroundColor Green
            InstallChoco # installing chocolatey.

            If(Test-Path -Path "$env:ProgramData\chocolatey"){
                Write-Host "Chocolatey installed successfully." -ForegroundColor Green}
                Else{ 
                    Write-Host "Chocolatey installation failed." -ForegroundColor Green
                    Pause-Screen
                    Exit-PSSession # exit program.
                }

            GetChoco
            GetWinget
            Pause-Screen
            }
}

# Start the Script
Main-Function
