unit unConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniButton, unimButton, uniLabel, unimLabel, uniGUIBaseClasses, uniEdit,
  unimEdit;

type
  TfrmConfig = class(TUnimForm)
    UnimEdit1: TUnimEdit;
    UnimLabel1: TUnimLabel;
    UnimButton1: TUnimButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmConfig: TfrmConfig;
begin
  Result := TfrmConfig(UniMainModule.GetFormInstance(TfrmConfig));
end;

end.
