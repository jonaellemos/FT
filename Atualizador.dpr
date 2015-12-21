program Atualizador;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Windows;

  var
  Parar: String;


begin
  try

  { TODO -oUser -cConsole Main : Insert code here }
  if not DirectoryExists('C:\FT') then
  ForceDirectories('C:\FT');
  Writeln('Por favor aguarde, estamos atualizando o Sistema :)');
  CopyFile('\\14.0.0.112\acervo digital\REPOSITORIO\FT.exe','C:\FT\FT.EXE',False);
  Writeln('Seja Bem Vindo ao FT');
  Writeln('');
  Writeln('Atenciosamente - Departamento de TI - CEARA');
  //Readln(Parar);
  Sleep(2090);
  WinExec('c:\\FT\FT.exe',Sw_ShowNormal);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
