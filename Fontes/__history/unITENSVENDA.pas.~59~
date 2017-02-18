unit unITENSVENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Data.DB;

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
    procedure Button6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarItens;
    procedure CalcularTotal;
    function GerarSequencia:Integer;
  public
    { Public declarations }
  end;

var
  frmITENSVENDA: TfrmITENSVENDA;

implementation

{$R *.dfm}

uses uDM, uCONSITE;

procedure TfrmITENSVENDA.btCancelarClick(Sender: TObject);
begin
    DM.cdsITEM_PEDIDO.Close;
    edCOD_IPE.SetFocus;
    edCOD_IPE.Text := '0';
end;

procedure TfrmITENSVENDA.btExcluirClick(Sender: TObject);
begin
    DM.cdsITEM_PEDIDO.Delete;
    DM.cdsITEM_PEDIDO.ApplyUpdates(0);
    CarregarItens;
    CalcularTotal;
    DM.cdsITEM_PEDIDO.Close;
    btSalvar.Enabled := False;
    btExcluir.Enabled := False;
    edCOD_IPE.SetFocus;
    edCOD_IPE.Text := '0';
end;

procedure TfrmITENSVENDA.btIncluirClick(Sender: TObject);
begin
     DM.cdsITEM_PEDIDO.FieldByName('CODPED_IPE').AsString := edCODPED_IPE.Text;
     DM.cdsITEM_PEDIDO.FieldByName('VLRUNI_IPE').AsString := edVLRUNI_IPE.Text;
     DM.cdsITEM_PEDIDO.FieldByName('COD_IPE').AsInteger := GerarSequencia;
     DM.cdsITEM_PEDIDO.Post;
     DM.cdsITEM_PEDIDO.ApplyUpdates(0);
     CarregarItens;
     CalcularTotal;
     DM.cdsITEM_PEDIDO.Close;
     edCOD_IPE.SetFocus;
end;

procedure TfrmITENSVENDA.btSairClick(Sender: TObject);
begin
   if DM.cdsITEM_PEDIDO.State in [dsInsert,dsEdit] then
      showmessage('Salve o item ou cancele!')
   else
       Close;

end;

procedure TfrmITENSVENDA.btSalvarClick(Sender: TObject);
begin
  DM.cdsITEM_PEDIDO.ApplyUpdates(0);
  CarregarItens;
  CalcularTotal;
  DM.cdsITEM_PEDIDO.Close;
  btSalvar.Enabled := False;
  btExcluir.Enabled := False;
  edCOD_IPE.SetFocus;
  edCOD_IPE.Text := '0';
end;

procedure TfrmITENSVENDA.Button6Click(Sender: TObject);
begin
   Application.CreateForm(TFrmConsite,frmconsite);
   frmconsite.ShowModal;
   if NOT DM.cdsITE.IsEmpty then
   begin
     dbeIDITE_IPE.Text := DM.cdsite.FieldByName('id_ite').AsString;
     dbeIDITE_IPEExit(Self);
   end;

end;

procedure TfrmITENSVENDA.CalcularTotal;
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select sum(item_pedido.qtd_ipe * item_pedido.vlruni_ipe) as total from ' +
                                 ' item_pedido where item_pedido.codped_ipe = ' + edCODPED_IPE.Text;
   DM.cdsCONSULTA.Open;
   if not DM.cdsCONSULTA.IsEmpty then
      edTotal.Text := 'R$' + DM.cdsCONSULTA.FieldByName('total').AsString;
end;

procedure TfrmITENSVENDA.CarregarItens;
begin
   DM.cdsGRID.Close;
   DM.cdsGRID.CommandText := 'select * from ITEM_PEDIDO LEFT OUTER JOIN ITENS ON ITEM_PEDIDO.IDITE_IPE =   ITENS.ID_ITE ' +
                                 ' WHERE CODPED_IPE = ' + edCODPED_IPE.Text    ;
   DM.cdsGRID.Open;
end;

procedure TfrmITENSVENDA.dbeIDITE_IPEExit(Sender: TObject);
begin
    if dbeIDITE_IPE.Text <> '' then
    begin
       DM.cdsCONSULTA.Close;
       DM.cdsCONSULTA.CommandText := 'select * from itens where id_ite = ' + dbeIDITE_IPE.Text;
       DM.cdsCONSULTA.Open;
       if not DM.cdsCONSULTA.IsEmpty then
       begin
          edDESC_ITE.Text := DM.cdsCONSULTA.FieldByName('DESC_ITE').AsString;
          edVLRUNI_IPE.Text := DM.cdsCONSULTA.FieldByName('PRECO_ITE').AsString;
       end
       else
          edDESC_ITE.Text := 'Item não cadastrado';

    dbeQTD_IPE.SetFocus;
    end;
end;

procedure TfrmITENSVENDA.dbeQTD_IPEExit(Sender: TObject);
begin
     if (dbeQTD_IPE.Text <> '') and ( edVLRUNI_IPE.Text <> '') then
          edTotalItem.Text := VartoStr(StrToCurr(dbeQTD_IPE.Text) * StrToCurr(edVLRUNI_IPE.Text));
end;

procedure TfrmITENSVENDA.DBGrid1DblClick(Sender: TObject);
begin
       edCOD_IPE.Text := DM.cdsGRID.FieldByName('COD_IPE').AsString;
       edCOD_IPEExit(Self);
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
            dbeIDITE_IPEExit(Self);
            dbeQTD_IPEExit(Self);

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
