unit uSRRFunction;

interface

uses Classes, SysUtils , StrUtils, DateUtils, {*FileCtrl,*}
   tttData, uNetSessionData, uSnapshotUtils, uLibSettingTTT;

type
  TRecFileHeader = record
    PrimaryID   : string[12];
    SecondaryID : string[12];
    Version  : integer;
    Revision : integer;
  end;

  TRecsInfo = class
    FDisplayName : string ;
    FFullName    : string ;
    FDateTime    : TDateTime;
    HInfo        : TRecScenario_Definition;
  end;

  TSnapshotInfo = class
    FDisplayName : string ;
    FFullName    : string ;
    FDateTime    : TDateTime;
    HInfo        : TSnapshotUtilsHeader;
  end;

  TStoredObject = class
    FTick : Int64;
    FRecordType : Integer;
    FSizeRecord : Integer;
    FStreamData : TStream;
  end;


const
  cSnapsExt      = '.dsnap';
  cBuffSnapsExt      = '.bsnap';
  cSnapsFolder   = '\snaps\';
  cRecsExt       = '.recs';
  cRecsFolder    = '\recs\';

  { File Header }
  CONST_PrimaryID   = 'ARCSREPLAY  ';
  CONST_SecondaryID = '11.05.2005  ';
  CONST_Version   = 1;
  CONST_Revision  = 2;

  CONST_FileReplayCurrentVersion: TRecFileHeader =
    ( PrimaryID   : CONST_PrimaryID;
      SecondaryID : CONST_SecondaryID;
      Version     : CONST_Version;
      Revision    : CONST_Revision;);

function GetDateRecsSnapshotName( FName : string ) : TDateTime ;

function GetSnapshotFullNameNameFromDisplayName( const id : integer  ; FDisplay : string ) : string ;
procedure GetScenarioListFile ( Path : string ; FilterScenario : Integer; var aList : TStringList ) ;
procedure AddScenarioListInfo ( Path : string ; FilterScenario : Integer; var aList : TList ) ;
procedure AddAllScenarioListInfo ( Path : string ; var aList : TList ) ;

function GetScenarioIDFromFileHeader (const FFullName : string): integer;
function NewSnapshotWithParams ( const id : integer ; const add : string) : string ;
function NewSnapshotFileName : string ;
function GetSnapshotDir : string;
function GetFullNameSnapshotFileFromName ( s : string ) : string;
function GetEventSnapshotFileFromName ( s : string ) : string;
function ValidSnapshotExt ( FFullName : string ) : boolean ;
function GetScenarioHeaderInfoFromFile (const FFullName : string): TSnapshotUtilsHeader;
function GetSnapshotInfoFromFile (const s : string): TSnapshotInfo;
function GetSnapshotNameWithOutExt( FName : string ) : string ;

function NewRecsFileName : string ;
function GetRecsDir : string;
function GetFullNameRecsFileFromName ( s : string ) : string;
function GetFullNameRecsFileFromNameTXT ( s : string ) : string;
function ValidRecsExt ( FFullName : string ) : boolean ;
function GetRecsNameWithOutExt( FName : string ) : string ;
function GetRecScenarioIDFromFileHeader(const FFullName : string): integer;

procedure GetRecsListFile ( Path : string ; FilterScenario : Integer ; var aList : TStringList ) ;
procedure AddRecsListInfo ( Path : string ; FilterScenario : Integer ; var aList : TList ) ;
procedure AddAllRecsListInfo ( Path : string ; var aList : TList ) ;

function GetRootRecordPath : string ;

function UseSnapshot (const vSet: TGameDataSetting) : boolean ;

function IsValidFileRecorded (const vSet: TGameDataSetting) : boolean ;

implementation

{
function GetDateRecsSnapshotName( FName : string ) : TDateTime ;
var
  d,m,y : word ;
  h,mm, s, zz : word ;
begin
  y := StrToInt(MidStr(FName,4,4)); // RC-2010
  m := StrToInt(MidStr(FName,8,2)); // RC-201002
  d := StrToInt(MidStr(FName,10,2)); // RC-20100230
  h := StrToInt(MidStr(FName,12,2)); // RC-2010023008
  mm := StrToInt(MidStr(FName,14,2)); // RC-201002300802
  s := StrToInt(MidStr(FName,16,2)); // RC-20100230080255
  zz := StrToInt(MidStr(FName,18,2)); // RC-2010023008025513
  Result := EncodeDateTime(y,m,d,h,mm,s,zz);
end;
}

function GetScenarioIDFromFileDisplayName(const vSet: TGameDataSetting) : integer;
var
   i : integer ;
   l : TStringList ;
   s : string;
   FileDisplayName : string;
   start : boolean ;
