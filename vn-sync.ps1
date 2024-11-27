param (
    [Parameter(Mandatory=$true)]
    [ValidateSet("b", "r")]
    [string]$mode  # -b: backup, -r: restore
)

$configPath = ".\config.json"
$config = Get-Content $configPath | ConvertFrom-Json

# backup
if ($mode -eq "b") {
    Write-Output "Running in BACKUP mode..."
    foreach ($source in $config.from) {
        $destination = Join-Path $config.to (Split-Path $source -Leaf)

        Write-Output "Backing up from $source to $destination..."
        robocopy $source $destination /MIR /Z /E /R:3 /W:5 /LOG+:backup.log
    }
    Write-Output "Backup completed successfully!"
# restore
} elseif ($mode -eq "r") {
    Write-Output "Running in RESTORE mode..."
    foreach ($source in $config.from) {
        $destination = $source
        $backupSource = Join-Path $config.to (Split-Path $source -Leaf)

        Write-Output "Restoring from $backupSource to $destination..."
        robocopy $backupSource $destination /MIR /Z /E /R:3 /W:5
    }
    Write-Output "Restore completed successfully!"
}
