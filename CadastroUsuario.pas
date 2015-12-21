unit CadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons, DM;

type
  TCadastrarUsuario = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    login_usuario: TEdit;
    login_senha: TMaskEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastrarUsuario: TCadastrarUsuario;

implementation

{$R *.dfm}

procedure TCadastrarUsuario.Button1Click(Sender: TObject);
begin
DMS.QUERY.SQL.Clear;
dms.QUERY.SQL.Text := 'INSERT INTO USUARIOS (USUARIO,SENHA) VALUES (:USUARIO,:SENHA)';
DMS.QUERY.Parameters.ParamByName('USUARIO').Value := LOGIN_USUARIO.Text;
DMS.QUERY.Parameters.ParamByName('SENHA').Value := LOGIN_SENHA.Text;
DMS.QUERY.ExecSQL;
ShowMessage('USUARIO CADASTRADO COM SUCESSO!');
LOGIN_SENHA.Text := '';
LOGIN_USUARIO.Text := '';

//Alteração de Cadastro de Usuário: 18/12/2015 16:11:00
//NovoTeste
//Ultimo Teste!!
//Vamo que Vamo
//Reverso
//Inverso
//Ah va
//Força
//Eai?
end;

end.
