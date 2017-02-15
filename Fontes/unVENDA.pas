unit unVENDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmVENDA = class(TForm)
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edTotal: TEdit;
    lbl: TLabel;
    btNovo: TButton;
    btFinalizar: TButton;
    Label4: TLabel;
    edCOD_PED: TEdit;
    BtConsultar: TButton;
    BtItens: TButton;
    btPagamento: TButton;
    procedure btNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtItensClick(Sender: TObject);
  private
    { Private declarations }
  public
  nro :String;
    { Public declarations }
  end;

var
  frmVENDA: TfrmVENDA;

implementation

{$R *.dfm}

uses uDM, unITENSVENDA;

procedure TfrmVENDA.BtItensClick(Sender: TObject);
begin
    Application.CreateForm(TfrmITENSVENDA,frmITENSVENDA);
    frmITENSVENDA.edCODPED_IPE.Text := nro;
    frmITENSVENDA.ShowModal;
end;

procedure TfrmVENDA.btNovoClick(Sender: TObject);
begin
   DM.cdsCONSULTA.Close;
   DM.cdsCONSULTA.CommandText := 'select gen_id(gen_ped, 1) as NRO from rdb$database';
   DM.cdsCONSULTA.Open;
   nro := DM.cdsCONSULTA.FieldByName('NRO').AsString;
   edCOD_PED.Text := nro;

   btNovo.Enabled := False;
   BtConsultar.Enabled := False;
   btFinalizar.Enabled := True;
   DateTimePicker1.Enabled := True;
   ComboBox1.Enabled := True;
   ComboBox2.Enabled := True;
   BtItens.Enabled := True;
   btPagamento.Enabled := True;
end;



procedure TfrmVENDA.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := now;
end;

end.