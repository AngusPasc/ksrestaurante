unit uCONSITE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCONSITE = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCONSITE: TfrmCONSITE;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmCONSITE.DBGrid1DblClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCONSITE.FormShow(Sender: TObject);
begin
       DM.cdsITE.Close;
       DM.cdsITE.CommandText := 'select * from itens';
       DM.cdsITE.Open;
end;

end.
