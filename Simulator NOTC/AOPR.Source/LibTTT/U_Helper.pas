unit U_Helper;

interface

uses SysUtils, Dialogs, IniFiles;

type

  TLogFile = class
    private
      fFilename: string;
      fisLog: Boolean;
      fLogFile:TextFile;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Init;
      procedure Log(const AHdr, AMsg: string);
      procedure InsertEmptyLine;
      procedure Close;
    published
      property FileName: string read fFilename write fFilename;
      property IsLog: Boolean read fisLog write fisLog;
  end;

implementation

function FileIsThere(FileName: string): Boolean;
{ Boolean function that returns True if the file exists; otherwise,
  it returns False. Closes the file if it exists. }
 var
  F: file;
begin
  {$I-}
  AssignFile(F, FileName);
  FileMode := 0;  {Set file access to read only }
  Reset(F);
  CloseFile(F);
  {$I+}
  FileIsThere := (IOResult = 0) and (FileName <> '');
end;  { FileIsThere }

constructor TLogFile.Create;
begin
  inherited Create;
end;

destructor TLogFile.Destroy;
begin
  Close;
  inherited Destroy;
end;

procedure TLogFile.Init;
var IsFileExist: Boolean;
begin
  if not fisLog then
    Exit;
  IsFileExist:= FileIsThere(fFilename);
  try
    AssignFile(fLogFile,fFilename);
    if not IsFileExist then
      Rewrite(fLogFile)
    else
    begin
      DeleteFile(fFilename);
      Rewrite(fLogFile);
//      Append(fLogFile);
    end;
  except
    on e:Exception do begin
      CloseFile(fLogFile);
      ShowMessage(e.Message);
    end;
  end;

end;

procedure TLogFile.InsertEmptyLine;
begin
  if fisLog then begin
    System.Writeln(fLogFile, ' ');
    Flush(fLogFile)
  end
end;

procedure TLogFile.Log(const AHdr, AMsg: string);
begin
  if fisLog then begin
    System.Writeln(fLogFile, AMsg);
    Flush(fLogFile)
  end;
end;

procedure TLogFile.Close;
begin
  if not fisLog then
    Exit;
  {I-}
  CloseFile(fLogFile);
  {I+}
end;

end.
