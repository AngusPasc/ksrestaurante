unit unRELVENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmRELVENDA = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GerarRelatorioResumo;
    procedure GerarRelatorioCompleto;
  end;

var
  frmRELVENDA: TfrmRELVENDA;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmRELVENDA.Button1Click(Sender: TObject);
begin
     case RadioGroup1.ItemIndex of
     0: GerarRelatorioResumo;
     1: GerarRelatorioCompleto;
     end;

end;

procedure TfrmRELVENDA.GerarRelatorioCompleto;
begin
// aqui
end;

procedure TfrmRELVENDA.GerarRelatorioResumo;
begin
     Memo1.Clear;
     Memo1.Lines.Add('Imperio Restaurante');
     Memo1.Lines.Add('Relatorio de Vendas');
     Memo1.Lines.Add(DatetoStr(DateTimePicker1.Date) + ' a ' + DatetoStr(DateTimePicker1.Date));

     DM.cdsCONSULTA.close;
     DM.cdsCONSULTA.CommandText := 'select pedido.cod_ped,sum(item_pedido.vlruni_ipe * item_pedido.qtd_ipe) as total from pedido ' +
                                   ' left outer join item_pedido on item_pedido.codped_ipe = pedido.cod_ped ' +
                                   ' group by pedido.cod_ped ';

end;

end.
