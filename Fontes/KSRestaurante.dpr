program KSRestaurante;

uses
  Vcl.Forms,
  unSenha in 'unSenha.pas' {Form1},
  uDM in 'uDM.pas' {DM: TDataModule},
  uCONSUSU in 'uCONSUSU.pas' {CONSUSU},
  uPrincipal in 'uPrincipal.pas' {Principal},
  uCADITE in 'uCADITE.pas' {CADITE},
  uCADCAT in 'uCADCAT.pas' {CADCAT},
  uABRIRCXA in 'uABRIRCXA.pas' {ABRIRCXA},
  unPEDIDO in 'unPEDIDO.pas' {PEDIDO},
  unVENDA in 'unVENDA.pas' {frmVENDA},
  unITENSVENDA in 'unITENSVENDA.pas' {frmITENSVENDA};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TABRIRCXA, ABRIRCXA);
  Application.CreateForm(TPEDIDO, PEDIDO);
  Application.CreateForm(TfrmVENDA, frmVENDA);
  Application.CreateForm(TfrmITENSVENDA, frmITENSVENDA);
  Application.Run;
end.
