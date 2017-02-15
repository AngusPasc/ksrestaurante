unit uCADCAT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,Datasnap.DBClient;

type
  TCADCAT = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    dbeDESC_CAT: TDBEdit;
    btIncluir: TButton;
    btSalvar: TButton;
    btExcluir: TButton;
    btSair: TButton;
    edID_CAT: TEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure edID_CATExit(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edID_CATEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cds_padrao:TClientDataSet;
   procedure CarregarGrid;
   function TestarCampos:Boolean;
   function registroTravado:Boolean;

  public
    { Public declarations }
  end;

var
  CADCAT: TCADCAT;

implementation

{$R *.dfm}

uses uDM;

{ TCADCAT }

procedure TCADCAT.btExcluirClick(Sender: TObject);
begin
        if MessageDlg('Deseja excluir esta categoria?', mtConfirmation,
              [mbYes, mbNo], 0) = mrYes then
         begin
                 if registroTravado then
                  begin
                    showmessage('Existem itens desta categoria!');
                  end
                  else
                  begin
                     DM.cdsCAT.Delete;
                     cds_padrao.ApplyUpdates(0);
                     CarregarGrid;
                     edID_CAT.SetFocus;
                  end;
         end;


end;

procedure TCADCAT.btIncluirClick(Sender: TObject);
begin
       if TestarCampos then
       begin
           cds_padrao.FieldByName('ID_CAT').AsString := edID_CAT.Text;
           DM.cdsCAT.ApplyUpdates(0);
        //   DM.Transacao.Commit;
           CarregarGrid;
           edID_CAT.SetFocus;
       end;
end;

procedure TCADCAT.btSairClick(Sender: TObject);
begin
      if btIncluir.Enabled or btExcluir.Enabled then
      begin
        showmessage('Registro em aberto!');
      end
      else

          Close;
end;

procedure TCADCAT.btSalvarClick(Sender: TObject);
begin
      if TestarCampos then
       begin
           cds_padrao.FieldByName('ID_CAT').AsString := edID_CAT.Text;
           cds_padrao.ApplyUpdates(0);
       //    DM.Transacao.Commit;
           CarregarGrid;
           edID_CAT.SetFocus;
       end;
end;

procedure TCADCAT.CarregarGrid;
begin
    DM.cdsCONSULTA.Close;
    DM.cdsCONSULTA.CommandText := 'select * from categorias';
    DM.cdsCONSULTA.Open;
end;

procedure TCADCAT.DBGrid1DblClick(Sender: TObject);
begin
        edID_CAT.Text := DM.cdsCONSULTA.FieldByName('ID_CAT').AsString;
        edID_CATExit(Self);
end;

procedure TCADCAT.edID_CATEnter(Sender: TObject);
begin
        edID_CAT.Text := '0';
        btIncluir.Enabled := False;
        btSalvar.Enabled := False;
        btExcluir.Enabled := False;
        cds_padrao.Close;
end;

procedure TCADCAT.edID_CATExit(Sender: TObject);
begin
      if (edID_CAT.Text <> '') and (not btSair.Focused) then
      begin
           cds_padrao.Close;
           cds_padrao.CommandText := 'select * from categorias where id_cat = ' + edID_CAT.Text;
           cds_padrao.Open;
           if cds_padrao.IsEmpty then
           begin
                cds_padrao.Insert;
                btIncluir.Enabled := True;
                btSalvar.Enabled := False;
                btSair.Enabled := True;
                btExcluir.Enabled := False;
                dbeDESC_CAT.SetFocus;
           end
           else
           begin
                cds_padrao.Edit;
                btIncluir.Enabled := False;
                btSalvar.Enabled := True;
                btExcluir.Enabled := True;
                btSair.Enabled := True;
                dbeDESC_CAT.SetFocus;
           end;
      end;
end;

procedure TCADCAT.FormCreate(Sender: TObject);
begin
        cds_padrao := DM.cdsCAT;
end;

procedure TCADCAT.FormShow(Sender: TObject);
begin

      CarregarGrid;
      edID_CAT.SetFocus;
end;

function TCADCAT.registroTravado: Boolean;
begin
       DM.cdsTRAVAR.Close;
       Dm.cdsTRAVAR.CommandText := 'select * from itens where idcat_ite = ' + cds_padrao.FieldByName('ID_CAT').AsString;
       DM.cdsTRAVAR.Open;
       if DM.cdsTRAVAR.IsEmpty then
           Result := False
       else
           Result := True;
end;

function TCADCAT.TestarCampos: Boolean;
var
erro :String;
begin
     erro := '';
     if dbeDESC_CAT.Text = '' then
         erro := erro + 'Descri��o n�o informada!';


      if erro = '' then
      begin
         Result := True;
      end
      else
      begin
        showmessage(erro);
        Result := False;
      end;
end;

end.
