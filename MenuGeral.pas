unit MenuGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage,LoginT, Vcl.Mask,DM,
  Vcl.ComCtrls;

type
  TGeralMenu = class(TForm)
    Menu: TMainMenu;
    PROCESSAMENTOS: TMenuItem;
    CONSULTAS: TMenuItem;
    SOBRE: TMenuItem;
    SERINT1: TMenuItem;
    VISITATECNICA1: TMenuItem;
    RAT1: TMenuItem;
    ELEFONEMA1: TMenuItem;
    ICKETS1: TMenuItem;
    CHAMADOS1: TMenuItem;
    EQUIPAMENTODEF1: TMenuItem;
    USUARIOS1: TMenuItem;
    LOJAS1: TMenuItem;
    AREFAS1: TMenuItem;
    CADASTROS: TMenuItem;
    SUPERVISORES1: TMenuItem;
    EQUIPAMENTOS1: TMenuItem;
    SERINT2: TMenuItem;
    RAT2: TMenuItem;
    ICKET1: TMenuItem;
    ICKETS2: TMenuItem;
    VISITATECNICA2: TMenuItem;
    AGENDASEMANAL1: TMenuItem;
    CHAMADOSABERTOS1: TMenuItem;
    EQUIPAMENTOSDEF1: TMenuItem;
    AREFAS2: TMenuItem;
    LOJAS3: TMenuItem;
    Image1: TImage;
    titulo: TLabel;
    login_usuario: TEdit;
    login_senha: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    USUARIOS2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LOJAS3Click(Sender: TObject);
    procedure AREFAS1Click(Sender: TObject);
    procedure AREFAS2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ValidaUsuario;
    procedure Button1Click(Sender: TObject);
    procedure USUARIOS2Click(Sender: TObject);
    procedure ELEFONEMA1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GeralMenu: TGeralMenu;

implementation

{$R *.dfm}

uses Login, PrincipalM, CTarefas, ConsultaTarefas, CadastroUsuario, TLigacao;

procedure TGeralMenu.AREFAS1Click(Sender: TObject);
begin
CTarefa.Show;
end;

procedure TGeralMenu.AREFAS2Click(Sender: TObject);
begin
ConsultaTarefa.Show;
end;

procedure TGeralMenu.Button1Click(Sender: TObject);
begin
ValidaUsuario();
end;

procedure TGeralMenu.ELEFONEMA1Click(Sender: TObject);
begin
GerarLigacao.Show;
end;

procedure TGeralMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//Logon.Close;
end;

procedure TGeralMenu.FormCreate(Sender: TObject);
begin
//GeralMenu.Show;
//LoginService:= TLoginService.Create(Self);
//LoginService.ShowModal;
GeralMenu.CONSULTAS.Enabled := False;
GeralMenu.PROCESSAMENTOS.Enabled := False;
GeralMenu.CADASTROS.Enabled := False;
GeralMenu.SOBRE.Enabled := False;

end;

procedure TGeralMenu.LOJAS3Click(Sender: TObject);
begin
Application.CreateForm(TPrincipal,Principal);
Principal.Show;
end;

procedure TGeralMenu.USUARIOS2Click(Sender: TObject);
begin
CadastrarUsuario.Show;
end;

procedure TGeralMenu.ValidaUsuario;
begin
//dms.QUERY.Close;
dms.QUERY.SQL.Clear;
dms.QUERY.SQL.Append('SELECT * FROM USUARIOS WHERE USUARIO=:USUARIO AND SENHA =:SENHA');
dms.QUERY.Parameters.ParamByName('USUARIO').Value := login_usuario.Text;
dms.QUERY.Parameters.ParamByName('SENHA').Value := login_senha.text;
dms.QUERY.Open;
//DMS.QUERY.ExecSQL;
//ADD

if dms.QUERY.IsEmpty then
BEGIN
MessageDlg('Senha ou Usuario incorretos!',mtError, [mbOk], 0);
END
else
begin
MessageDlg('Bem Vindo '+login_usuario.Text+ '!',mtInformation, [mbOk], 0);
GeralMenu.CONSULTAS.Enabled := True;
GeralMenu.PROCESSAMENTOS.Enabled := True;
GeralMenu.CADASTROS.Enabled := True;
GeralMenu.SOBRE.Enabled := True;
Login_usuario.Hide;
Login_Senha.Hide;
Button1.Hide;
titulo.Hide;
end;
end;

//Atualizei aqui
//21-12-2015
//17:10
//A
end.
