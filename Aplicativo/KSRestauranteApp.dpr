program KSRestauranteApp;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  UnPrincipal in 'UnPrincipal.pas' {Form1},
  UnMesas in 'UnMesas.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
