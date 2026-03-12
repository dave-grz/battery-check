# PowerShell Battery Report Generator
A simple PowerShell `.ps1` script that generates a **Windows battery health report** using `powercfg /batteryreport` and saves it to a user-specified directory with a **timestamped filename**.

This script improves the default Windows battery report workflow by:
- Prompting for an output directory
- Automatically creating the directory if it does not exist
- Adding a **timestamp and username** to the report filename
- Displaying verbose progress messages in the terminal

---

## Features

- 🔋 Generates a Windows battery health report
- 📁 Allows user to specify output directory
- 🕒 Automatically timestamps the report
- 👤 Includes the current Windows username in the filename
- 📊 Produces a standard `.html` battery report
- 🧾 Verbose execution feedback in the terminal

---

## Requirements

- Windows OS
- PowerShell
- Administrator privileges (required)
- Laptop or device with a battery

The script uses the built-in Windows command:

```
powercfg /batteryreport
```

---

## How It Works

1. The script retrieves:
   - Current **date and time**
   - Current **Windows username**
2. It prompts the user to **enter an output directory**.
3. If the directory does not exist, it **creates it automatically**.
4. It runs the Windows battery report command.
5. The report is saved as an **HTML file**.
6. Open the`.html` file using your favourite browser to read the result.

Example filename format:

```
YYYYMMDD-HHMMSS-BatteryReport-USERNAME.html
```

Example:

```
20260312-154530-BatteryReport-daveGRZ.html
```

---

## Usage

### 1. Clone or Download the Script

```bash
git clone https://github.com/yourusername/battery-report-script.git
```

Or download the `.ps1` file.

---

### 2. Run the Script

Open **PowerShell** and run:

```powershell
.\BatteryReport.ps1
```

---

### 3. Enter Output Directory

When prompted, enter a directory path where the report should be saved.

Example:

```
Enter the path directory to save the battery report:
C:\Reports\Battery
```

If the folder does not exist, the script will create it automatically.

---

## Example Output

Terminal output example:

```
VERBOSE: Starting Battery Report generation...
VERBOSE: Current User: daveGRZ
VERBOSE: Current Date: 20260312-154530
Enter the path directory to save the battery report: C:\Reports\Battery
VERBOSE: Selected output folder: C:\Reports\Battery
VERBOSE: Generating battery report: C:\Reports\Battery\20260312-154530-BatteryReport-daveGRZ.html

Battery report generated successfully!
File saved to: C:\Reports\Battery\20260312-154530-BatteryReport-daveGRZ.html
```

---

## Optional: Predetermined Output Path

If you prefer **not to enter the directory every time**, you can edit the script and define a fixed output path.

Uncomment and modify this section:

```powershell
$OutPath = "DriveLetter:\ParentDir\<Enter your specific destination directory here>"
```

Example:

```powershell
$OutPath = "C:\Reports\Battery"
```

Then comment out or remove the `Read-Host` prompt section.

---

## Report Contents

The generated HTML battery report typically includes:

- Installed batteries
- Design capacity
- Full charge capacity
- Battery usage history
- Charge cycles
- Recent usage
- Battery life estimates

---

## Example Use Cases

- Monitoring **battery degradation over time**
- IT diagnostics for company laptops
- Routine **system health checks**
- Logging battery reports for maintenance records

---

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-750014)](https://github.com/dave-grz/battery-check/blob/main/LICENSE)

MIT License

_See [LICENSE](https://github.com/dave-grz/battery-check/blob/main/LICENSE) for details._

---

## Contributing

Pull requests and improvements are welcome. 

Typical workflow:

1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Open a Pull Request

Possible enhancements include:

- Automatic report opening
- Scheduled battery reporting
- Export to additional formats
- Battery health summary parsing

---

## Author

Created for simplifying Windows battery diagnostics using PowerShell.

_Copyright © 2026 David Graciano (itslearning.dave@gmail.com)._
