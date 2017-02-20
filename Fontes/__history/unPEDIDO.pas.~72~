unit unPEDIDO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB;

type
  TPEDIDO = class(TForm)
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Image1: TImage;
    Image2: TImage;
    Memo1: TMemo;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    seq_pedido :Integer;
    StrPedido,StrData,StrMesa,StrCabecalho:String;
  public
    { Public declarations }
   procedure CarregarItens;
   procedure NovoPedido;
   function SequenciaPedido:Integer;
   function SequenciaItemPedido:Integer;
   procedure GerarNovo;
   procedure AtualizarPedido;
   function PreencherString(s : string;tam:Integer) : string;
   procedure ImprimirPedido;
   procedure GravarPagamento;
  end;

var
  PEDIDO: TPEDIDO;

implementation

{$R *.dfm}

uses uDM;

{ TPEDIDO }

procedure TPEDIDO.AtualizarPedido;
var
  I: Integer;
  Total :Currency;
begin
      Total := 0;
      DM.cdsCONSULTA.Close;
      DM.cdsCONSULTA.CommandText := 'select * from item_pedido ' +
                                    ' left outer join itens on id_ite = idite_ipe' +
                                    ' where codped_ipe =' + vartostr(seq_pedido);
      DM.cdsCONSULTA.Open;
      Memo1.Clear;
      Memo1.Lines.Add(StrPedido);
      Memo1.Lines.Add(StrData);
      Memo1.Lines.Add(StrMesa);
      Memo1.Lines.Add('');
      Memo1.Lines.Add(StrCabecalho);

      DM.cdsCONSULTA.First;
      while not DM.cdsCONSULTA.eof do
      begin
        Memo1.Lines.Add(PreencherString(DM.cdsCONSULTA.FieldByName('DESC_ITE').AsString,26) +
                        PreencherString(vartostr(DM.cdsCONSULTA.FieldByName('QTD_IPE').AsCurrency),8) +
                        PreencherString(vartostr(DM.cdsCONSULTA.FieldByName('VLRUNI_IPE').AsCurrency),8) +
                        PreencherString(
                        vartostr(DM.cdsCONSULTA.FieldByName('QTD_IPE').AsCurrency * DM.cdsCONSULTA.FieldByName('VLRUNI_IPE').AsCurrency),8));

        Total := Total +  (DM.cdsCONSULTA.FieldByName('QTD_IPE').AsCurrency * DM.cdsCONSULTA.FieldByName('VLRUNI_IPE').AsCurrency);
        DM.cdsCONSULTA.Next;
      end;
     Edit1.Text := 'R$ ' + vartostr(Total);
end;

procedure TPEDIDO.Button1Click(Sender: TObject);
begin
   NovoPedido;
end;

procedure TPEDIDO.Button2Click(Sender: TObject);
begin
GravarPagamento;
ImprimirPedido;

end;

procedure TPEDIDO.ImprimirPedido;
var
  Impressora: TextFile;
  StringList: TStringList;
  IX: Integer;
begin
  try
    //Texto := StringReplace(Texto, '%20', ' ', [rfReplaceAll]);
    StringList := TStringList.Create;
    StringList.Delimiter       := '|';
    StringList.StrictDelimiter := True;
    StringList.DelimitedText   := Memo1.Text;

    AssignFile(Impressora, 'LPT1');
    Rewrite(Impressora);
    for IX := 0 to (StringList.Count - 1) do
      Writeln(Impressora, StringList[IX]);
    Writeln(Impressora, '');
    Writeln(Impressora, '');
    Writeln(Impressora, '');
    CloseFile(Impressora);
  finally
    StringList.Free;
  End;


end;

procedure TPEDIDO.CarregarItens;
begin
       DM.cdsITE.Close;
       DM.cdsITE.CommandText := 'select * from itens' +
                                ' left outer join categorias on itens.idcat_ite = categorias.id_cat' +
                                ' where categorias.dia_cat = 1';
       DM.cdsITE.Open;
end;

procedure TPEDIDO.FormShow(Sender: TObject);
begin
    Memo1.Clear;
end;

