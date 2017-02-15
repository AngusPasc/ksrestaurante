unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TTFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Config1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TFrmPrincipal: TTFrmPrincipal;

implementation

{$R *.dfm}

end.
