unit ufmFireControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfmFireControl = class(TfmControlled)
    ScrollBox3: TScrollBox;
    Label265: TLabel;
    Label267: TLabel;
    Bevel27: TBevel;
    Label268: TLabel;
    Bevel52: TBevel;
    Label514: TLabel;
    Bevel53: TBevel;
    Label515: TLabel;
    Label527: TLabel;
    btnSearchFireControlAssetsTarget: TSpeedButton;
    lbControlChannel: TLabel;
    Label266: TLabel;
    sbFireControlAssetsModeTrackOnly: TSpeedButton;
    sbFireControlAssetsModeOff: TSpeedButton;
    sbFireControlAssetsModeSearch: TSpeedButton;
    sbFireControlAssetsDisplayShow: TSpeedButton;
    sbFireControlAssetsDisplayHide: TSpeedButton;
    sbFireControlAssetsBlindZonesShow: TSpeedButton;
    sbFireControlAssetsBlindZonesHide: TSpeedButton;
    edtFireControlAssetsTarget: TEdit;
    btnFireControlAssetsTargetAssign: TButton;
    lstFireControlAssetsAssignedTracks: TListView;
    btnFireControlAssetsTargetBreak: TButton;
    btnFireControlAssetsTargetBreakAll: TButton;
    lstAssetsChoices: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
//    procedure SetTargetName();
  end;

{var
  fmFireControl: TfmFireControl;
}
implementation

{$R *.dfm}

end.