begin
  Result := -1;

  FileDisplayName := Trim(vSet.SnapshotName);

  if Length(FileDisplayName) > 0 then
  begin
    l := TStringList.Create;
    start := false ;

    for I := 1 to Length(FileDisplayName) do
    begin
      s := FileDisplayName[i];
      if s = '-' then
      begin
        if start = false then
        begin
          start := true;
          Continue;
        end
        else
        if start = true then
          Break;
      end
      else
      begin
        if start then l.Add(s);
      end;
    end;

    s := '';
    for I := 0 to l.Count - 1 do
    begin
      s := l.Strings[i];
    end;

    if TryStrToInt(s,i) then
      Result := i
    else
      Result := -1 ;
  end;
end;

function UseSnapshot (const vSet: TGameDataSetting) : boolean ;
var
   FullName : string;
begin
   Result := False ;
   FullName  := GetFullNameSnapshotFileFromName(vSet.SnapshotName);
   if FileExists(FullName)then
      if vSet.ScenarioID = GetScenarioIDFromFileHeader(FullName) then
      begin
         Result := true ;
      end;
end;

function GetFileModDate(filename : string) : TDateTime;
var
  F : TSearchRec;
begin
  FindFirst(filename,faAnyFile,F);
  //Result := F.Time;
  //if you wanted a TDateTime, change the return type and use this line:
  Result := FileDateToDatetime(F.Time);
  FindClose(F);
end;

function GetDateRecsSnapshotName(FName: string): TDateTime;
var
  intFileAge: TDateTime;
begin
  intFileAge := GetFileModDate(FName);
  if intFileAge = -1 then
    Result := 0
  else
    Result := intFileAge ;
end;

function GetRootRecordPath : string ;
begin
   Result := vGameDataSetting.RootRecordPath;
end;

function GetSnapshotNameWithOutExt( FName : string ) : string ;
begin
  Result := LeftStr(FName,Length(FName)-Length(cSnapsExt));
end;

function GetSnapshotDisplayNameFromFullName( FName : string ) : string ;
var
  i : integer ;
  l : TStringList ;
  s : string ;
begin
  l := TStringList.Create;
  for I := Length(FName) downto 1 do begin
     if i > (Length(FName)-Length(cSnapsExt))then
        continue
     else if FName[i] = '-' then
        break
     else
        l.Add(FName[i]);
  end;
  s := '';
  for I := l.Count-1 downto 0 do begin
     s := s + l.Strings[i];
  end;
  FreeAndNil(l);
  Result :=  s ;
end;

function GetSnapshotFullNameNameFromDisplayName( const id : integer  ; FDisplay : string ) : string ;
var
  i : integer ;
  l : TStringList ;
  s : string ;
begin
  l := TStringList.Create;
  for I := Length(FDisplay) downto 1 do begin
     if FDisplay[i] = '-' then
        break
     else
        l.Add(FDisplay[i]);
  end;
  s := '';
  for I := l.Count-1 downto 0 do begin
     s := s + l.Strings[i];
  end;
  FreeAndNil(l);
  Result :=  GetSnapshotDir + 'SN-'+IntToStr(id)+'-'+ s + cSnapsExt;
end;


function ValidSnapshotExt( FFullName : string ) : boolean ;
var
  ext : string ;
begin
  //Result := False;
  ext := ExtractFileExt(FFullName) ;
  if ext = cSnapsExt then
     Result := true
  else
    raise Exception.CreateFmt('Failed to load from file "%s". Incorrect stream file name.', [FFullName]);
end;

function NewSnapshotWithParams ( const id : integer ; const add : string ) : string ;
begin
  Result := 'SN-'+IntToStr(id)+'-'+add ;
end;

function NewSnapshotFileName : string ;
begin
  Result := 'SN-'+FormatDateTime('yyyymmddhhnnsszzz',now) ;
end;

function GetSnapshotDir : string;
var
  s : string ;
begin
  s := {ExtractFileDir(ParamStr(0))} GetRootRecordPath + cSnapsFolder ;
  if not DirectoryExists(s) then ForceDirectories(s);
  Result := s ;
end;

function GetFullNameSnapshotFileFromName ( s : string ) : string;
begin
  Result := GetSnapshotDir + s + cSnapsExt; // bin/data/snap/*.snap
end;

function GetEventSnapshotFileFromName ( s : string ) : string;
begin
  Result := GetSnapshotDir + s + cBuffSnapsExt; // bin/data/snap/*.snap
end;

