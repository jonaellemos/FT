unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DM;

type
  TLogon = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    SpeedButton7: TSpeedButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Logon: TLogon;

implementation

{$R *.dfm}

uses MenuGeral;

procedure TLogon.Button1Click(Sender: TObject);
begin

Logon.Close;
//Tela Inutilizada

end;

end.
