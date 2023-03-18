﻿; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Silent HIll 2 HD Collection Voice Pack Lite Edition"
#define MyAppVersion "5.0.4"
#define MyAppPublisher "Mario Tainaka"
#define MyAppURL "https://twitter.com/SlaveOfSuzumiya"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{3B69554D-25E6-451F-A913-C355E63FD8BB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={code:GetDefaultDirName}
DirExistsWarning=no
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=SH2HDCVPLEsetup
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
DisableWelcomePage=no
DisableDirPage=no
WizardImageFile=resources\Thumb.bmp
WizardSmallImageFile=resources\top.bmp
SolidCompression=no
DiskSpanning=yes
SlicesPerDisk=3
DiskSliceSize=1566000000
WizardStyle=modern
SetupIconFile=resources\sh2.ico
Compression=zip


 
 //Readme and License file are read from the source dir 
 
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"; InfoBeforeFile:"C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\English\Readme.txt"; LicenseFile : "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\English\License.txt"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"; InfoBeforeFile:"C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\Spanish\Readme_sp.txt"; LicenseFile : "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\Spanish\License_sp.txt"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"; InfoBeforeFile:"C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\Italian\Readme_it.txt"; LicenseFile : "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\Italian\License_it.txt"
Name: "French"; MessagesFile: "compiler:Languages\French.isl"; InfoBeforeFile:"C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\French\Readme_fr.txt"; LicenseFile : "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\French\License_fr.txt"


 //After installation you can run Silent Hill 2 Enhanced Edition OR  run the Config Tool
[Run]
Filename: "{app}\sh2pc.exe"; Description: "Launch Silent Hill 2 Enhanced Edition"; Flags: nowait postinstall skipifsilent unchecked

Filename: "{app}\SH2EEconfig.exe"; Description: "Launch Silent Hill 2 Enhanced Edition Config Tool"; Flags: nowait postinstall skipifsilent unchecked





[Files]
// Main Installation Files, CG Cutscenes, SFX and Dialouge as well as help files. These will always be installed regardless of the components selected
Source: "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\common\*"; DestDir: "{app}\lang"; Flags: ignoreversion recursesubdirs createallsubdirs;  Components: main 

Source: "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\HD Collection Voice Pack Support\*"; DestDir: "{app}\HD Collection Voice Pack Support"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: main


// Optional Component files
Source: "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\additional_subtitle\*"; DestDir: "{app}\lang"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: sub

Source: "C:\Users\sjomm\Documents\Silent Hill HD Voice Pack Project Files\SH 2 NEW MIX\Installer Final\Lite\additional_bgm\*"; DestDir: "{app}\lang"; Flags: ignoreversion recursesubdirs createallsubdirs; Components: bgm



// Optional Components catagories, the main files which include the FMV, SFX and Dialouge files will not be selectable to prevent user error

[Components]
Name: "main"; Description: "Main Files";Types: full compact custom; Flags: fixed
Name: "sub"; Description: "Cutscene Subtitle Fixes For All Langauges"; Types:  full; Flags: dontinheritcheck
Name: "bgm"; Description: "Audio Enhacement Pack Music"; Types:  full; Flags: dontinheritcheck



//Code which should show a description of the catagory options. Huge thanks to Nipkow for getting this to work

[Code]

var
  LastMouse: TPoint;
  CompLabel: TLabel;

function GetCursorPos(var lpPoint: TPoint): BOOL;
  external 'GetCursorPos@user32.dll stdcall';
function SetTimer(
  hWnd: longword; nIDEvent, uElapse: LongWord; lpTimerFunc: LongWord): LongWord;
  external 'SetTimer@user32.dll stdcall';
function ScreenToClient(hWnd: HWND; var lpPoint: TPoint): BOOL;
  external 'ScreenToClient@user32.dll stdcall';
function ClientToScreen(hWnd: HWND; var lpPoint: TPoint): BOOL;
  external 'ClientToScreen@user32.dll stdcall';
