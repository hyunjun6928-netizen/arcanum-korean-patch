; 아카넘 올인원 패치 v1.8 (클린 설치)
; 기존 패치 잔재를 정리하고 UAP + 고해상도 + 한글 순서대로 설치
; 세이브 파일은 자동 보존
; Inno Setup 6.x

#define MyAppName "아카넘 올인원 패치"
#define MyAppVersion "1.8"

[Setup]
AppId={{ARCANUM-ALLINONE-KO-V18-20260417}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher=아카넘 한글화 프로젝트
DefaultDirName={code:GetArcanumDir}
DirExistsWarning=no
DisableProgramGroupPage=yes
OutputBaseFilename=Arcanum_AllInOne_Korean_v1.8
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
ko.WelcomeLabel2=아카넘 올인원 패치 v{#MyAppVersion}%n%n이 마법사는 기존 패치를 정리하고 다음을 깨끗하게 설치합니다:%n  1. UAP (Unofficial Arcanum Patch) 2.0.2%n  2. 고해상도 패치 (High Resolution Patch 1.5)%n  3. 한글 패치 v{#MyAppVersion}%n%n※ 세이브 파일은 자동으로 보존됩니다.%n※ 기존 패치 위에 덮어씌워도 안전합니다.%n%n스팀 또는 GoG 아카넘이 먼저 설치되어 있어야 합니다.
en.WelcomeLabel2=Arcanum All-in-One Patch v{#MyAppVersion}%n%nThis wizard will clean existing patches and install:%n  1. UAP (Unofficial Arcanum Patch) 2.0.2%n  2. High Resolution Patch 1.5%n  3. Korean Patch v{#MyAppVersion}%n%nSave files are automatically preserved.%nSafe to install over existing patches.%n%nSteam or GoG Arcanum must be installed first.

[Types]
Name: "full"; Description: "전체 설치 (UAP + 고해상도 + 한글) — 권장"
Name: "custom"; Description: "사용자 지정"; Flags: iscustom

[Components]
Name: "uap"; Description: "UAP (Unofficial Arcanum Patch) 2.0.2"; Types: full custom; Flags: fixed
Name: "hires"; Description: "고해상도 패치 (High Resolution Patch 1.5)"; Types: full
Name: "korean"; Description: "한글 패치 v1.8"; Types: full custom; Flags: fixed

[Files]
; UAP 인스톨러 (temp에 풀기)
Source: "uap\UAP2.0.2.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall nocompression; Components: uap

; 고해상도 패치
Source: "hires\ArcanumZHighRes.dat"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\ArcanumZHighResBorders.dat"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\ddraw.dll"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\ddraw.ini"; DestDir: "{app}"; Components: hires; Flags: ignoreversion
Source: "hires\HighRes\*"; DestDir: "{app}\HighRes"; Components: hires; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "hires\modules\Arcanum\maps\*"; DestDir: "{app}\modules\Arcanum\maps"; Components: hires; Flags: ignoreversion

; 한글 패치
Source: "korean\ArcanumA_Language.dat"; DestDir: "{app}"; Components: korean; Flags: ignoreversion
Source: "korean\Arcanum_CN_Font.exe"; DestDir: "{app}"; Components: korean; Flags: ignoreversion
Source: "korean\modules\Arcanum\dlg\*"; DestDir: "{app}\modules\Arcanum\dlg"; Components: korean; Flags: ignoreversion
Source: "korean\modules\Arcanum\mes\*"; DestDir: "{app}\modules\Arcanum\mes"; Components: korean; Flags: ignoreversion
Source: "korean\modules\Arcanum\oemes\*"; DestDir: "{app}\modules\Arcanum\oemes"; Components: korean; Flags: ignoreversion

[InstallDelete]
; === 이전 패치 잔재 정리 (세이브 제외) ===
; Vormantown 모듈 (한글 미지원 + gamedesc.mes 충돌)
Type: filesandordirs; Name: "{app}\modules\Vormantown"
Type: files; Name: "{app}\modules\Vormantown.dat"
Type: files; Name: "{app}\modules\Vormantown.PATCH9"
; 이전 한글패치/UAP loose 파일 정리
Type: filesandordirs; Name: "{app}\modules\Arcanum\dlg"
Type: filesandordirs; Name: "{app}\modules\Arcanum\mes"
Type: filesandordirs; Name: "{app}\modules\Arcanum\oemes"
Type: filesandordirs; Name: "{app}\modules\Arcanum\Backup"
Type: files; Name: "{app}\modules\Arcanum\WeiDU.log"
; 이전 고해상도 패치
Type: filesandordirs; Name: "{app}\HighRes"
Type: files; Name: "{app}\ArcanumZHighRes.dat"
Type: files; Name: "{app}\ArcanumZHighResBorders.dat"
; 이전 한글 파일
Type: files; Name: "{app}\ArcanumA_Language.dat"
Type: files; Name: "{app}\Arcanum_CN_Font.exe"
; 이전 ddraw (고해상도)
Type: files; Name: "{app}\ddraw.dll"
Type: files; Name: "{app}\ddraw.ini"
; UAP DAT (UAP가 재생성함)
Type: files; Name: "{app}\Arcanum4.dat"
Type: files; Name: "{app}\Arcanum5.dat"

[Run]
; UAP silent 설치
Filename: "{tmp}\UAP2.0.2.exe"; Parameters: "/S /D={app}"; StatusMsg: "UAP 2.0.2 설치 중..."; Flags: waituntilterminated; Components: uap

; 고해상도 패치 WeiDU 설치
Filename: "{app}\HighRes\weidu.exe"; Parameters: "--nogame Files/HighRes.tp2 --yes --reinstall"; WorkingDir: "{app}\HighRes"; StatusMsg: "고해상도 패치 설치 중..."; Flags: waituntilterminated runhidden; Components: hires

; 설치 완료 후 게임 실행 옵션
Filename: "{app}\Arcanum_CN_Font.exe"; Description: "아카넘 실행 (한글 폰트 패치)"; Flags: nowait postinstall skipifsilent unchecked; Components: korean

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
                'Arcanum.exe not found in selected folder.' + #13#10#13#10 +
                '아카넘이 설치된 폴더가 맞습니까?' + #13#10 +
                '계속하시겠습니까? / Continue anyway?', mbConfirmation, MB_YESNO) = IDNO then
        Result := False;
    end;
  end;
end;
