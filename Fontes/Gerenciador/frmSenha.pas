unit frmSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edSenha: TEdit;
    Label1: TLabel;
    btAcessar: TButton;
    procedure btAcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses frmPrincipal;

procedure TForm1.btAcessarClick(Sender: TObject);
begin
  if edSenha.Text = 'ks#2016' then
     begin
       Application.CreateForm(TTFrmPrincipal,Tfrmprincipal);
       Tfrmprincipal.ShowModal;
     end
     else
     begin
       showmessage('Senha incorreta');
     end;
end;

end.
