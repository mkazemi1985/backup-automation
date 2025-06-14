# === BackupScript.ps1 ===
# This script compresses the contents of a folder (C:\Projects\P-02\Backup-Storage)
# and saves it as a ZIP file in the backup directory (C:\Projects\P-02\Backup-Storage).
# It also logs the success or failure of the backup operation.

# Define paths
$sourcePath = "C:\Projects\P-02\LAB-DATA"
$backupPath = "C:\Projects\P-02\Backup-Storage"
$logPath = "C:\Projects\P-02\backup_log.txt"

# Generate ZIP filename with timestamp
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$zipName = "LAB-DATA_$date.zip"
$zipFullPath = Join-Path -Path $backupPath -ChildPath $zipName

# Perform backup
try {
    # Compress source folder into ZIP
    Compress-Archive -Path "$sourcePath\*" -DestinationPath $zipFullPath -Force
    $log = "$date Backup successful: $zipName"
}
catch {
    # Log any errors encountered during compression
    $log = "$date Backup failed: $_"
}

# Append the result to the log file
$log | Out-File -Append -FilePath $logPath -Encoding UTF8
