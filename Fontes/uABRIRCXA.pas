unit uABRIRCXA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TABRIRCXA = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    dbeVALORABERTURA_CXA: TDBEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function caixaAberto:Boolean;
  public
    { Public declarations }
  end;

var
  ABRIRCXA: TABRIRCXA;

implementation

{$R *.dfm}

uses uDM;

{ TABRIRCXA }

function TABRIRCXA.caixaAberto: Boolean;
begin
      DM.cdsTRAVAR.Close;
      DM.cdsTRAVAR.CommandText := 'select * from caixa where aberto_cxa = 1 and fechado_cxa =0';
      DM.cdsTRAVAR.Open;
      if DM.cdsTRAVAR.IsEmpty then
         Result := False
      else
         Result := True;
end;

procedure TABRIRCXA.FormShow(Sender: TObject);
begin
     if caixaAberto then
     begin
       showmessage('Já existe um caixa aberto!');
       Close;
     end;
end;

end.
