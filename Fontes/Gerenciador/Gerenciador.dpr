program Gerenciador;

uses
  Vcl.Forms,
  frmSenha in 'frmSenha.pas' {Form1},
  frmPrincipal in 'frmPrincipal.pas' {TFrmPrincipal},
  uDMGERENCIADOR in 'uDMGERENCIADOR.pas' {dmGerenciador: TDataModule},
  unUsuario in 'unUsuario.pas' {frmUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmGerenciador, dmGerenciador);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.Run;
end.
