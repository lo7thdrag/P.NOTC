unit uSensorDB;

interface

uses AssetsDB, classes, sysutils, dialogs;

type

  TRadarDB = class(TCommonDB)
  private
  public
    RadarClass, RadarType, ECCMType, EmitterType, Range, CrossSection,
      AmbiguRange, FCRChannel, SpotNumber, OTHRadar, MainLobe, Frequency,
      ScanRate, Pulse, PulseWidth, Power, Clutter, BeamWidth: String;

    constructor Create;
    destructor Destroy;
    function getRadarType: TStrings;
    function getECCMType: TStrings;

    function Update: boolean;
  end;

  TSonarDB = class(TCommonDB)
  public
    constructor Create;
  end;

  TMADDB = class(TCommonDB)
  public
    constructor Create;
  end;

  TESMDB = class(TCommonDB)
  public
    constructor Create;
  end;

  TOpticalDB = class(TCommonDB)
  public
    constructor Create;
  end;

  TPlatformDB = class(TCommonDB)
    constructor Create;
  end;

implementation

{ TRadarDB }

constructor TRadarDB.Create;
begin
  inherited;
end;

destructor TRadarDB.Destroy;
begin
end;

function TRadarDB.getECCMType: TStrings;
begin
  OpenConnection;
  result := TStringList.Create;

  try
    Query.SQL.Clear;
    Query.SQL.Add(CommonSelectQuery('*', 'ast_eccm_type'));
    Query.Connection := ADOConnection;
    Query.Open;
    Query.First;

    while not Query.Eof do
    begin
      result.Add(Query.FieldByName('ECCM_ID').AsString + '|' + Query.FieldByName
          ('ECCM_Name').AsString);
      Query.Next;
    end;

    Query.Close;
  except
    on E: exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

  CloseConnection;
end;

function TRadarDB.getRadarType: TStrings;
begin
  OpenConnection;
  result := TStringList.Create;

  try
    Query.SQL.Clear;
    Query.SQL.Add(CommonSelectQuery('*', 'ast_radar_type'));
    Query.Connection := ADOConnection;
    Query.Open;
    Query.First;

    while not Query.Eof do
    begin
      result.Add(Query.FieldByName('RT_ID').AsString + '|' + Query.FieldByName
          ('RT_Name').AsString);
      Query.Next;
    end;

    Query.Close;
  except
    on E: exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

  CloseConnection;
end;

function TRadarDB.Update: boolean;
var
  isNew: boolean;
  idRadar: integer;
begin
  isNew := true;
  result := false;
  OpenConnection;

  with Query do
  begin
    Connection := ADOConnection;

    // cek apa ada radar class dengan nama yang sama
    SQL.Clear;
    SQL.Add(CommonSelectQuery('*', 'ast_radar', 'R_Class = ' + QuotedStr(RadarClass)));
    Open;
    if RecordCount > 0 then
    begin
      isNew := false;
      First;
      idRadar := FieldByName('R_ID').AsInteger;
    end;
    Close;

    // tambah data baru
    if isNew then
    begin
      // beri ID baru
      SQL.Clear;
      SQL.Add('SELECT MAX(RT_ID)+1 as NEWID FROM ast_radar');
      Open;
      if RecordCount > 0 then
      begin
        First;
        idRadar := FieldByName('NEWID').AsInteger;
      end
      else
        idRadar := 1;

      Close;

      SQL.Clear;
      SQL.Add(CommonInsertQuery
              ('R_ID,R_Class,R_EmmiterType,R_DetectRange,R_AssCrossSection,R_MaxAmbDetectRange,'+
               'R_NumberFCRChannel,R_SpotNumber,R_OTHFactor,R_MainLobeGain,'+
               'R_Frequency,R_ScanRate,R_PulseRepFreq,R_Power,R_ClutterRejection,'+
               'R_BeamWidth',
               IntToStr(idRadar)+','+QuotedStr(RadarClass)+','+QuotedStr(EmitterType)+','+Range+','+CrossSection+','+
               AmbiguRange+','+FCRChannel+','+SpotNumber+','+OTHRadar+','+MainLobe+','+
               Frequency+','+ScanRate+','+Pulse+','+PulseWidth+','+Power+','+Clutter+','+
               BeamWidth,'ast_radar')
              );
      try
        ExecSQL;
      except
        on E : Exception do begin
          MessageDlg(E.Message,mtError,[mbOK],0);
          ADOConnection.RollbackTrans;
          Exit;
        end;
      end;
      Close;

    end
    // update data
    else
    begin
      Close;

      SQL.Clear;
      SQL.Add(CommonUpdateQuery('R_ID = ' + IntToStr(idRadar),
               'R_Class = ' + QuotedStr(RadarClass),
               'ast_radar'
              )
              );

      try
        ExecSQL;
      except
        on E : Exception do begin
          MessageDlg(E.Message,mtError,[mbOK],0);
          ADOConnection.RollbackTrans;
          Exit;
        end;
      end;
      Close;
    end;

  end;
  result := true;
  CloseConnection;
end;

{ TSonarDB }

constructor TSonarDB.Create;
begin

end;

{ TMADDB }

constructor TMADDB.Create;
begin

end;

{ TESMDB }

constructor TESMDB.Create;
begin

end;

{ TOpticalDB }

constructor TOpticalDB.Create;
begin

end;

{ TPlatformDB }

constructor TPlatformDB.Create;
begin

end;

end.
