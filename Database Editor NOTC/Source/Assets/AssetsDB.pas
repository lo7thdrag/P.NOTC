unit AssetsDB;

interface

uses ADODB, DB, sysutils, Dialogs, Classes;

type
  TCommonDB = class
  private
  protected
    Query : TADOQuery;
    ADOConnection: TADOConnection;
    function OpenConnection: boolean;
    function CloseConnection: boolean;
    function NewIntegerID(vTable : string):integer;
  public
    constructor Create;
    destructor Destroy;
  end;

  function CommonSelectQuery(vSelect, vFrom, vWhere: String): String; overload;
  function CommonSelectQuery(vSelect, vFrom: String): String; overload;
  function CommonInsertQuery(vField,vValue,vTable : String):String;overload;
  function CommonInsertQuery(vValue,vTable : String):String;overload;
  function CommonUpdateQuery(vWhere,vValue,vTable : String):String;overload;
  function CommonUpdateQuery(vValue,vTable : String):String;overload;
  function isEmpty(vValue : String) : boolean;

implementation

const
  CONNECTION_STRING = 'Provider=MSDASQL.1;' + 'Persist Security Info=False;' +
    'User ID=root;' + 'Password=root;' + 'Data Source=Assets;' +
    'Initial Catalog=assets;';

function isEmpty(vValue : String) : boolean;
begin
  if Trim(vValue) = '' then begin
    MessageDlg('Required field is Empty.', mtError, [mbOK],0);
    result := true;
  end
  else
    result := false
end;


function CommonInsertQuery(vField,vValue,vTable : String):String;overload;
begin
  result := 'INSERT INTO ' + vTable + '(' + vField + ') VALUES (' + vValue + ')';
  ShowMessage(result);
end;

function CommonInsertQuery(vValue,vTable : String):String;overload;
begin
  result := 'INSERT INTO ' + vTable + ' VALUES (' + vValue + ')';
  ShowMessage(result);
end;

function CommonSelectQuery(vSelect, vFrom, vWhere: String): String; overload;
begin
  result := 'SELECT ' + vSelect + ' FROM ' + vFrom + ' WHERE ' + vWhere;
  ShowMessage(result);
end;

function CommonSelectQuery(vSelect, vFrom: String): String; overload;
begin
  result := 'SELECT ' + vSelect + ' FROM ' + vFrom;
  ShowMessage(result);
end;

function CommonUpdateQuery(vWhere,vValue,vTable : String):String;overload;
begin
  result := 'UPDATE ' + vTable + ' SET ' + vValue + ' WHERE ' + vWhere;
  ShowMessage(result);
end;

function CommonUpdateQuery(vValue,vTable : String):String;overload;
begin
  result := 'UPDATE ' + vTable + ' SET ' + vValue ;
  ShowMessage(result);
end;

{ TCommonDB }

function TCommonDB.OpenConnection: boolean;
begin
  if not Assigned(ADOConnection) then
    ADOConnection := TADOConnection.Create(nil);

  ADOConnection.ConnectionString := CONNECTION_STRING;

  try
    ADOConnection.Connected := true;
    ADOConnection.BeginTrans;
  Except
    on E: exception do
    begin

      MessageDlg(E.Message, mtError, [mbOK], 0);

      ADOConnection.Free;
      ADOConnection := nil;

      result := false;

      Exit;
    end;
  end;

  result := true;
end;

function TCommonDB.CloseConnection: boolean;
begin
  try
    ADOConnection.CommitTrans;
    ADOConnection.Connected := false;
  Except
    on E: exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      ADOConnection.RollbackTrans;

      result := false;
    end;
  end;

  result := true;
  ADOConnection.Free;
  ADOConnection := nil;
end;


constructor TCommonDB.Create;
begin
  Query := TADOQuery.Create(nil);
end;

destructor TCommonDB.Destroy;
begin

end;

function TCommonDB.NewIntegerID(vTable : string): integer;
begin

end;

end.
