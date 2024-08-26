unit uSnapshotUtils;

interface

uses
  Windows, SysUtils, Classes, TypInfo, RTLConsts, tttData;

type

{$IF CompilerVersion >= 20.0}
  {$DEFINE SSUTILS_UNICODE}
{$IFEND}

{$IFNDEF SSUTILS_UNICODE}
  UnicodeString = WideString;
{$ENDIF}

{ TSnapshotUtilsOption }

  TSnapshotUtilsOption = (
    ssuAnsiStringCodePage,
    ssuUTF16ToUTF8,
    ssuLimitToWordSize
  );

  TSnapshotUtilsOptions = set of TSnapshotUtilsOption;

const
  // Default options set
  TSnapshotUtilsDefaultOptions = [
    ssuAnsiStringCodePage

{$IFDEF SSUTILS_DEFAULT_UTF8}
    ,ssuUTF16ToUTF8
{$ENDIF}

{$IFDEF SSUTILS_DEFAULT_WORDSIZE}
    ,ssuLimitToWordSize
{$ENDIF}
  ];

  TSnapshotUtilsNetworkSafeOptions = [
    ssuAnsiStringCodePage,
    ssuUTF16ToUTF8
  ];

  TSnapshotUtilsNetworkUnsafeOptions = [
    ssuUTF16ToUTF8,
    ssuLimitToWordSize
  ];

type

  ESSUtils = class(Exception);

  ESSUtilsInvalidType = class(ESSUtils)
  private
    FTypeKind: TTypeKind;
  public
    constructor Create(ATypeKind: TTypeKind);

    property TypeKind: TTypeKind read FTypeKind;
  end;

  ESSUtilsWordLimit = class(ESSUtils)
  public
    constructor Create(ALen: Integer); reintroduce;
  end;

  TSnapshotUtils = class
    class function Compare(const ASSUtilsType1, ASSUtilsType2;
      ATypeInfo: PTypeInfo): Boolean;

    class function GetSize(const ASSUtilsType; ATypeInfo: PTypeInfo;
      const AOptions: TSnapshotUtilsOptions = TSnapshotUtilsDefaultOptions): Cardinal;

    class procedure WriteTo(AStream: TStream; const ASSUtilsType;
      ATypeInfo: PTypeInfo; FScenarioID : Integer = 1 ; AVersion: Word = 1;
      const AOptions: TSnapshotUtilsOptions = TSnapshotUtilsDefaultOptions;
      APreAllocSize: Boolean = True);

    class function ReadFrom(AStream: TStream; const ASSUtilsType;
      ATypeInfo: PTypeInfo; AVersion: Word = 1): Boolean;

    class function GetSizeNH(const ASSUtilsType; ATypeInfo: PTypeInfo;
      const AOptions: TSnapshotUtilsOptions = TSnapshotUtilsDefaultOptions): Cardinal;

    class procedure WriteToNH(AStream: TStream; const ASSUtilsType;
      ATypeInfo: PTypeInfo;
      const AOptions: TSnapshotUtilsOptions = TSnapshotUtilsDefaultOptions);

    class procedure ReadFromNH(AStream: TStream; const ASSUtilsType;
      ATypeInfo: PTypeInfo;
      const AOptions: TSnapshotUtilsOptions = TSnapshotUtilsDefaultOptions);
  end;

  TSnapshotUtilsHeader = packed record
    Stream: record
      ScenarioID : Integer ;
      TimeInfo   : TDateTime;
      Version    : Byte;
      Options    : Byte;
    end;
    TypeVersion: Word;
  end;

  _SS_CubAssign = record
    GroupID   : Integer;
    LongIP    : LongWord;
    AssList   : array of Integer;
  end;

  _SS_CubGroupMember = record
    FData        : TRecCubicle_Group_Assignment;
    Instance_Name: string;
  end;

  _SS_CubGroup = record
    FData        : TRecCubicle_Group;
    FSList       : array of _SS_CubGroupMember ;
    CubicleName  : string;
  end;

  _SSA_CubGroup  = array of _SS_CubGroup;
  _SSA_CubAssign = array of _SS_CubAssign ;

// -----------------------------------------------------------------------------
// --- Config header options
// -----------------------------------------------------------------------------

const
  // Version (1 Byte)
  cSSUTILS_STREAM_VERSION                 = $01;
  // CFG (1 Byte)
  cSSUTILS_STREAM_CFG_UNICODE             = $01;
  cSSUTILS_STREAM_CFG_UTF8                = $02;  // ssuUTF16ToUTF8
  cSSUTILS_STREAM_CFG_WORDSIZE            = $04;  // ssuLimitToWordSize
  cSSUTILS_STREAM_CFG_CODEPAGE            = $08;  // ssuAnsiStringCodePage
//cSSUTILS_STREAM_CFG_XXX                 = $10;
//cSSUTILS_STREAM_CFG_XXX                 = $20;
//cSSUTILS_STREAM_CFG_XXX                 = $40;
//cSSUTILS_STREAM_CFG_XXX                 = $80;

  cSSUTILS_FILE_VERSION                   = 1;

implementation


