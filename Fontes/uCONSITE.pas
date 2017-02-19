unit uCONSITE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmCONSITE = class(TForm)
    DBGrid1: TDBGrid;
    edConsulta: TEdit;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TfrmCONSITE.Button1Click(Sender: TObject);
begin
       DM.cdsITE.Close;
       DM.cdsITE.CommandText := 'select * from itens where desc_ite like ''%' + edConsulta.Text + '%''';
       DM.cdsITE.Open;
end;

procedure TfrmCONSITE.DBGrid1DblClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCONSITE.FormShow(Sender: TObject);
begin
       DM.cdsITE.Close;
       DM.cdsITE.CommandText := 'select * from itens' +
        ' left outer join categorias on itens.idcat_ite = categorias.id_cat' +
                                ' where categorias.noite_cat = 1';
       DM.cdsITE.Open;
end;

end.
