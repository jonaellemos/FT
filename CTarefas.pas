unit CTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DM;

type
  TCTarefa = class(TForm)
    descricao: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CTarefa: TCTarefa;

implementation

{$R *.dfm}

procedure TCTarefa.Button1Click(Sender: TObject);
begin
  DMS.Conexao.Close;

  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add('DROP TABLE TAREFAS_LOG');
  DMS.QUERY.ExecSQL;

  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add
    ('CREATE TABLE TAREFAS_LOG (LOJA int, STATUS varchar(12) default ''PENDENTE'', DESCRICAO varchar(50))');
  DMS.QUERY.ExecSQL;

  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add('INSERT INTO TAREFAS_LOG(LOJA) SELECT LOJAPROC FROM LOJAS');
  DMS.QUERY.ExecSQL;

  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add('UPDATE TAREFAS_LOG SET DESCRICAO =:DESCRICAO');
  DMS.QUERY.Parameters.ParamByName('DESCRICAO').Value := descricao.Text;
  DMS.QUERY.ExecSQL;

  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add
    ('INSERT INTO TAREFAS (LOJA,STATUS,DESCRICAO)SELECT LOJA,STATUS,DESCRICAO FROM TAREFAS_LOG');
  DMS.QUERY.ExecSQL;

  ShowMessage('Tarefa Criada com Sucesso!');
  DESCRICAO.Text := '';

end;

end.
