program FTSERVICE;

uses
  Vcl.Forms,
  PrincipalM in 'PrincipalM.pas' {Principal},
  Vcl.Themes,
  Vcl.Styles,
  DM in 'DM.pas' {DMS: TDataModule},
  MenuGeral in 'MenuGeral.pas' {GeralMenu},
  CTarefas in 'CTarefas.pas' {CTarefa},
  ConsultaTarefas in 'ConsultaTarefas.pas' {ConsultaTarefa},
  LoginT in 'LoginT.pas' {LoginService},
  CadastroUsuario in 'CadastroUsuario.pas' {CadastrarUsuario},
  TLigacao in 'TLigacao.pas' {GerarLigacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGeralMenu, GeralMenu);
  Application.CreateForm(TLoginService, LoginService);
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDMS, DMS);
  Application.CreateForm(TCTarefa, CTarefa);
  Application.CreateForm(TConsultaTarefa, ConsultaTarefa);
  Application.CreateForm(TCadastrarUsuario, CadastrarUsuario);
  Application.CreateForm(TGerarLigacao, GerarLigacao);
  Application.Run;
end.