procedure TPEDIDO.GerarNovo;
begin
     DM.cdsPEDIDO.Close;
     DM.cdsPEDIDO.CommandText := 'select * from pedido';
     DM.cdsPEDIDO.Open;
     DM.cdsPEDIDO.Insert;
     DM.cdsPEDIDO.FieldByName('COD_PED').AsInteger := SequenciaPedido;
     DM.cdsPEDIDO.FieldByName('DATA_PED').AsDateTime := DateTimePicker1.DateTime;
     DM.cdsPEDIDO.FieldByName('MESA_PED').AsInteger := ComboBox1.ItemIndex;
     DM.cdsPEDIDO.FieldByName('TIPO_PED').AsString := 'A';
     DM.cdsPEDIDO.Post;
     seq_pedido :=  DM.cdsPEDIDO.FieldByName('COD_PED').AsInteger;
     DM.cdsPEDIDO.ApplyUpdates(0);

end;

procedure TPEDIDO.GravarPagamento;
begin
   DM.cdsTRAVAR.Close;
   DM.cdsTRAVAR.CommandText := 'select * from pedido ' +
                               ' where pedido.cod_ped = ' +  inttostr(Seq_pedido);
   DM.cdsTRAVAR.Open;
   DM.cdsTRAVAR.Edit;
   DM.cdsTRAVAR.FieldByName('fpag_ped').AsInteger := RadioGroup1.ItemIndex;
   DM.cdsTRAVAR.Post;
   DM.cdsTRAVAR.ApplyUpdates(0);

end;

procedure TPEDIDO.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
       DM.cdsITEM_PEDIDO.Close;
       DM.cdsITEM_PEDIDO.CommandText := 'select * from item_pedido where codped_ipe= ' + vartostr(seq_pedido);
       DM.cdsITEM_PEDIDO.Open;
       DM.cdsITEM_PEDIDO.Insert;
       DM.cdsITEM_PEDIDO.FieldByName('CODPED_IPE').AsInteger := seq_pedido;
       DM.cdsITEM_PEDIDO.FieldByName('COD_IPE').AsInteger := SequenciaItemPedido;
       DM.cdsITEM_PEDIDO.FieldByName('IDITE_IPE').AsInteger := DM.cdsITE.FieldByName('ID_ITE').AsInteger;
       DM.cdsITEM_PEDIDO.FieldByName('QTD_IPE').AsCurrency := 1;
       DM.cdsITEM_PEDIDO.FieldByName('VLRUNI_IPE').AsCurrency := DM.cdsITE.FieldByName('PRECO_ITE').AsCurrency;
       DM.cdsITEM_PEDIDO.Post;
       DM.cdsITEM_PEDIDO.ApplyUpdates(0);
        AtualizarPedido;
end;

procedure TPEDIDO.NovoPedido;
begin
     if Memo1.Text = '' then
      begin
        GerarNovo;
      end;





     CarregarItens;
     StrPedido := 'Pedido: ' + vartostr(seq_pedido);
     StrData :=   'Data: ' + DateTimeToStr(DateTimePicker1.DateTime);
     StrMesa :=     'Mesa:' + ComboBox1.Text;
     StrCabecalho :=  'Item                    Qtd    Vlr.Uni    Valor';
     Memo1.Lines.Add('Pedido: ' + vartostr(seq_pedido));
     Memo1.Lines.Add('Data: ' + DateTimeToStr(DateTimePicker1.DateTime));
     Memo1.Lines.Add('Mesa:' + ComboBox1.Text);
     Memo1.Lines.Add('');

     Memo1.Lines.Add('Item                      Qtd    Vlr.Uni    Valor');

end;

function TPEDIDO.PreencherString(s : string;tam:Integer) : string;
begin
result := s;
if length(s) >= tam then
exit;
repeat
result := result + ' ';
until length(result) = tam;
end;

function TPEDIDO.SequenciaItemPedido: Integer;
begin
DM.cdsCONSULTA.Close;
     DM.cdsCONSULTA.CommandText := 'select max(cod_ipe) as seq from item_pedido' +
                                   ' where codped_ipe= ' + vartostr(seq_pedido) ;
     DM.cdsCONSULTA.Open;
     if DM.cdsCONSULTA.IsEmpty then
     begin
       Result := 1;
     end
     else
     begin
       Result := DM.cdsCONSULTA.FieldByName('seq').AsInteger + 1;
     end;
end;

function TPEDIDO.SequenciaPedido: Integer;
begin
     DM.cdsCONSULTA.Close;
     DM.cdsCONSULTA.CommandText := 'select gen_id(gen_ped, 1) as seq from rdb$database';
     DM.cdsCONSULTA.Open;
     if DM.cdsCONSULTA.IsEmpty then
     begin
       Result := 1;
     end
     else
     begin
       Result := DM.cdsCONSULTA.FieldByName('seq').AsInteger + 1;
     end;
end;

end.
