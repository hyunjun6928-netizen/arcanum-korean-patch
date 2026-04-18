; 아카넘 올인원 한글패치 v1.8
; UAP 2.0.2 + 고해상도 1.5 + 한글 번역 통합 설치
; Inno Setup 6.x

#define MyAppName "아카넘 올인원 한글패치"
#define MyAppVersion "1.9"

[Setup]
AppId={{ARCANUM-ALLINONE-KO-V19-20260417}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher=아카넘 한글화 프로젝트
DefaultDirName={code:GetArcanumDir}
DirExistsWarning=no
DisableProgramGroupPage=yes
OutputBaseFilename=Arcanum_AllInOne_Korean_v1.9
OutputDir=output
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
Uninstallable=no
SetupLogging=yes

[Languages]
Name: "ko"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Messages]
ko.WelcomeLabel2=아카넘 올인원 한글패치 v{#MyAppVersion}%n%n이 설치 프로그램은 다음을 자동으로 설치합니다:%n%n  • UAP (Unofficial Arcanum Patch) 2.0.2%n  • 고해상도 패치 (High Resolution Patch) 1.5%n  • 한글 번역 패치 v{#MyAppVersion}%n%n※ 기존 패치가 있으면 자동 정리 후 클린 설치합니다.%n※ 세이브 파일은 보존됩니다.%n%n계속하려면 [다음]을 클릭하세요.
en.WelcomeLabel2=Arcanum All-in-One Korean Patch v{#MyAppVersion}%n%nThis installer will automatically install:%n%n  • UAP (Unofficial Arcanum Patch) 2.0.2%n  • High Resolution Patch 1.5%n  • Korean Translation Patch v{#MyAppVersion}%n%nExisting patches will be cleaned up automatically.%nSave files are preserved.%n%nClick Next to continue.

[Components]
Name: "uap"; Description: "UAP 2.0.2 (비공식 패치)"; Types: full; Flags: fixed
Name: "hires"; Description: "고해상도 패치 1.5"; Types: full; Flags: fixed
Name: "korean"; Description: "한글 번역 패치"; Types: full; Flags: fixed

[InstallDelete]
; === 이전 패치 잔재 정리 (세이브 제외) ===
Type: filesandordirs; Name: "{app}\modules\Vormantown"
Type: files; Name: "{app}\modules\Vormantown.dat"
Type: files; Name: "{app}\modules\Vormantown.PATCH9"
Type: filesandordirs; Name: "{app}\modules\Arcanum\dlg"
Type: filesandordirs; Name: "{app}\modules\Arcanum\mes"
Type: filesandordirs; Name: "{app}\modules\Arcanum\oemes"
Type: filesandordirs; Name: "{app}\modules\Arcanum\Backup"
Type: files; Name: "{app}\modules\Arcanum\WeiDU.log"
Type: filesandordirs; Name: "{app}\HighRes"
Type: files; Name: "{app}\ArcanumZHighRes.dat"
Type: files; Name: "{app}\ArcanumZHighResBorders.dat"
Type: files; Name: "{app}\ArcanumA_Language.dat"
Type: files; Name: "{app}\Arcanum_CN_Font.exe"
Type: files; Name: "{app}\ddraw.dll"
Type: files; Name: "{app}\ddraw.ini"
Type: files; Name: "{app}\Arcanum4.dat"
Type: files; Name: "{app}\Arcanum5.dat"
Type: files; Name: "{app}\dgVoodoo.conf"
Type: files; Name: "{app}\modules\Arcanum\mes\gamedesc.mes.bak_original"

[Files]
; === UAP 설치 프로그램 ===
Source: "uap\UAP2.0.2.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall nocompression; Components: uap

; === UAP 필수 파일 (폴백 — UAP silent 설치 실패 시 보장) ===
Source: "extras\Arcanum4.dat"; DestDir: "{app}"; Flags: ignoreversion; Components: uap
Source: "extras\Arcanum5.dat"; DestDir: "{app}"; Flags: ignoreversion; Components: uap
Source: "extras\ArcanumXAmbient.dat"; DestDir: "{app}"; Flags: ignoreversion; Components: uap
Source: "extras\ArcanumXAnims1Base.dat"; DestDir: "{app}"; Flags: ignoreversion; Components: uap
Source: "extras\ArcanumXAnims2Dupes.dat"; DestDir: "{app}"; Flags: ignoreversion; Components: uap
Source: "extras\ArcanumXAnims3UAP.dat"; DestDir: "{app}"; Flags: ignoreversion; Components: uap

; === 고해상도 패치 ===
Source: "hires\ArcanumZHighRes.dat"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\ArcanumZHighResBorders.dat"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\ddraw.dll"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\ddraw.ini"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\HighRes\*"; DestDir: "{app}\HighRes"; Components: hires; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "hires\modules\Arcanum\maps\*"; DestDir: "{app}\modules\Arcanum\maps"; Components: hires; Flags: ignoreversion

; === dgVoodoo 설정 (워터마크 비활성화) ===
Source: "extras\dgVoodoo.conf"; DestDir: "{app}"; Flags: ignoreversion; Components: hires

; === 정상 ddraw.dll 백업 (WeiDU 덮어쓰기 복원용) ===
Source: "hires\ddraw.dll"; DestDir: "{app}"; DestName: "ddraw_correct.dll"; Flags: ignoreversion; Components: hires

; === 한글 폰트 ===
Source: "extras\arcanum_font.dll"; DestDir: "{app}"; Flags: ignoreversion; Components: korean
Source: "extras\arcanum_fontpatch.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: korean

; === 한글 번역 ===
Source: "korean\ArcanumA_Language.dat"; DestDir: "{app}"; Components: korean; Flags: ignoreversion
Source: "korean\Arcanum_CN_Font.exe"; DestDir: "{app}"; Components: korean; Flags: ignoreversion
Source: "korean\modules\Arcanum\dlg\*"; DestDir: "{app}\modules\Arcanum\dlg"; Components: korean; Flags: ignoreversion
Source: "korean\modules\Arcanum\mes\*"; DestDir: "{app}\modules\Arcanum\mes"; Components: korean; Flags: ignoreversion
Source: "korean\modules\Arcanum\oemes\*"; DestDir: "{app}\modules\Arcanum\oemes"; Components: korean; Flags: ignoreversion

[UninstallDelete]
Type: filesandordirs; Name: "{app}\HighRes\Backup"
Type: files; Name: "{app}\HighRes\WeiDU.log"
Type: files; Name: "{app}\ddraw_correct.dll"

[Run]
; 1. UAP 설치 (silent)
Filename: "{tmp}\UAP2.0.2.exe"; Parameters: "/S /D={app}"; StatusMsg: "UAP 2.0.2 설치 중..."; Flags: waituntilterminated; Components: uap
; 2. 고해상도 패치 (WeiDU)
Filename: "{app}\HighRes\weidu.exe"; Parameters: "--nogame Files/HighRes.tp2 --yes --reinstall"; WorkingDir: "{app}\HighRes"; StatusMsg: "고해상도 패치 적용 중..."; Flags: waituntilterminated; Components: hires
; 3. WeiDU가 ddraw.dll을 DDrawCompat로 덮어쓰므로 정상 버전으로 복원
Filename: "{cmd}"; Parameters: "/c copy /y ""{app}\ddraw_correct.dll"" ""{app}\ddraw.dll"""; StatusMsg: "ddraw.dll 복원 중..."; Flags: waituntilterminated runhidden; Components: hires
; 4. 임시 파일 정리
Filename: "{cmd}"; Parameters: "/c del ""{app}\ddraw_correct.dll"""; Flags: waituntilterminated runhidden; Components: hires
; 5. 한글 폰트 패치
Filename: "{app}\Arcanum_CN_Font.exe"; Description: "한글 폰트 패치 적용"; Flags: nowait postinstall skipifsilent unchecked; Components: korean

[Code]
function FindSteamArcanumPath: String;
var
  SteamPath, ArcanumPath: String;
begin
  Result := '';
  if RegQueryStringValue(HKLM, 'SOFTWARE\WOW6432Node\Valve\Steam', 'InstallPath', SteamPath) or
     RegQueryStringValue(HKLM, 'SOFTWARE\Valve\Steam', 'InstallPath', SteamPath) or
     RegQueryStringValue(HKCU, 'SOFTWARE\Valve\Steam', 'InstallPath', SteamPath) then
  begin
    ArcanumPath := SteamPath + '\steamapps\common\Arcanum\Arcanum';
    if DirExists(ArcanumPath) then begin Result := ArcanumPath; Exit; end;
    ArcanumPath := SteamPath + '\steamapps\common\Arcanum';
    if DirExists(ArcanumPath) and FileExists(ArcanumPath + '\Arcanum.exe') then begin Result := ArcanumPath; Exit; end;
  end;
end;

function FindGogArcanumPath: String;
var
  GogPath: String;
begin
  Result := '';
  if RegQueryStringValue(HKLM, 'SOFTWARE\WOW6432Node\GOG.com\Games\1207658674', 'path', GogPath) or
     RegQueryStringValue(HKLM, 'SOFTWARE\GOG.com\Games\1207658674', 'path', GogPath) then
  begin
    if DirExists(GogPath) then Result := GogPath;
  end;
end;

function GetArcanumDir(Param: String): String;
var
  Path: String;
begin
  Path := FindSteamArcanumPath;
  if Path <> '' then begin Result := Path; Exit; end;
  Path := FindGogArcanumPath;
  if Path <> '' then begin Result := Path; Exit; end;
  Result := 'C:\Program Files (x86)\Steam\steamapps\common\Arcanum\Arcanum';
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if CurPageID = wpSelectDir then
  begin
    if not FileExists(ExpandConstant('{app}\Arcanum.exe')) then
    begin
      if MsgBox('선택한 폴더에서 Arcanum.exe를 찾을 수 없습니다.' + #13#10 +
                '아카넘이 설치된 폴더가 맞습니까?' + #13#10 +
                '계속하시겠습니까?', mbConfirmation, MB_YESNO) = IDNO then
        Result := False;
    end;
  end;
end;
