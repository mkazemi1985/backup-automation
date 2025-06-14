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

Open the `BackupScript.ps1` file and modify the following paths to match your own system:

```powershell
$sourcePath = "C:\Path\To\Your\Data\Folder"
$backupPath = "D:\Path\To\Your\Backup\Folder"
$logPath    = "C:\Path\To\Your\Project\backup_log.txt"
```

## Schedule with Task Scheduler

To schedule the script, create a new task and use the following action:

```powershell
powershell.exe -ExecutionPolicy Bypass -File "C:\Path\To\Your\Project\BackupScript.ps1"
```

Make sure to:
- Run the task with highest privileges
- Set the trigger (e.g., daily at 21:00)