type

  PPTypeInfo = ^PTypeInfo;
  TFieldInfo = packed record
    TypeInfo: PPTypeInfo;
    Offset: Cardinal;
  end;

  PFieldTable = ^TFieldTable;
  TFieldTable = packed record
    X: Word;
    Size: Cardinal;
    Count: Cardinal;
    Fields: array [0..65535] of TFieldInfo;
  end;

  PDynArrayTypeInfo = ^TDynArrayTypeInfo;
  TDynArrayTypeInfo = packed record
    kind: Byte;
    name: string[0];
    elSize: Cardinal;
    elType: ^PDynArrayTypeInfo;
    varType: Integer;
  end;

function SSUtilsCompare_Array(ASSUtils1, ASSUtils2: Pointer;
  ATypeInfo: PTypeInfo; ALength: Cardinal): Boolean; forward;

function SSUtilsCompare_Record(ASSUtils1, ASSUtils2: Pointer;
  ATypeInfo: PTypeInfo): Boolean;
var
  lFieldTable: PFieldTable;
  lCompare: Cardinal;
  lOffset: Cardinal;
  lIdx: Cardinal;
  lTypeInfo: PTypeInfo;
begin
  lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lFieldTable^.Count = 0 then
  begin
    Result := CompareMem(ASSUtils1, ASSUtils2, lFieldTable^.Size);
    Exit;
  end;

  Result := False;
  lCompare := 0;
  lIdx := 0;

  while (lCompare < lFieldTable^.Size) and (lIdx < lFieldTable^.Count) do
  begin
    lOffset := lFieldTable^.Fields[lIdx].Offset;

    if lCompare < lOffset then
      if CompareMem(
        Pointer(Cardinal(ASSUtils1) + lCompare),
        Pointer(Cardinal(ASSUtils2) + lCompare),
        lOffset - lCompare
      ) then
        Inc(lCompare, lOffset - lCompare)
      else
        Exit;

    lTypeInfo := lFieldTable^.Fields[lIdx].TypeInfo^;

    if SSUtilsCompare_Array(
      Pointer(Cardinal(ASSUtils1) + lOffset),
      Pointer(Cardinal(ASSUtils2) + lOffset),
      lTypeInfo,
      1
    ) then
    begin
      case lTypeInfo^.Kind of
      tkArray, tkRecord:
        Inc(lCompare, PFieldTable(Cardinal(lTypeInfo) + Byte(lTypeInfo^.Name[0]))^.Size);
      else
        Inc(lCompare, SizeOf(Pointer));
      end;
    end else
      Exit;

    Inc(lIdx);
  end;

  if lCompare < lFieldTable^.Size then
    if not CompareMem(
      Pointer(Cardinal(ASSUtils1) + lCompare),
      Pointer(Cardinal(ASSUtils2) + lCompare),
      lFieldTable^.Size - lCompare
    ) then
      Exit;

  Result := True;
end;

function SSUtilsCompare_DynArray(ASSUtils1, ASSUtils2: Pointer;
  ATypeInfo: PTypeInfo): Boolean;
var
  lDyn: PDynArrayTypeInfo;
  lLen, lLen2: Cardinal;
