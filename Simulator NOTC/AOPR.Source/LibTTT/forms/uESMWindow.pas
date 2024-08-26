unit uESMWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,uDBAsset_Sensor;

type
  TfESMWindow = class(TForm)
    lblName: TStaticText;
    edtClass: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    gbClassificationCharacteristics: TGroupBox;
    TabSheet3: TTabSheet;
    mmNotes: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbMaximumConfidenceLevel: TComboBox;
    edClassificationPeriod: TEdit;
    edIdentificationPeriod: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    cbCommunicationInterceptCapable: TCheckBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edLowerLimitFirst: TEdit;
    edUpperLimitFirst: TEdit;
    GroupBox3: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edLowerLimitSecond: TEdit;
    edUpperLimitSecond: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    edEmmiterDetectionRangeFactor: TEdit;
    edSectorBlankDetectionFactor: TEdit;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edMinimum: TEdit;
    edInitial: TEdit;
    btOK: TButton;
    btCancel: TButton;
    btApply: TButton;
    chkSecondFrequencyDetectionBand: TCheckBox;
    procedure saveToRecord;
    procedure btApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isNew,isCopy : boolean;
    ESMobject : TESM_On_Board;
  end;

var
  fESMWindow: TfESMWindow;

implementation

uses uSimDBEditor,math,uESMPickList;

{$R *.dfm}

procedure TfESMWindow.btApplyClick(Sender: TObject);
begin
 saveToRecord;

 if isNew then
 begin
   insertESM_Def(ESMobject);
   isNew := False;
 end
 else updateESM_Def(ESMobject,inttostr(ESMobject.FESM_Def.ESM_Index));

end;

procedure TfESMWindow.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfESMWindow.btOKClick(Sender: TObject);
begin
  btApplyClick(Sender);
  Close;
  fESMPickList.refresh;
end;

procedure TfESMWindow.FormShow(Sender: TObject);
var cp,ip,h,m,s: integer;
    sh,sm,ss:string;
begin
 with ESMObject.FESM_Def do
 begin

   cp := floor(Classification_Period);
   ip := floor(Identification_Period);

   if isCopy then
   begin
     edtClass.Text  := 'Copy of '+ Class_Identifier;
     isNew := True;
   end
   else if not isCopy then

    edtClass.Text  := Class_Identifier;

   cbMaximumConfidenceLevel.ItemIndex := ESM_Classification-1;

   h  := cp div 3600;
   sh := inttostr(h)+ ':';
   if h<10 then sh := '0'+sh;

   m  := cp div 60 - (cp div 3600) * 60;
   sm := inttostr(m)+':';
   if m<10 then sm := '0'+sm;

   s  := cp - ((cp div 3600) * 3600 + (cp div 60 - (cp div 3600) * 60) * 60);
   ss := inttostr(s);
   if s<10 then ss:= '0'+ss;


   edClassificationPeriod.Text  := sh + sm + ss;


   h  := ip div 3600;
   sh := inttostr(h)+ ':';
   if h<10 then sh := '0'+sh;

   m  := ip div 60 - (ip div 3600) * 60;
   sm := inttostr(m)+':';
   if m<10 then sm := '0'+sm;

   s  := ip - ((ip div 3600) * 3600 + (ip div 60 - (ip div 3600) * 60) * 60);
   ss := inttostr(s);
   if s<10 then ss:= '0'+ss;


   edIdentificationPeriod.Text  := sh + sm+ ss;

   if (Comm_Intercept_Capable=1) then cbCommunicationInterceptCapable.Checked  := true
   else cbCommunicationInterceptCapable.Checked  := false;

   edLowerLimitFirst.Text   := floattostr(Low_Detect_Frequency1);
   edUpperLimitFirst.Text   := floattostr(High_Detect_Frequency1);

   edLowerLimitSecond.Text  := floattostr(Low_Detect_Frequency2);
   edUpperLimitSecond.Text  := floattostr(High_Detect_Frequency2);

   edEmmiterDetectionRangeFactor.Text := floattostr(Emitter_Detect_Range_Factor);
   edSectorBlankDetectionFactor.Text  := floattostr(Sector_Blank_Detection_Factor);

   edMinimum.Text           := floattostr(Minimum_Bearing_Error_Variance);
   edInitial.Text           := floattostr(Initial_Bearing_Error_Variance);

 end;

 mmNotes.Lines.Clear;
 mmNotes.Lines.Add(ESMobject.FNote.Notes);

 if isNew  then
 begin
   edtClass.Text := '';
   cbMaximumConfidenceLevel.Clear;

 end;

end;

procedure TfESMWindow.saveToRecord;
begin
 //radarobject := TRadar_On_Board.Create;

 with ESMObject.FESM_Def do
 begin

   Class_Identifier := edtClass.Text;

   ESM_Classification       := cbMaximumConfidenceLevel.ItemIndex+1;

   Classification_Period    := StrToInt(copy(edClassificationPeriod.Text,1,2))*3600+
                               StrToInt(copy(edClassificationPeriod.Text,4,2))*60  +
                               StrToInt(copy(edClassificationPeriod.Text,7,2));

   Identification_Period    := StrToInt(copy(edIdentificationPeriod.Text,1,2))*3600+
                               StrToInt(copy(edIdentificationPeriod.Text,4,2))*60  +
                               StrToInt(copy(edIdentificationPeriod.Text,7,2));

   if cbCommunicationInterceptCapable.Checked then Comm_Intercept_Capable := 1
    else Comm_Intercept_Capable := 0;

   Low_Detect_Frequency1          := strtofloat(edLowerLimitFirst.Text);
   High_Detect_Frequency1         := StrToFloat(edUpperLimitFirst.Text);

   Low_Detect_Frequency2          := strtofloat(edLowerLimitSecond.Text);
   High_Detect_Frequency2         := strtofloat(edUpperLimitSecond.Text);

   Emitter_Detect_Range_Factor    := strtofloat(edEmmiterDetectionRangeFactor.Text);
   Sector_Blank_Detection_Factor  := strtofloat(edSectorBlankDetectionFactor.Text);

   Minimum_Bearing_Error_Variance := strtofloat(edMinimum.Text);
   Initial_Bearing_Error_Variance := strtofloat(edInitial.Text);

 end;

 ESMobject.FNote.Notes  := mmNotes.Lines.Text;

end;

end.
