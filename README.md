# Backup Automation with PowerShell

This project provides an automated solution to back up a folder daily using PowerShell. The contents are compressed into a ZIP archive and stored in a specified backup directory. Execution is scheduled using Windows Task Scheduler.

## Features

- Compress a source folder into a ZIP archive
- Store the archive in a target backup directory
- Append a log entry on every backup run
- Run automatically via Task Scheduler

## Project Structure

```
02-Backup-Automation/
├── BackupScript.ps1         # PowerShell script for backup
├── backup_log.txt           # Log file (created on first run)
├── Backup-Storage/          # Folder where backup ZIPs are stored
├── LAB-DATA/                # Folder that will be backed up
├── .gitignore
└── README.md
```

## Configuration

Edit `BackupScript.ps1` to modify the following paths:

```powershell
$sourcePath = "F:\IT-Networking\Projects\02-Backup-Automation\LAB-DATA"
$backupPath = "F:\IT-Networking\Projects\02-Backup-Automation\Backup-Storage"
$logPath = "F:\IT-Networking\Projects\02-Backup-Automation\backup_log.txt"
```

## Schedule with Task Scheduler

Create a task to run daily using this command:

```
powershell.exe -ExecutionPolicy Bypass -File "F:\IT-Networking\Projects-Backup-Automation\BackupScript.ps1"
```

Set it to run with highest privileges.

## Notes

- Make sure execution policy allows the script: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned`
- Ensure Task Scheduler is enabled and running

