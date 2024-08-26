{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR OFF}
{$WARN CVT_WIDENING_STRING_LOST OFF}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
unit uPISelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfPISelect = class(TForm)
    lbl1: TLabel;
    cbbPI: TComboBox;
    btnOk: TButton;
    btnCancel: TButton;
    lbTempPI: TListBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure PISelect;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPISelect : TfPISelect;
  pList     : TList;

implementation

uses uDataModuleTTT,uSimDBEditor,uResurceAllocationSelect,uDBAssetObject,uMissileSelect,
uResourceAllocation,uDBAsset_Weapon,uTorpedoSelect,uSonobuoySelect, uMineSelect,
uSatelliteSelect;

{$R *.dfm}

procedure TfPISelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;



procedure TfPISelect.btnOkClick(Sender: TObject);
var rec: TPlatform_Instance;
begin
  case ResourceAllocationForm.ra_id of
    1: dmTTT.updatePlatformInstance(rec,StrToInt(lbTempPI.Items.Strings[cbbPI.ItemIndex]),StrToInt(fMissileSelect.missile_id),-1,-1,-1,-1,-1);
    2: dmTTT.updatePlatformInstance(rec,StrToInt(lbTempPI.Items.Strings[cbbPI.ItemIndex]),-1,StrToInt(fTorpedo.torpedo_id),-1,-1,-1,-1);
    3: dmTTT.updatePlatformInstance(rec,StrToInt(lbTempPI.Items.Strings[cbbPI.ItemIndex]),-1,-1,-1,-1,-1,StrToInt(fSonobuoy.sonobuoy_id));
    4: dmTTT.updatePlatformInstance(rec,StrToInt(lbTempPI.Items.Strings[cbbPI.ItemIndex]),-1,-1,StrToInt(fMine.mine_id),-1,-1,-1);
    5: dmTTT.updatePlatformInstance(rec,StrToInt(lbTempPI.Items.Strings[cbbPI.ItemIndex]),-1,-1,-1,-1,StrToInt(fSatellite.sat_id),-1);

  end;
  Close;
  fMissileSelect.getRAMissile;
  fTorpedo.getRATorpedo;
  fSonobuoy.getRASonobuoy;
  fMine.getRAMine;
  fSatellite.getRASatellite;
end;

procedure TfPISelect.FormShow(Sender: TObject);
begin
  PISelect;
end;

procedure TfPISelect.PISelect;
var i:integer;
begin
  pList := TList.Create;

  uSimDBEditor.getPIMissile(StrToInt(fResorceAllocationSelect.RA_id),ResourceAllocationForm.force,'',pList);

  cbbPI.Items.Clear;
  lbTempPI.Items.Clear;

 for I := 0 to pList.Count - 1 do
 begin
    cbbPI.Items.Add(TPlatform_Instance(pList[i]).FData.Instance_Name);
    lbTempPI.Items.Add(IntToStr(TPlatform_Instance(pList[i]).FData.Platform_Instance_Index));
 end;
end;

end.