function ListBox_GetItemRect(
  const hWnd: HWND; const Msg: Integer; Index: LongInt; var Rect: TRect): LongInt;
  external 'SendMessageW@user32.dll stdcall';  

const
  LB_GETITEMRECT = $0198;
  LB_GETTOPINDEX = $018E;

function FindControl(Parent: TWinControl; P: TPoint): TControl;
var
  Control: TControl;
  WinControl: TWinControl;
  I: Integer;
  P2: TPoint;
begin
  for I := 0 to Parent.ControlCount - 1 do
  begin
    Control := Parent.Controls[I];
    if Control.Visible and
       (Control.Left <= P.X) and (P.X < Control.Left + Control.Width) and
       (Control.Top <= P.Y) and (P.Y < Control.Top + Control.Height) then
    begin
      if Control is TWinControl then
      begin
        P2 := P;
        ClientToScreen(Parent.Handle, P2);
        WinControl := TWinControl(Control);
        ScreenToClient(WinControl.Handle, P2);
        Result := FindControl(WinControl, P2);
        if Result <> nil then Exit;
      end;

      Result := Control;
      Exit;
    end;
  end;

  Result := nil;
end;

function PointInRect(const Rect: TRect; const Point: TPoint): Boolean;
begin
  Result :=
    (Point.X >= Rect.Left) and (Point.X <= Rect.Right) and
    (Point.Y >= Rect.Top) and (Point.Y <= Rect.Bottom);
end;

function ListBoxItemAtPos(ListBox: TCustomListBox; Pos: TPoint): Integer;
var
  Count: Integer;
  ItemRect: TRect;
begin
  Result := SendMessage(ListBox.Handle, LB_GETTOPINDEX, 0, 0);
  Count := ListBox.Items.Count;
  while Result < Count do
  begin
    ListBox_GetItemRect(ListBox.Handle, LB_GETITEMRECT, Result, ItemRect);
    if PointInRect(ItemRect, Pos) then Exit;
    Inc(Result);
  end;
  Result := -1;
end;

procedure HoverComponentChanged(Index: Integer);
var 
  Description: string;
begin
  case Index of
    0: Description := 'Installs important files required for this mod to function';
    1: Description := 'Fixes subtitles for certain in-game cutscenes for all langauges (Not recomended when using translation packs)';
    2: Description := 'Install Enhanced Edition Music Files (Not required If you have a full Enhanced Edition installation)';
    
  else
    Description := 'Move your mouse over a component to see its description.';
  end;
  CompLabel.Caption := Description;
end;

procedure HoverTimerProc(
  H: LongWord; Msg: LongWord; IdEvent: LongWord; Time: LongWord);
var
  P: TPoint;
  Control: TControl; 
  Index: Integer;
begin
  GetCursorPos(P);
  if P <> LastMouse then { just optimization }
  begin
    LastMouse := P;
    ScreenToClient(WizardForm.Handle, P);

    if (P.X < 0) or (P.Y < 0) or
       (P.X > WizardForm.ClientWidth) or (P.Y > WizardForm.ClientHeight) then
    begin
      Control := nil;
    end
      else
    begin
      Control := FindControl(WizardForm, P);
    end;

    Index := -1;
    if (Control = WizardForm.ComponentsList) and
       (not WizardForm.TypesCombo.DroppedDown) then
    begin
      P := LastMouse;
      ScreenToClient(WizardForm.ComponentsList.Handle, P);
      Index := ListBoxItemAtPos(WizardForm.ComponentsList, P);
    end;

    HoverComponentChanged(Index);
  end;
end;

procedure InitializeWizard();
begin
  SetTimer(0, 0, 50, CreateCallback(@HoverTimerProc));

  CompLabel := TLabel.Create(WizardForm);
  with CompLabel do
  begin
      Caption     := '';
      Parent      := WizardForm.SelectComponentsPage;
      Left        := WizardForm.ComponentsList.Left;
      Width       := WizardForm.ComponentsList.Width;
      Height      := ScaleY(40);
      Top         := WizardForm.ComponentsList.Top + WizardForm.ComponentsList.Height - CompLabel.Height - ScaleY(40);
      Anchors     := [akLeft, akBottom];
      AutoSize    := False;
      WordWrap    := True;
  end;

  WizardForm.ComponentsList.Height := WizardForm.ComponentsList.Height - CompLabel.Height - ScaleY(40);
