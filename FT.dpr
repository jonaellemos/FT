program FT;

uses
  Vcl.Forms,
  PrincipalM in 'PrincipalM.pas' {Principal},
  Vcl.Themes,
  Vcl.Styles,
  DM in 'DM.pas' {DMS: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDMS, DMS);
  Application.Run;
end.
