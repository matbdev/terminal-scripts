# Utility Scripts

A collection of handy terminal scripts for everyday use, especially optimized for Windows Subsystem for Linux (WSL) environments.

## File Paths & Scripts Overview

*   **`dbopen`**: Opens the current Git repository directly in your Databricks Workspace. It requires an initial one-time configuration (Host, Workspace ID, Email) which is saved securely for future uses. The repository must be cloned in the path defined in the configuration on databricks.
*   **`file_organizator`**: Automatically organizes files in your `Downloads` directory by moving them into specific folders (Documents, Images, Videos, Music, etc.) based on their extensions. It also generates a log file to keep track of the movements and handles file name collisions elegantly.
*   **`git_save`**: A quick helper script to stage, commit, and push changes to the current Git repository in a single command. It includes an optional `--cicd` flag to automatically open the remote pipeline page (GitLab/GitHub) in your default Windows browser.
*   **`mx`**: Locates the unique `.mpr` (Mendix Project) file in the current directory and opens it in Mendix Studio Pro on Windows. Perfect for quickly launching Mendix from your WSL terminal.
*   **`pbi`**: Recursively finds the unique `.pbip` (Power BI Project) file from the current directory and opens it in Power BI Desktop on Windows. This bypasses common WSL-to-WindowsApps permission issues.

## Setup & Usage

To use these scripts, first ensure they are executable:

```bash
cd utils/
chmod +x dbopen file_organizator git_save mx pbi
```

For the best experience, add this `utils/` folder path to your `~/.bashrc` or `~/.zshrc` `$PATH` export so you can run the commands globally from anywhere in your terminal!
