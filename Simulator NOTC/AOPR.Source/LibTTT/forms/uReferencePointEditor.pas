unit uReferencePointEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TReferencePointEditorForm = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    grbReferencePoints: TGroupBox;
    grbName: TGroupBox;
    lblName: TStaticText;
    grbSurfaceTrack: TGroupBox;
    cbxName: TComboBox;
    lblTypeSurface: TStaticText;
    lblPositionSurface: TStaticText;
    lblGridSurface: TStaticText;
    lblDomainSurface: TStaticText;
    lblIndentitySurface: TStaticText;
    lblDisplaySurface: TStaticText;
    lblCourseSurface: TStaticText;
    lblGroundSpeedSurface: TStaticText;
    cbxTypeSurface: TComboBox;
    edtPosition1Surface: TEdit;
    edtPosition2Surface: TEdit;
    btnAddSurface: TSpeedButton;
    edtGrid1Surface: TEdit;
    edtGrid2Surface: TEdit;
    cbxDomainSurface: TComboBox;
    cbxIdentitySurface: TComboBox;
    edtDisplaySurface: TEdit;
    edtCourseSurface: TEdit;
    edtGroundSpeedSurface: TEdit;
    lbldegreesTSurface: TStaticText;
    lblKnotsSurface: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    btnRemovePoint: TButton;
    grbDistresseed: TGroupBox;
    btnAddDistressed: TSpeedButton;
    lblTypeDistressed: TStaticText;
    lblPositionDistressed: TStaticText;
    lblgridDistressed: TStaticText;
    lblSymbolDistressed: TStaticText;
    lblDisplayDistressed: TStaticText;
    cbxTypeDistressed: TComboBox;
    edtPositionDistressed1: TEdit;
    edtPositionDistressed2: TEdit;
    edtGridDistressed1: TEdit;
    edtGridDistressed2: TEdit;
    cbxSymbolDistressed: TComboBox;
    edtDisplayDistressed: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReferencePointEditorForm: TReferencePointEditorForm;

implementation

{$R *.dfm}

end.