procedure GetScenarioListFile ( Path : string ; FilterScenario : Integer ; var aList : TStringList ) ;
var
  SR : TSearchRec;
  dspName : string ;
begin
  if aList = nil then exit ;
  if FindFirst(Path+'\*'+cSnapsExt, faAnyFile, SR) = 0 then
  repeat
    if GetScenarioIDFromFileHeader(Path + SR.Name) = FilterScenario then
    begin
      dspName := GetSnapshotNameWithOutExt(SR.Name);
      aList.Add(dspName);
    end;
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

procedure AddAllScenarioListInfo ( Path : string ; var aList : TList ) ;
var
  SR : TSearchRec;
  snInfo : TSnapshotInfo ;
begin
  if aList = nil then exit ;
  if FindFirst(Path+'\*'+cSnapsExt, faAnyFile, SR) = 0 then
  repeat
    snInfo := GetSnapshotInfoFromFile(GetSnapshotNameWithOutExt(SR.Name));
    if (( snInfo.HInfo.TypeVersion = cSSUTILS_FILE_VERSION ) and
       (snInfo.HInfo.Stream.Version = cSSUTILS_STREAM_VERSION )) then
        aList.Add(snInfo);
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

procedure AddScenarioListInfo ( Path : string ; FilterScenario : Integer ; var aList : TList ) ;
var
  SR : TSearchRec;
  snInfo : TSnapshotInfo ;
begin
  if aList = nil then exit ;
  if FindFirst(Path+'\*'+cSnapsExt, faAnyFile, SR) = 0 then
  repeat
    snInfo := GetSnapshotInfoFromFile(GetSnapshotNameWithOutExt(SR.Name));
    if snInfo.HInfo.Stream.ScenarioID = FilterScenario then
    begin
      aList.Add(snInfo);
    end;
  until FindNext(SR) <> 0;
  FindClose(SR);
end;


function GetScenarioIDFromFileHeader(const FFullName : string): integer;
var
  lFile    : TFileStream;
  lHeader  : TSnapshotUtilsHeader;
begin
  //Result    := -1 ;
  lFile     := TFileStream.Create(FFullName, fmOpenRead or fmShareDenyWrite);
  try
     lFile.ReadBuffer(lHeader, SizeOf(TSnapshotUtilsHeader));
     Result := lHeader.Stream.ScenarioID ;
  finally
    lFile.Free;
  end;
end;


function GetScenarioHeaderInfoFromFile (const FFullName : string): TSnapshotUtilsHeader;
var
  lFile    : TFileStream;
  lHeader  : TSnapshotUtilsHeader;
begin
  lFile     := TFileStream.Create(FFullName, fmOpenRead or fmShareDenyWrite);
  try
     lFile.ReadBuffer(lHeader, SizeOf(TSnapshotUtilsHeader));
     Result := lHeader ;
  finally
    lFile.Free;
  end;
end;

function GetSnapshotInfoFromFile (const s : string): TSnapshotInfo;
var
  lFile     : TFileStream;
  lHeader   : TSnapshotUtilsHeader;
  SFullName : String ;
begin
  SFullName := GetFullNameSnapshotFileFromName(s);
  lFile     := TFileStream.Create(SFullName, fmOpenRead or fmShareDenyWrite);
  try
     lFile.ReadBuffer(lHeader, SizeOf(TSnapshotUtilsHeader));
     Result := TSnapshotInfo.Create;
     with Result do
     begin
        FDisplayName  := GetSnapshotDisplayNameFromFullName(SFullName); //GetSnapshotNameWithOutExt(ExtractFileName(SFullName));
        FFullName     := SFullName;
        HInfo         := lHeader ;
        FDateTime     := lHeader.Stream.TimeInfo  ; //GetDateRecsSnapshotName(FFullName);

     end;
  finally
    lFile.Free;
  end;
end;

function GetRecsNameWithOutExt( FName : string ) : string ;
begin
  Result := LeftStr(FName,Length(FName)-Length(cRecsExt))
end;

function ValidRecsExt( FFullName : string ) : boolean ;
var
  ext : string ;
begin
  ext := ExtractFileExt(FFullName) ;
  if ext = cRecsExt then
     Result := true
  else
    raise Exception.CreateFmt('Failed to load from file "%s". Incorrect stream file name.', [FFullName]);
end;

function NewRecsFileName : string ;
begin
   Result := 'RC-'+FormatDateTime('yyyymmddhhnnsszzz',now);
end;

function GetRecsDir : string;
var
  s : string ;
begin
  s := {ExtractFileDir(ParamStr(0))} GetRootRecordPath + cRecsFolder ;
  if not DirectoryExists(s) then ForceDirectories(s);
  Result := s ;