end;





[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"


[Setup] 
UninstallFilesDir={app}\HD Collection Voice Pack Uninstall

 
 //Find Silent Hill 2 Installation Path by Nipkow
[Code]
var
  GCS_sh2pcPath: string;

// Search for sh2pc.exe in "\HKEY_CURRENT_USER\System\GameConfigStore\Children\"
procedure RegSearch(RootKey: Integer; KeyName: string);
var
  I: Integer;
  Names: TArrayOfString;
  Name: string;
  FoundPaths: String;
begin
  if RegGetSubkeyNames(RootKey, KeyName, Names) then
  begin
    for I := 0 to GetArrayLength(Names) - 1 do
    begin
      Name := KeyName + '\' + Names[I];

      RegSearch(RootKey, Name);
    end;
  end;

  if RegGetValueNames(RootKey, KeyName, Names) then
  begin
    for I := 0 to GetArrayLength(Names) - 1 do
    begin
      Name := KeyName + '\' + Names[I];

      if Pos('MatchedExeFullPath', Name) > 0 then
      begin

        if RegQueryStringValue(HKEY_CURRENT_USER, KeyName, 'MatchedExeFullPath', FoundPaths) then
        begin

          if Pos('sh2pc.exe', FoundPaths) > 0 then
          begin
            if FileExists(ExtractFilePath(FoundPaths) + '\sh2pc.exe') then
            begin
              GCS_sh2pcPath := ExtractFilePath(FoundPaths);
            end;
          end;
        end;
      end;
    end;
  end;
end;

// Return a DefaultDirName based on conditions
function GetDefaultDirName(Param: string): string;
var 
  InstallationPath : String;
  RetailInstallDir : String;
begin
  if InstallationPath = '' then
  begin
    // Search registry 
    RegSearch(HKEY_CURRENT_USER, 'System\GameConfigStore');

    // Actually choose a path
    if RegQueryStringValue(HKLM32, 'Software\Konami\Silent Hill 2', 'INSTALLDIR', RetailInstallDir) and FileExists(RetailInstallDir + '\sh2pc.exe') then 
      InstallationPath := RetailInstallDir
    else
    if not (GCS_sh2pcPath = '') then
      InstallationPath := GCS_sh2pcPath
    else
      InstallationPath := ExpandConstant('{autopf}\') + 'Konami\Silent Hill 2\'; 
  end;
  Result := InstallationPath;
end;


 // Custom message code which makes the message box appear

 [Code]
function InitializeSetup: Boolean;
begin
  Result := True;  
  MsgBox(ExpandConstant('{cm:CustomMessage}'), mbInformation, MB_OK);
end;

 



//Warning Box Before starting installation

[CustomMessages]

MsgBox=(ExpandConstant('{cm:MyCustomMessage}'), mbInformation, MB_OK);

CustomMessage=Undefined //just in case (should be equal to English)
english.CustomMessage=Ensure Silent Hill 2: Enhanced Edition is installed prior to running this installer for the Silent Hill 2 HD Collection Voice Pack
spanish.CustomMessage=Asegúrese de que Silent Hill 2: Enhanced Edition esté instalado antes de ejecutar este instalador para Silent Hill 2 HD Collection Voice Pack
italian.CustomMessage=Assicurati che Silent Hill 2: Enhanced Edition sia installato prima di eseguire questo programma di installazione per Silent Hill 2 HD Collection Voice Pack
French.CustomMessage=Assurez-vous que Silent Hill 2: Enhanced Edition est installé avant d'exécuter ce programme d'installation pour le pack de voix Silent Hill 2 HD Collection













