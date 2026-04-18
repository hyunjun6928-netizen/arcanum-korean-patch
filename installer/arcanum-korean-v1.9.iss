; 아카넘 한글 패치 v1.8 (단독)
; 기존 UAP + 고해상도 설치 유저용 업데이트
; Inno Setup 6.x

#define MyAppName "아카넘 한글 패치"
#define MyAppVersion "1.9"

[Setup]
AppId={{A1B2C3D4-ARCA-KOR1-9000-PATCHINSTALL}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher=아카넘 한글화 프로젝트
DefaultDirName={code:GetArcanumDir}
DirExistsWarning=no
DisableProgramGroupPage=yes
OutputBaseFilename=Arcanum_Korean_Patch_v1.9
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
ko.WelcomeLabel2=아카넘 한글 패치 v{#MyAppVersion}%n%nUAP와 고해상도 패치가 이미 설치된 유저용 업데이트입니다.%n%n※ v1.9 변경사항:%n  - 마담 릴 퀘스트 버그 수정 (랭글리 5일 대기 후 대화 안 나오는 원본 버그)%n%n신규 설치는 올인원 패치를 사용하세요.%n%n계속하려면 [다음]을 클릭하세요.
en.WelcomeLabel2=Arcanum Korean Patch v{#MyAppVersion}%n%nUpdate for users who already have UAP and HiRes installed.%n%nChanges in v1.9:%n  - Fixed Madam Lil quest bug (Langley 5-day wait dialogue not appearing — vanilla bug fix)%n%nFor fresh installs, use the All-in-One patch.%n%nClick Next to continue.

[Files]
; 한글 패치 파일 (상대경로 — korean/ 폴더 기준)
Source: "korean\ArcanumA_Language.dat"; DestDir: "{app}"; Flags: ignoreversion
Source: "korean\Arcanum_CN_Font.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "korean\modules\Arcanum\dlg\*"; DestDir: "{app}\modules\Arcanum\dlg"; Flags: ignoreversion
Source: "korean\modules\Arcanum\mes\*"; DestDir: "{app}\modules\Arcanum\mes"; Flags: ignoreversion
Source: "korean\modules\Arcanum\oemes\*"; DestDir: "{app}\modules\Arcanum\oemes"; Flags: ignoreversion

; === DLG 에디터 ===
Source: "korean\tools\arcanum_dlg_editor.html"; DestDir: "{app}\tools"; Flags: ignoreversion

[InstallDelete]
; Vormantown 모듈 제거 (한글 미지원 + gamedesc.mes 충돌 방지)
Type: filesandordirs; Name: "{app}\modules\Vormantown"
Type: files; Name: "{app}\modules\Vormantown.dat"
Type: files; Name: "{app}\modules\Vormantown.PATCH9"
; UAP가 남긴 잘못된 백업 정리
Type: files; Name: "{app}\modules\Arcanum\mes\gamedesc.mes.bak_original"

[Run]
Filename: "{app}\Arcanum_CN_Font.exe"; Description: "아카넘 실행 (한글 폰트 패치)"; Flags: nowait postinstall skipifsilent unchecked

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
