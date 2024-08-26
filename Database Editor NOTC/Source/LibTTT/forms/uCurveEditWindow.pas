unit uCurveEditWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, TeEngine, TeeProcs, Chart;

type
  TCurveEditWindowForm = class(TForm)
    pnl1: TPanel;
    grbCursorPosition: TGroupBox;
    grbselectedPoint: TGroupBox;
    grbRatio: TGroupBox;
    btnOK: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    lblRatioCursor: TLabel;
    lblProbabilityCursor: TLabel;
    lblratioSelectedPoint: TLabel;
    lblProbabilitySelectedPoint: TLabel;
    lblRatioMax: TLabel;
    lblRatioMin: TLabel;
    edtRatioMin: TEdit;
    edtRatioMax: TEdit;
    lblRatioMindB: TLabel;
    lblRatioMaxdB: TLabel;
    grbProbability: TGroupBox;
    lblProbabilityMax: TLabel;
    lblProbabilityMin: TLabel;
    lblProbMinProsen: TLabel;
    lblProbMaxProsen: TLabel;
    edtProbabilityMin: TEdit;
    edtProbabilityMax: TEdit;
    chartProbability: TChart;
    pnl2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CurveEditWindowForm: TCurveEditWindowForm;

implementation

{$R *.dfm}

end.
