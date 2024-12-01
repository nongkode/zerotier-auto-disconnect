#define MyAppName "ZeroTier Script"
#define MyAppVersion "0.2"

[Setup]
AppId={{95CB1762-DDB7-4D38-922B-24E1C276D254}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName=C:\ZeroTier Script
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
OutputDir= .
OutputBaseFilename=ZeroTier Script

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "disconnect.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "TaskScheduler.xml"; DestDir: "{app}"; Flags: ignoreversion

[Run]
Filename: "schtasks.exe"; \
    Parameters: "/create /XML ""{app}\TaskScheduler.xml"" /TN ""ZeroTier Auto Disconnect"""