end;

function GetFullNameRecsFileFromName ( s : string ) : string;
begin
  Result := GetRecsDir + s + cRecsExt; // bin/data/recs/*.recs
end;

function GetFullNameRecsFileFromNameTXT ( s : string ) : string;
begin
  Result := GetRecsDir + s + '.txt';
end;

function GetRecScenarioIDFromFileHeader(const FFullName : string): integer;
var
  lFile     : TFileStream;
  lHeader   : TRecFileHeader;
  lScen     : TRecScenario_Definition;
begin
  //Result    := -1 ;
  lFile     := TFileStream.Create(FFullName, fmOpenRead or fmShareDenyWrite);
  try
     lFile.ReadBuffer(lHeader, SizeOf(TRecFileHeader));
     lFile.Seek(2, soCurrent);
     lFile.ReadBuffer(lScen, SizeOf(TRecScenario_Definition));
     Result := lScen.Scenario_Index  ;
  finally
    lFile.Free;
  end;
end;



procedure GetRecsListFile ( Path : string ; FilterScenario : Integer ; var aList : TStringList ) ;
var
  SR : TSearchRec;
  dspName : string ;
begin
  if aList = nil then exit ;
  if FindFirst(Path+'\*'+cRecsExt, faAnyFile, SR) = 0 then
  repeat
    if GetRecScenarioIDFromFileHeader(Path + SR.Name) = FilterScenario then
    begin
      dspName := GetRecsNameWithOutExt(SR.Name);
      aList.Add(dspName);
    end;
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

function GetRecsInfoFromFile (const s : string): TRecsInfo;
var
  lFile     : TFileStream;
  lHeader   : TRecFileHeader;
  lScen     : TRecScenario_Definition;
  SFullName : String ;
begin
  Result    := nil;
  SFullName := GetFullNameRecsFileFromName(s);
  lFile     := TFileStream.Create(SFullName, fmOpenRead or fmShareDenyWrite);
  try
    lFile.ReadBuffer(lHeader, SizeOf(TRecFileHeader));
    if (lHeader.PrimaryID <> CONST_FileReplayCurrentVersion.PrimaryID)
        or (lHeader.SecondaryID <> CONST_FileReplayCurrentVersion.SecondaryID)
        or (lHeader.Version <> CONST_FileReplayCurrentVersion.Version)
        or (lHeader.Revision <> CONST_FileReplayCurrentVersion.Revision)
        then begin

       raise Exception.Create('Invalid File Replay.');
       exit;

    end;
    lFile.Seek(2, soCurrent);
    lFile.ReadBuffer(lScen, SizeOf(TRecScenario_Definition));

    Result := TRecsInfo.Create;
    with Result do
    begin
      FDisplayName  := GetRecsNameWithOutExt(ExtractFileName(SFullName));
      FFullName     := SFullName;
      FDateTime     := GetDateRecsSnapshotName(SFullName);
      HInfo         := lScen ;
    end;

  finally
    lFile.Free;
  end;
end;

procedure AddRecsListInfo ( Path : string ; FilterScenario : Integer ; var aList : TList ) ;
var
  SR : TSearchRec;
  snInfo : TRecsInfo ;
begin
  if aList = nil then exit ;
  if FindFirst(Path+'\*'+cRecsExt, faAnyFile, SR) = 0 then
  repeat
    snInfo := GetRecsInfoFromFile(GetRecsNameWithOutExt(SR.Name));
    if snInfo.HInfo.Scenario_Index = FilterScenario then
    begin
      aList.Add(snInfo);
    end;
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

procedure AddAllRecsListInfo ( Path : string ; var aList : TList ) ;
var
  SR : TSearchRec;
  snInfo : TRecsInfo ;
begin
  if aList = nil then exit ;
  if FindFirst(Path+'\*'+cRecsExt, faAnyFile, SR) = 0 then
  repeat
    snInfo := GetRecsInfoFromFile(GetRecsNameWithOutExt(SR.Name));
    aList.Add(snInfo);
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

function IsValidFileRecorded (const vSet: TGameDataSetting) : boolean ;
var
   FullName : string;
begin
   Result := False ;
   if Length(Trim(vSet.GamePlayMode.RecFileName))> 0 then
   begin
      FullName  := GetFullNameRecsFileFromName(Trim(vSet.GamePlayMode.RecFileName));
      if FileExists(FullName) then
      begin
        if  vSet.ScenarioID = GetRecScenarioIDFromFileHeader(FullName) then
          Result := true ;
      end;
   end;
end;

end.
