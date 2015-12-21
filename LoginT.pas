unit LoginT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, DM;

type
  TLoginService = class(TForm)
    PainelLogin: TImage;
    titulo: TLabel;
    login_usuario: TEdit;
    login_senha: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ValidaUsuario;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginService: TLoginService;

implementation

{$R *.dfm}

uses MenuGeral;

procedure TLoginService.Button1Click(Sender: TObject);
begin
//LoginService.Close;
ValidaUsuario();
end;

procedure TLoginService.Button2Click(Sender: TObject);
begin
LoginService.Close;
GeralMenu.Close;
Application.Terminate;
end;

procedure TLoginService.ValidaUsuario;
begin
dms.QUERY.Close;
dms.QUERY.SQL.Clear;
dms.QUERY.SQL.Add('SELECT * FROM USUARIOS WHERE USUARIO=:USUARIO AND SENHA =:SENHA');
dms.QUERY.Parameters.ParamByName('USUARIO').Value := login_usuario.text;
dms.QUERY.Parameters.ParamByName('SENHA').Value := login_senha.text;
DMS.QUERY.ExecSQL;
if dms.QUERY.IsEmpty = True then
BEGIN
 MessageDlg('Senha ou Usuario incorretos!',mtError, [mbOk], 0);
END
else
begin
LoginService.Close;
end;
end;

end.