begin
  if ASSUtils1 = ASSUtils2 then
  begin
    Result := True;
    Exit;
  end;

  if PPointer(ASSUtils1)^ = nil then
    lLen := 0
  else
    lLen := PCardinal(PCardinal(ASSUtils1)^ - SizeOf(Cardinal))^;

  if PPointer(ASSUtils2)^ = nil then
    lLen2 := 0
  else
    lLen2 := PCardinal(PCardinal(ASSUtils2)^ - SizeOf(Cardinal))^;

  Result := lLen = lLen2;

  if (not Result) or (lLen = 0) then
    Exit;

  lDyn := PDynArrayTypeInfo(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lDyn^.elType = nil then
    Result := CompareMem(PPointer(ASSUtils1)^, PPointer(ASSUtils2)^, lLen * lDyn^.elSize)
  else
    Result := SSUtilsCompare_Array(
      PPointer(ASSUtils1)^,
      PPointer(ASSUtils2)^,
      PTypeInfo(lDyn^.elType^),
      lLen
    );
end;

function SSUtilsCompare_Array(ASSUtils1, ASSUtils2: Pointer;
  ATypeInfo: PTypeInfo; ALength: Cardinal): Boolean;
var
  lFieldTable: PFieldTable;
begin
  Result := (ALength = 0) or (ASSUtils1 = ASSUtils2);

  if Result then
    Exit;

  case ATypeInfo^.Kind of
  tkLString:
    while ALength > 0 do
    begin
      if ASSUtils1 <> ASSUtils2 then
        if PAnsiString(ASSUtils1)^ <> PAnsiString(ASSUtils2)^ then
          Exit;

      Inc(PPointer(ASSUtils1));
      Inc(PPointer(ASSUtils2));
      Dec(ALength);
    end;

  tkWString:
    while ALength > 0 do
    begin
      if ASSUtils1 <> ASSUtils2 then
        if PWideString(ASSUtils1)^ <> PWideString(ASSUtils2)^ then
          Exit;

      Inc(PPointer(ASSUtils1));
      Inc(PPointer(ASSUtils2));
      Dec(ALength);
    end;

{$IFDEF SSUTILS_UNICODE}
  tkUString:
    while ALength > 0 do
    begin
      if ASSUtils1 <> ASSUtils2 then
        if PUnicodeString(ASSUtils1)^ <> PUnicodeString(ASSUtils2)^ then
          Exit;

      Inc(PPointer(ASSUtils1));
      Inc(PPointer(ASSUtils2));
      Dec(ALength);
    end;
{$ENDIF}

  tkArray:
    begin
      lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        if not SSUtilsCompare_Array(ASSUtils1, ASSUtils2, lFieldTable.Fields[0].TypeInfo^, lFieldTable.Count) then
          Exit;

        Inc(Integer(ASSUtils1), lFieldTable.Size);
        Inc(Integer(ASSUtils2), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkRecord:
    begin
      lFieldTable := PFieldTable(Integer(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        if not SSUtilsCompare_Record(ASSUtils1, ASSUtils2, ATypeInfo) then
          Exit;

        Inc(Integer(ASSUtils1), lFieldTable.Size);
        Inc(Integer(ASSUtils2), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkDynArray:
    while ALength > 0 do
    begin
      if not SSUtilsCompare_DynArray(ASSUtils1, ASSUtils2, ATypeInfo) then
        Exit;

      Inc(PPointer(ASSUtils1));
      Inc(PPointer(ASSUtils2));
      Dec(ALength);
    end;
  else
    raise ESSUtilsInvalidType.Create(ATypeInfo^.Kind);
  end;

  Result := True;
end;

// -----------------------------------------------------------------------------
// --- GetSize
// -----------------------------------------------------------------------------

function SSUtilsGetSize_Array(ASSUtils: Pointer; ATypeInfo: PTypeInfo;
  ALength: Cardinal; const AOptions: TSnapshotUtilsOptions): Cardinal; forward;

function SSUtilsGetSize_Record(ASSUtils: Pointer; ATypeInfo: PTypeInfo;
  const AOptions: TSnapshotUtilsOptions): Cardinal;
var
  lFieldTable: PFieldTable;
  lCompare: Cardinal;
  lOffset: Cardinal;
  lIdx: Cardinal;
  lTypeInfo: PTypeInfo;
begin
  lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lFieldTable^.Count = 0 then
  begin
    Result := lFieldTable^.Size;
    Exit;
  end;

  lCompare := 0;
  lIdx := 0;
  Result := 0;

  while (lCompare < lFieldTable^.Size) and (lIdx < lFieldTable^.Count) do
  begin
    lOffset := lFieldTable^.Fields[lIdx].Offset;

    if lCompare < lOffset then
    begin
      Inc(Result, lOffset - lCompare);

      Inc(lCompare, lOffset - lCompare)
    end;

    lTypeInfo := lFieldTable^.Fields[lIdx].TypeInfo^;

    Inc(Result, SSUtilsGetSize_Array(
      Pointer(Cardinal(ASSUtils) + lOffset),
      lTypeInfo,
      1,
      AOptions
    ));

    case lTypeInfo^.Kind of
    tkArray, tkRecord:
      Inc(lCompare, PFieldTable(Cardinal(lTypeInfo) + Byte(lTypeInfo^.Name[0]))^.Size);
    else
      Inc(lCompare, SizeOf(Pointer));
    end;

    Inc(lIdx);
  end;

  if lCompare < lFieldTable^.Size then
    Inc(Result, lFieldTable^.Size - lCompare);
end;

function SSUtilsGetSize_DynArray(ASSUtils: Pointer; ATypeInfo: PTypeInfo;
  const AOptions: TSnapshotUtilsOptions): Cardinal;
var
  lDyn: PDynArrayTypeInfo;
  lLen: Cardinal;
begin
  if ssuLimitToWordSize in AOptions then
    Result := SizeOf(Word)
  else
    Result := SizeOf(Cardinal); // dynamic array length

  if PPointer(ASSUtils)^ = nil then
    Exit;

  lLen := PCardinal(PCardinal(ASSUtils)^ - 4)^;

  if (ssuLimitToWordSize in AOptions) and (lLen > MAXWORD) then
    raise ESSUtilsWordLimit.Create(lLen);

  lDyn := PDynArrayTypeInfo(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lDyn^.elType = nil then
    Inc(Result, lLen * lDyn^.elSize)
  else
    Inc(Result, SSUtilsGetSize_Array(
      PPointer(ASSUtils)^,
      PTypeInfo(lDyn^.elType^),
      lLen,
      AOptions
    ));
end;

function SSUtilsGetSize_Array(ASSUtils: Pointer; ATypeInfo: PTypeInfo;
  ALength: Cardinal; const AOptions: TSnapshotUtilsOptions): Cardinal;
var
  lFieldTable: PFieldTable;
  lLen: Integer;
begin
  Result := 0;

  if ALength = 0 then
    Exit;

  case ATypeInfo^.Kind of
  tkLString:
    while ALength > 0 do
    begin
      if ssuLimitToWordSize in AOptions then
        Inc(Result, SizeOf(Word))  // string length
      else
        Inc(Result, SizeOf(Integer)); // string length

      if PPointer(ASSUtils)^ <> nil then
      begin
        lLen := Length(PAnsiString(ASSUtils)^);

        if lLen > 0 then
        begin
          if (ssuLimitToWordSize in AOptions) and (lLen > MAXWORD) then
            raise ESSUtilsWordLimit.Create(lLen);

          Inc(Result, lLen * SizeOf(AnsiChar));
          if ssuAnsiStringCodePage in AOptions then
            Inc(Result, SizeOf(Word) {CodePage});
        end;
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;

  tkWString:
    while ALength > 0 do
    begin
      if ssuLimitToWordSize in AOptions then
        Inc(Result, SizeOf(Word))  // string length
      else
        Inc(Result, SizeOf(Integer)); // string length

      if PPointer(ASSUtils)^ <> nil then
      begin
        lLen := Length(PWideString(ASSUtils)^);

        if lLen > 0 then
        begin
          if ssuUTF16ToUTF8 in AOptions then
          begin
            lLen := WideCharToMultiByte(
              CP_UTF8, 0,
              PWideChar(ASSUtils^), lLen,
              nil, 0,
              nil, nil);

            if lLen = 0 then
              RaiseLastOSError;
          end;

          if (ssuLimitToWordSize in AOptions) and (lLen > MAXWORD) then
            raise ESSUtilsWordLimit.Create(lLen);

          if ssuUTF16ToUTF8 in AOptions then
            Inc(Result, lLen)
          else
            Inc(Result, lLen * SizeOf(WideChar));
        end;
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;

{$IFDEF SSUTILS_UNICODE}
  tkUString:
    while ALength > 0 do
    begin
      if ssuLimitToWordSize in AOptions then
        Inc(Result, SizeOf(Word))  // string length
      else
        Inc(Result, SizeOf(Integer)); // string length

      if PPointer(ASSUtils)^ <> nil then
      begin
        lLen := Length(PUnicodeString(ASSUtils)^);

        if lLen > 0 then
        begin
          if ssuUTF16ToUTF8 in AOptions then
          begin
            lLen := WideCharToMultiByte(
              CP_UTF8, 0,
              PWideChar(ASSUtils^), lLen,
              nil, 0,
              nil, nil);

            if lLen = 0 then
              RaiseLastOSError;
          end;

          if (ssuLimitToWordSize in AOptions) and (lLen > MAXWORD) then
            raise ESSUtilsWordLimit.Create(lLen);

          if ssuUTF16ToUTF8 in AOptions then
            Inc(Result, lLen)
          else
            Inc(Result, lLen * SizeOf(WideChar));
        end;
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;
{$ENDIF}

  tkArray:
    begin
      lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        Inc(Result, SSUtilsGetSize_Array(
          ASSUtils,
          lFieldTable.Fields[0].TypeInfo^,
          lFieldTable.Count,
          AOptions
        ));

        Inc(Integer(ASSUtils), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkRecord:
    begin
      lFieldTable := PFieldTable(Integer(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        Inc(Result, SSUtilsGetSize_Record(ASSUtils, ATypeInfo, AOptions));
        Inc(Integer(ASSUtils), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkDynArray:
    while ALength > 0 do
    begin
      Inc(Result, SSUtilsGetSize_DynArray(ASSUtils, ATypeInfo, AOptions));
      Inc(Integer(ASSUtils), SizeOf(Integer));
      Dec(ALength);
    end;
  else
    raise ESSUtilsInvalidType.Create(ATypeInfo^.Kind);
  end;
end;

// -----------------------------------------------------------------------------
// --- Write
// -----------------------------------------------------------------------------

procedure SSUtilsWrite_Array(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; ALength: Cardinal; const AOptions: TSnapshotUtilsOptions); forward;

procedure SSUtilsWrite_Record(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions);
var
  lFieldTable: PFieldTable;
  lCompare: Cardinal;
  lOffset: Cardinal;
  lIdx: Cardinal;
  lTypeInfo: PTypeInfo;
begin
  lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lFieldTable^.Count = 0 then
  begin
    AStream.WriteBuffer(PByte(ASSUtils)^, lFieldTable.Size);
    Exit;
  end;

  lCompare := 0;
  lIdx := 0;

  while (lCompare < lFieldTable^.Size) and (lIdx < lFieldTable^.Count) do
  begin
    lOffset := lFieldTable^.Fields[lIdx].Offset;

    if lCompare < lOffset then
    begin
      AStream.WriteBuffer(PByte((Cardinal(ASSUtils) + lCompare))^, lOffset - lCompare);

      Inc(lCompare, lOffset - lCompare);
    end;

    lTypeInfo := lFieldTable^.Fields[lIdx].TypeInfo^;

    SSUtilsWrite_Array(
      AStream,
      Pointer(Cardinal(ASSUtils) + lOffset),
      lTypeInfo,
      1,
      AOptions
    );

    case lTypeInfo^.Kind of
    tkArray, tkRecord:
      Inc(lCompare, PFieldTable(Cardinal(lTypeInfo) + Byte(lTypeInfo^.Name[0]))^.Size);
    else
      Inc(lCompare, SizeOf(Pointer));
    end;

    Inc(lIdx);
  end;

  if lCompare < lFieldTable^.Size then
    AStream.WriteBuffer(PByte(Cardinal(ASSUtils) + lCompare)^, lFieldTable^.Size - lCompare);
end;

procedure SSUtilsWrite_DynArray(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions);
var
  lDyn: PDynArrayTypeInfo;
  lLen: Cardinal;
begin
  if PPointer(ASSUtils)^ = nil then
    lLen := 0
  else
    lLen := PCardinal(PCardinal(ASSUtils)^ - SizeOf(Cardinal))^;

  if ssuLimitToWordSize in AOptions then
  begin
    if lLen > MAXWORD then
      raise ESSUtilsWordLimit.Create(lLen);

    AStream.WriteBuffer(lLen, SizeOf(Word));
  end else
    AStream.WriteBuffer(lLen, SizeOf(Cardinal));

  if lLen = 0 then
    Exit;

  lDyn := PDynArrayTypeInfo(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lDyn^.elType = nil then
    AStream.WriteBuffer(PByte(ASSUtils^)^, lLen * lDyn^.elSize)
  else
    SSUtilsWrite_Array(
      AStream,
      PPointer(ASSUtils)^,
      PTypeInfo(lDyn^.elType^),
      lLen,
      AOptions
    );
end;

procedure SSUtilsWrite_UTF16AsUFT8(AStream: TStream; APWideChar: PPWideChar;
  ALen: Cardinal; const AOptions: TSnapshotUtilsOptions);
var
  lUTF8: PAnsiChar;
  lLen: Integer;
  lErr: DWORD;
begin
  if ALen = 0 then
  begin
    if ssuLimitToWordSize in AOptions then
      AStream.WriteBuffer(ALen, SizeOf(Word))
    else
      AStream.WriteBuffer(ALen, SizeOf(Cardinal));

    Exit;
  end;

  // Allocate buffer to cover whole Unicode BMP in UTF-8
  GetMem(lUTF8, ALen * 3);
  lLen := WideCharToMultiByte(
    CP_UTF8, 0,
    APWideChar^, ALen,
    lUTF8, ALen * 3,
    nil, nil);

  // Very rare case (if ALen*3 is too small) - for strings filled with chars of Unicode Supplementary Plane
  if lLen = 0 then
  begin
    lErr := GetLastError; // FreeMem can call eg. VirtualFree, so GLE must be saved before FreeMem call

    FreeMem(lUTF8); // FreeMem here instead of ReallocMem below to prevent
                    // memory leak, in case of possible EOutOfMemory in ReallocMem

    if lErr <> ERROR_INSUFFICIENT_BUFFER then
      RaiseLastOSError(lErr);

    // Get required buf size and allocate it
    lLen := WideCharToMultiByte(
      CP_UTF8, 0,
      APWideChar^, ALen,
      nil, 0,
      nil, nil);

    if lLen = 0 then
      RaiseLastOSError;

    GetMem(lUTF8, lLen);

    // Convert to UTF8
    lLen := WideCharToMultiByte(
      CP_UTF8, 0,
      APWideChar^, ALen,
      lUTF8, lLen,
      nil, nil);

    if lLen = 0 then
    begin
      lErr := GetLastError;
      FreeMem(lUTF8);

      RaiseLastOSError(lErr);
    end;
  end;

  if ssuLimitToWordSize in AOptions then
  begin
    if lLen > MAXWORD then
    begin
      FreeMem(lUTF8);
      raise ESSUtilsWordLimit.Create(lLen);
    end;

    if AStream.Write(lLen, SizeOf(Word)) <> SizeOf(Word) then
    begin
      FreeMem(lUTF8);
      raise EWriteError.CreateRes(@SWriteError);
    end;
  end else
    if AStream.Write(lLen, SizeOf(Cardinal)) <> SizeOf(Cardinal) then
    begin
      FreeMem(lUTF8);
      raise EWriteError.CreateRes(@SWriteError);
    end;

  if AStream.Write(lUTF8^, lLen) <> lLen then
  begin
    FreeMem(lUTF8);
    raise EWriteError.CreateRes(@SWriteError);
  end;

  FreeMem(lUTF8);
end;

procedure SSUtilsWrite_Array(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; ALength: Cardinal; const AOptions: TSnapshotUtilsOptions);
var
  lFieldTable: PFieldTable;
  lLen: Cardinal;
  lCP: Word;
begin
  if ALength = 0 then
    Exit;

  case ATypeInfo^.Kind of
  tkLString:
    while ALength > 0 do
    begin
      if PPointer(ASSUtils)^ = nil then
        lLen := 0
      else
        lLen := Length(PAnsiString(ASSUtils)^);

      if ssuLimitToWordSize in AOptions then
      begin
        if lLen > MAXWORD then
          raise ESSUtilsWordLimit.Create(lLen);

        AStream.WriteBuffer(lLen, SizeOf(Word));
      end else
        AStream.WriteBuffer(lLen, SizeOf(Cardinal));;

      if lLen > 0 then
      begin
        AStream.WriteBuffer(PByte(ASSUtils^)^, lLen * SizeOf(AnsiChar));

        if ssuAnsiStringCodePage in AOptions then
        begin
{$IFDEF SSUTILS_UNICODE}
          lCP := PWord(PCardinal(ASSUtils)^ - 12)^; // StrRec.codePage
{$ELSE}
          lCP := GetACP; // TODO: System.DefaultSystemCodePage
{$ENDIF}
          AStream.WriteBuffer(lCP, SizeOf(Word));
        end;
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;

  tkWString:
    while ALength > 0 do
    begin
      if PPointer(ASSUtils)^ = nil then
        lLen := 0
      else
        lLen := Length(PWideString(ASSUtils)^);

      if ssuUTF16ToUTF8 in AOptions then
        SSUtilsWrite_UTF16AsUFT8(AStream, ASSUtils, lLen, AOptions)
      else
      begin
        if ssuLimitToWordSize in AOptions then
        begin
          if lLen > MAXWORD then
            raise ESSUtilsWordLimit.Create(lLen);

          AStream.WriteBuffer(lLen, SizeOf(Word));
        end else
          AStream.WriteBuffer(lLen, SizeOf(Cardinal));;

        if lLen > 0 then
          AStream.WriteBuffer(PByte(ASSUtils^)^, lLen * SizeOf(WideChar));
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;

{$IFDEF SSUTILS_UNICODE}
  tkUString:
    while ALength > 0 do
    begin
      if PPointer(ASSUtils)^ = nil then
        lLen := 0
      else
        lLen := Length(PUnicodeString(ASSUtils)^);

      if ssuUTF16ToUTF8 in AOptions then
        SSUtilsWrite_UTF16AsUFT8(AStream, ASSUtils, lLen, AOptions)
      else
      begin
        if ssuLimitToWordSize in AOptions then
        begin
          if lLen > MAXWORD then
            raise ESSUtilsWordLimit.Create(lLen);

          AStream.WriteBuffer(lLen, SizeOf(Word));
        end else
          AStream.WriteBuffer(lLen, SizeOf(Cardinal));;

        if lLen > 0 then
          AStream.WriteBuffer(PByte(ASSUtils^)^, lLen * SizeOf(WideChar));
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;
{$ENDIF}

  tkArray:
    begin
      lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        SSUtilsWrite_Array(AStream, ASSUtils, lFieldTable.Fields[0].TypeInfo^,
          lFieldTable.Count, AOptions);
        Inc(Integer(ASSUtils), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkRecord:
    begin
      lFieldTable := PFieldTable(Integer(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        SSUtilsWrite_Record(AStream, ASSUtils, ATypeInfo, AOptions);
        Inc(Integer(ASSUtils), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkDynArray:
    while ALength > 0 do
    begin
      SSUtilsWrite_DynArray(AStream, ASSUtils, ATypeInfo, AOptions);
      Inc(Integer(ASSUtils), SizeOf(Integer));
      Dec(ALength);
    end;
  else
    raise ESSUtilsInvalidType.Create(ATypeInfo^.Kind);
  end;
end;

// -----------------------------------------------------------------------------
// --- Read
// -----------------------------------------------------------------------------

procedure SSUtilsRead_Array(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; ALength: Cardinal; const AOptions: TSnapshotUtilsOptions); forward;

procedure SSUtilsRead_Record(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions);
var
  lFieldTable: PFieldTable;
  lCompare: Cardinal;
  lOffset: Cardinal;
  lIdx: Cardinal;
  lTypeInfo: PTypeInfo;
begin
  lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lFieldTable^.Count = 0 then
  begin
    AStream.ReadBuffer(PByte(ASSUtils)^, lFieldTable.Size);
    Exit;
  end;

  lCompare := 0;
  lIdx := 0;

  while (lCompare < lFieldTable^.Size) and (lIdx < lFieldTable^.Count) do
  begin
    lOffset := lFieldTable^.Fields[lIdx].Offset;

    if lCompare < lOffset then
    begin
      AStream.ReadBuffer(PByte(Cardinal(ASSUtils) + lCompare)^, lOffset - lCompare);
      Inc(lCompare, lOffset - lCompare);
    end;

    lTypeInfo := lFieldTable^.Fields[lIdx].TypeInfo^;

    SSUtilsRead_Array(
      AStream,
      Pointer(Cardinal(ASSUtils) + lOffset),
      lTypeInfo,
      1,
      AOptions
    );

    case lTypeInfo^.Kind of
    tkArray, tkRecord:
      Inc(lCompare, PFieldTable(Cardinal(lTypeInfo) + Byte(lTypeInfo^.Name[0]))^.Size);
    else
      Inc(lCompare, SizeOf(Pointer));
    end;

    Inc(lIdx);
  end;

  if lCompare < lFieldTable^.Size then
    AStream.ReadBuffer(PByte(Cardinal(ASSUtils) + lCompare)^, lFieldTable^.Size - lCompare);
end;

procedure SSUtilsRead_DynArray(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions);
var
  lDyn: PDynArrayTypeInfo;
  lLen: Cardinal;
begin
  if ssuLimitToWordSize in AOptions then
  begin
    lLen := 0;
    AStream.ReadBuffer(lLen, SizeOf(Word));
  end else
    AStream.ReadBuffer(lLen, SizeOf(Cardinal));

  DynArraySetLength(PPointer(ASSUtils)^, ATypeInfo, 1, @lLen);

  if lLen = 0 then
    Exit;

  lDyn := PDynArrayTypeInfo(Cardinal(ATypeInfo) + Byte(ATypeInfo^.Name[0]));

  if lDyn^.elType = nil then
    AStream.ReadBuffer(PByte(ASSUtils^)^, lLen * lDyn^.elSize)
  else
    SSUtilsRead_Array(
      AStream,
      PPointer(ASSUtils)^,
      PTypeInfo(lDyn^.elType^),
      lLen,
      AOptions
    );
end;

procedure SSUtilsRead_Array(AStream: TStream; ASSUtils: Pointer;
  ATypeInfo: PTypeInfo; ALength: Cardinal; const AOptions: TSnapshotUtilsOptions);
var
  lFieldTable: PFieldTable;
  lLen: Integer;
  lUTF8: PAnsiChar;
  lErr: DWORD;
begin
  if ALength = 0 then
    Exit;

  case ATypeInfo^.Kind of
  tkLString:
    while ALength > 0 do
    begin
      if ssuLimitToWordSize in AOptions then
      begin
        lLen := 0;
        AStream.ReadBuffer(lLen, SizeOf(Word));
      end else
        AStream.ReadBuffer(lLen, SizeOf(Cardinal));

      SetLength(PAnsiString(ASSUtils)^, lLen);

      if lLen > 0 then
      begin
        AStream.ReadBuffer(PByte(ASSUtils^)^, lLen * SizeOf(AnsiChar));
        if ssuAnsiStringCodePage in AOptions then
{$IFDEF SSUTILS_UNICODE}
          AStream.ReadBuffer(PWord(PCardinal(ASSUtils)^ - 12)^, SizeOf(Word));   // StrRec.codePage
{$ELSE}
          AStream.Seek(SizeOf(Word), soFromCurrent); // TODO: try to convert from one codepage to another
{$ENDIF}
      end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;

  tkWString:
    while ALength > 0 do
    begin
      if ssuLimitToWordSize in AOptions then
      begin
        lLen := 0;
        AStream.ReadBuffer(lLen, SizeOf(Word));
      end else
        AStream.ReadBuffer(lLen, SizeOf(Cardinal));

      if lLen = 0 then
        SetLength(PWideString(ASSUtils)^, 0)
      else
        if ssuUTF16ToUTF8 in AOptions then
        begin
          // Assumption: number_of_UTF8_bytes(str) >= number_of_UTF16_chars(str)
          SetLength(PWideString(ASSUtils)^, lLen);
          GetMem(lUTF8, lLen);
          if AStream.Read(lUTF8^, lLen) <> lLen then
          begin
            FreeMem(lUTF8);
            raise EReadError.CreateRes(@SReadError);
          end;

          lLen := MultiByteToWideChar(
            CP_UTF8, 0,
            lUTF8, lLen,
            PPWideChar(ASSUtils)^, lLen);

          if lLen = 0 then
          begin
            lErr := GetLastError;

            FreeMem(lUTF8);

            RaiseLastOSError(lErr);
          end else
            FreeMem(lUTF8);

          SetLength(PWideString(ASSUtils)^, lLen);
        end else
        begin
          SetLength(PWideString(ASSUtils)^, lLen);

          AStream.ReadBuffer(PByte(ASSUtils^)^, lLen * SizeOf(WideChar));
        end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;

{$IFDEF SSUTILS_UNICODE}
  tkUString:
    while ALength > 0 do
    begin
      if ssuLimitToWordSize in AOptions then
      begin
        lLen := 0;
        AStream.ReadBuffer(lLen, SizeOf(Word));
      end else
        AStream.ReadBuffer(lLen, SizeOf(Cardinal));

      if lLen = 0 then
        SetLength(PUnicodeString(ASSUtils)^, 0)
      else
        if ssuUTF16ToUTF8 in AOptions then
        begin
          // Assumption: number_of_UTF8_bytes(str) >= number_of_UTF16_chars(str)
          SetLength(PUnicodeString(ASSUtils)^, lLen);
          GetMem(lUTF8, lLen);
          if AStream.Read(lUTF8^, lLen) <> lLen then
          begin
            FreeMem(lUTF8);
            raise EReadError.CreateRes(@SReadError);
          end;

          lLen := MultiByteToWideChar(
            CP_UTF8, 0,
            lUTF8, lLen,
            PPWideChar(ASSUtils)^, lLen);

          if lLen = 0 then
          begin
            lErr := GetLastError;

            FreeMem(lUTF8);

            RaiseLastOSError(lErr);
          end else
            FreeMem(lUTF8);

          SetLength(PUnicodeString(ASSUtils)^, lLen);
        end else
        begin
          SetLength(PUnicodeString(ASSUtils)^, lLen);

          AStream.ReadBuffer(PByte(ASSUtils^)^, lLen * SizeOf(WideChar));
        end;

      Inc(PPointer(ASSUtils));
      Dec(ALength);
    end;
{$ENDIF}

  tkArray:
    begin
      lFieldTable := PFieldTable(Cardinal(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        SSUtilsRead_Array(
          AStream,
          ASSUtils,
          lFieldTable.Fields[0].TypeInfo^,
          lFieldTable.Count,
          AOptions);

        Inc(Integer(ASSUtils), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkRecord:
    begin
      lFieldTable := PFieldTable(Integer(ATypeInfo) + Byte(PTypeInfo(ATypeInfo).Name[0]));
      while ALength > 0 do
      begin
        SSUtilsRead_Record(AStream, ASSUtils, ATypeInfo, AOptions);
        Inc(Integer(ASSUtils), lFieldTable.Size);
        Dec(ALength);
      end;
    end;

  tkDynArray:
    while ALength > 0 do
    begin
      SSUtilsRead_DynArray(AStream, ASSUtils, ATypeInfo, AOptions);
      Inc(Integer(ASSUtils), SizeOf(Integer));
      Dec(ALength);
    end;
  else
    raise ESSUtilsInvalidType.Create(ATypeInfo^.Kind);
  end;
end;

{ TSnapshotUtils }

class function TSnapshotUtils.Compare(const ASSUtilsType1,
  ASSUtilsType2; ATypeInfo: PTypeInfo): Boolean;
begin
  Result := SSUtilsCompare_Array(@ASSUtilsType1, @ASSUtilsType2, ATypeInfo, 1);
end;

class function TSnapshotUtils.GetSize(const ASSUtilsType;
  ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions): Cardinal;
begin
  Result := SizeOf(TSnapshotUtilsHeader) + GetSizeNH(ASSUtilsType, ATypeInfo, AOptions);
end;

class function TSnapshotUtils.GetSizeNH(const ASSUtilsType;
  ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions): Cardinal;
begin
  Result := SSUtilsGetSize_Array(@ASSUtilsType, ATypeInfo, 1, AOptions);
end;

class procedure TSnapshotUtils.WriteTo(AStream: TStream; const ASSUtilsType;
  ATypeInfo: PTypeInfo; FScenarioID : Integer ; AVersion: Word; const AOptions: TSnapshotUtilsOptions; APreAllocSize: Boolean);
var
  lHeader: TSnapshotUtilsHeader;
  lNewSize: Int64;
  lOldPos: Int64;
begin
  if APreAllocSize then
  begin
    lNewSize := AStream.Position + TSnapshotUtils.GetSize(ASSUtilsType, ATypeInfo, AOptions);
    if lNewSize > AStream.Size then
    begin
      lOldPos := AStream.Position;
      AStream.Size := lNewSize;
      AStream.Position := lOldPos;
    end;
  end;

  lHeader.Stream.ScenarioID := FScenarioID ;
  lHeader.Stream.TimeInfo   := Now ;
  lHeader.Stream.Version    := cSSUTILS_STREAM_VERSION;
  lHeader.Stream.Options    := 0;
  lHeader.TypeVersion       := AVersion;


{$IFDEF SSUTILS_UNICODE}
  lHeader.Stream.Options := lHeader.Stream.Options or cSSUTILS_STREAM_CFG_UNICODE;
{$ENDIF}

  if ssuUTF16ToUTF8 in AOptions then
    lHeader.Stream.Options := lHeader.Stream.Options or cSSUTILS_STREAM_CFG_UTF8;

  if ssuLimitToWordSize in AOptions then
    lHeader.Stream.Options := lHeader.Stream.Options or cSSUTILS_STREAM_CFG_WORDSIZE;

  if ssuAnsiStringCodePage in AOptions then
    lHeader.Stream.Options := lHeader.Stream.Options or cSSUTILS_STREAM_CFG_CODEPAGE;

  AStream.WriteBuffer(lHeader, SizeOf(lHeader));

  WriteToNH(AStream, ASSUtilsType, ATypeInfo, AOptions);
end;

class procedure TSnapshotUtils.WriteToNH(AStream: TStream;
  const ASSUtilsType; ATypeInfo: PTypeInfo; const AOptions: TSnapshotUtilsOptions);
begin
  SSUtilsWrite_Array(AStream, @ASSUtilsType, ATypeInfo, 1, AOptions);
end;

class function TSnapshotUtils.ReadFrom(AStream: TStream; const ASSUtilsType;
  ATypeInfo: PTypeInfo; AVersion: Word): Boolean;
var
  lHeader: TSnapshotUtilsHeader;
  lOptions: TSnapshotUtilsOptions;
begin
  AStream.ReadBuffer(lHeader, SizeOf(lHeader));
  Result := (lHeader.TypeVersion = AVersion) and (lHeader.Stream.Version = cSSUTILS_STREAM_VERSION);
  if not Result then
  begin
    AStream.Seek(-SizeOf(lHeader), soCurrent);
    Exit;
  end;

  lOptions := [];
  if cSSUTILS_STREAM_CFG_UTF8 and lHeader.Stream.Options = cSSUTILS_STREAM_CFG_UTF8 then
    Include(lOptions, ssuUTF16ToUTF8);

  if cSSUTILS_STREAM_CFG_WORDSIZE and lHeader.Stream.Options = cSSUTILS_STREAM_CFG_WORDSIZE then
    Include(lOptions, ssuLimitToWordSize);

  if cSSUTILS_STREAM_CFG_CODEPAGE and lHeader.Stream.Options = cSSUTILS_STREAM_CFG_CODEPAGE then
    Include(lOptions, ssuAnsiStringCodePage);

  ReadFromNH(AStream, ASSUtilsType, ATypeInfo, lOptions)
end;

class procedure TSnapshotUtils.ReadFromNH(AStream: TStream;
  const ASSUtilsType; ATypeInfo: PTypeInfo;
  const AOptions: TSnapshotUtilsOptions);
begin
  SSUtilsRead_Array(AStream, @ASSUtilsType, ATypeInfo, 1, AOptions);
end;

{ ESSUtilsInvalidType }

constructor ESSUtilsInvalidType.Create(ATypeKind: TTypeKind);
begin
  FTypeKind := ATypeKind;

  inherited CreateFmt('Unsupported field type %s', [
    GetEnumName(TypeInfo(TTypeKind), Ord(ATypeKind))
  ]);
end;

{ ESSUtilsWordLimit }

constructor ESSUtilsWordLimit.Create(ALen: Integer);
begin
  inherited CreateFmt('Invalid dynamic array size %d (max 65535)', [ALen]);
end;

end.
