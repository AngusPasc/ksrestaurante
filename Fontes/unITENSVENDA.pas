unit unITENSVENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmITENSVENDA = class(TForm)
    DBGrid1: TDBGrid;
    edCODPED_IPE: TEdit;
    Label1: TLabel;
    edTotal: TEdit;
    Label2: TLabel;
    edCOD_IPE: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edDESC_ITE: TEdit;
    btIncluir: TButton;
    btSalvar: TButton;
    btExcluir: TButton;
    btCancelar: TButton;
    btSair: TButton;
    Button6: TButton;
    dbeQTD_IPE: TDBEdit;
    dbeIDITE_IPE: TDBEdit;
    Label5: TLabel;
    edVLRUNI_IPE: TEdit;
    Label6: TLabel;
    edTotalItem: TEdit;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbeIDITE_IPEExit(Sender: TObject);
    procedure edCOD_IPEExit(Sender: TObject);
    procedure edCOD_IPEEnter(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure dbeQTD_IPEExit(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarItens;
    function GerarSequencia:Integer;
  public
    { Public declarations }
  end;

var
  frmITENSVENDA: TfrmITENSVENDA;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmITENSVENDA.btCancelarClick(Sender: TObject);
begin
    edCOD_IPE.SetFocus;
end;

procedure TfrmITENSVENDA.btExcluirClick(Sender: TObject);
begin
    DM.cdsITEM_PEDIDO.Delete;
    edCOD_IPE.SetFocus;
end;

procedure TfrmITENSVENDA.btIncluirClick(Sender: TObject);
begin
     DM.cdsITEM_PEDIDO.FieldByName('CODPED_IPE').AsString := edCODPED_IPE.Text;
     DM.cdsITEM_PEDIDO.FieldByName('VLRUNI_IPE').AsString := edVLRUNI_IPE.Text;
     DM.cdsITEM_PEDIDO.FieldByName('COD_IPE').AsInteger := GerarSequencia;
     DM.cdsITEM_PEDIDO.Post;
     DM.cdsITEM_PEDIDO.ApplyUpdates(0);
     CarregarItens;
     edCOD_IPE.SetFocus;
end;

procedure TfrmITENSVENDA.btSalvarClick(Sender: TObject);
begin
  DM.cdsITEM_PEDIDO.ApplyUpdates(0);
  CarregarItens;
  edCOD_IPE.SetFocus;
end;

procedure TfrmITENSVENDA.CarregarItens;
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select * from ITEM_PEDIDO LEFT OUTER JOIN ITENS ON ITEM_PEDIDO.IDITE_IPE =   ITENS.ID_ITE ' +
                                 ' WHERE CODPED_IPE = ' + edCODPED_IPE.Text    ;
   DM.cdsCONSULTA.Open;
end;

procedure TfrmITENSVENDA.dbeIDITE_IPEExit(Sender: TObject);
begin
    if dbeIDITE_IPE.Text <> '' then

    DM.cdsTRAVAR.Close;
    DM.cdsTRAVAR.CommandText := 'select * from ITENS where ID_ITE = ' + dbeIDITE_IPE.Text;
    DM.cdsTRAVAR.Open;
    if not DM.cdsTRAVAR.IsEmpty then
    begin
      edDESC_ITE.Text := DM.cdsTRAVAR.FieldByName('DESC_ITE').AsString;
      edVLRUNI_IPE.Text := DM.cdsTRAVAR.FieldByName('PRECO_ITE').AsString;

    end
    else
       edDESC_ITE.Text := 'Item n�o cadastrado';

end;

procedure TfrmITENSVENDA.dbeQTD_IPEExit(Sender: TObject);
begin
     edTotalItem.Text := VartoStr(strtoint(dbeQTD_IPE.Text) * StrtoInt(edVLRUNI_IPE.Text));
end;

procedure TfrmITENSVENDA.edCOD_IPEEnter(Sender: TObject);
begin
    Text := '0';
    DM.cdsITEM_PEDIDO.Close;
    edDESC_ITE.Clear;
    edVLRUNI_IPE.Clear;
    edTotalItem.Clear;
    btIncluir.Enabled := False;
end;

procedure TfrmITENSVENDA.edCOD_IPEExit(Sender: TObject);
begin
   if edCOD_IPE.Text <> '' then
    begin
          DM.cdsITEM_PEDIDO.Close;
          DM.cdsITEM_PEDIDO.CommandText := 'select * from ITEM_PEDIDO where COD_IPE = ' + edCOD_IPE.Text +
                                           ' and CODPED_IPE = ' + edCODPED_IPE.Text;
          DM.cdsITEM_PEDIDO.Open;
          if DM.cdsITEM_PEDIDO.IsEmpty then
          begin
            DM.cdsITEM_PEDIDO.Insert;
            btIncluir.Enabled := True;

          end
          else
          begin
            DM.cdsITEM_PEDIDO.Edit;
            btSalvar.Enabled := True;
            btExcluir.Enabled := True;

          end;
    end;
end;

procedure TfrmITENSVENDA.FormShow(Sender: TObject);
begin
     edTotal.Text := 'R$ 0,00';
     CarregarItens;
end;

function TfrmITENSVENDA.GerarSequencia: Integer;
begin
   DM.cdsTRAVAR.Close;
   DM.cdsTRAVAR.CommandText := 'select max(cod_ipe) as seq from item_pedido where codped_ipe = ' + edCODPED_IPE.Text;
   DM.cdsTRAVAR.Open;
   if not DM.cdsTRAVAR.IsEmpty then
      Result := DM.cdsTRAVAR.FieldByName('seq').AsInteger + 1
   else
      Result := 1;
end;

end.