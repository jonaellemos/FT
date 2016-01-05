unit ConsultaTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, DM, Vcl.Buttons;

type
  TConsultaTarefa = class(TForm)
    Label1: TLabel;
    descricao: TEdit;
    Image1: TImage;
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    captionloja: TLabel;
    captiontarefa: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    CheckTodos: TCheckBox;
    CheckAntonio: TCheckBox;
    CheckJonael: TCheckBox;
    CheckLayane: TCheckBox;
    CheckHiro: TCheckBox;
    CheckDiego: TCheckBox;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    ID: TLabel;
    Label6: TLabel;
    lbfaltam: TLabel;
    cas: TLabel;
    lbfinalizado: TLabel;
    procedure descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SelecionarGrid;
    procedure jonael;
    //procedure antonio;
    //procedure hiro;
    //procedure diego;
    //procedure layane;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckTodosClick(Sender: TObject);
    procedure CheckJonaelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaTarefa: TConsultaTarefa;

implementation

{$R *.dfm}

procedure TConsultaTarefa.CheckJonaelClick(Sender: TObject);
begin
SelecionarGrid();
end;

procedure TConsultaTarefa.CheckTodosClick(Sender: TObject);
begin
SelecionarGrid();
end;

procedure TConsultaTarefa.DBGrid1CellClick(Column: TColumn);
begin
  captionloja.Caption := DMS.GridTarefas.FieldByName('LOJA').Text;
  captiontarefa.Caption := DMS.GridTarefas.FieldByName('DESCRICAO').Text;
  ID.Caption := DMS.GridTarefas.FieldByName('ID').Text;
end;

procedure TConsultaTarefa.descricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelecionarGrid();
  end
  else
  begin
  end;
end;

procedure TConsultaTarefa.SelecionarGrid;
begin
  DMS.GridTarefas.SQL.Clear;
  DMS.GridTarefas.SQL.Add('SELECT * FROM TAREFAS WHERE DESCRICAO LIKE ''%'+descricao.Text+'%'' AND STATUS=:STATUS ORDER BY LOJA');
  DMS.GridTarefas.Parameters.ParamByName('STATUS').Value := 'PENDENTE';
  DMS.GridTarefas.Active := true;

  DMS.result1.SQL.Clear;
  DMS.result1.SQL.Text := 'SELECT COUNT(STATUS) FROM TAREFAS WHERE STATUS =:STATUS AND DESCRICAO LIKE ''%'+descricao.Text+'%''';
  DMS.result1.Parameters.ParamByName('STATUS').Value := 'PENDENTE';
  DMS.result1.Open;
  lbfaltam.Caption := dms.result1.Fields[0].AsString;

  DMS.result2.SQL.Clear;
  DMS.result2.SQL.Text := 'SELECT COUNT(STATUS) FROM TAREFAS WHERE STATUS =:STATUS AND DESCRICAO LIKE ''%'+descricao.Text+'%''';
  DMS.result2.Parameters.ParamByName('STATUS').Value := 'FINALIZADO';
  DMS.result2.Open;
  lbfinalizado.Caption := dms.result2.Fields[0].AsString;

end;

procedure TConsultaTarefa.Jonael;
begin
  DMS.GridTarefas.SQL.Clear;
  DMS.GridTarefas.SQL.Add('SELECT * FROM TAREFAS WHERE DESCRICAO LIKE ''%'+descricao.Text+'%'' AND STATUS=:STATUS ORDER BY LOJA');
  DMS.GridTarefas.Parameters.ParamByName('STATUS').Value := 'PENDENTE';
  DMS.GridTarefas.Active := true;
end;













procedure TConsultaTarefa.SpeedButton1Click(Sender: TObject);
begin
  DMS.GridTarefas.SQL.Clear;
  DMS.GridTarefas.SQL.Add
    ('SELECT * FROM TAREFAS WHERE STATUS=:STATUS ORDER BY LOJA');
  DMS.GridTarefas.Parameters.ParamByName('STATUS').Value := 'PENDENTE';
  DMS.GridTarefas.Active := true;
end;

procedure TConsultaTarefa.SpeedButton2Click(Sender: TObject);
begin
if CaptionLoja.Caption = 'LOJA' then
begin
  MessageDlg('Antes de Processar, Selecione uma Loja!',mtError, [mbOk], 0);
end
else
begin
  DMS.QUERYTAREFAS.SQL.Clear;
  DMS.QUERYTAREFAS.SQL.Add('UPDATE TAREFAS SET STATUS=:STATUS WHERE LOJA='+captionloja.Caption+' AND DESCRICAO=:DESCRICAO AND ID='+id.Caption+'');
  DMS.QUERYTAREFAS.Parameters.ParamByName('STATUS').Value := 'PENDENTE';
  DMS.QUERYTAREFAS.Parameters.ParamByName('DESCRICAO').Value := captiontarefa.Caption;
  DMS.QUERYTAREFAS.ExecSQL;
  // ShowMessage('Loja ' +captionloja.Caption+ ' Processada com Sucesso!');
  MessageDlg('Loja ' + captionloja.Caption + ' Desfeita com Sucesso!',
    mtWarning, [mbOk], 0);
  SelecionarGrid();
end;
end;

procedure TConsultaTarefa.SpeedButton3Click(Sender: TObject);
begin
if CaptionLoja.Caption = 'LOJA' then
begin
  MessageDlg('Antes de Processar, Selecione uma Loja!',mtError, [mbOk], 0);
end
else
begin
  DMS.QUERYTAREFAS.SQL.Clear;
  DMS.QUERYTAREFAS.SQL.Add('UPDATE TAREFAS SET STATUS=:STATUS WHERE LOJA='+captionloja.Caption+' AND DESCRICAO=:DESCRICAO AND ID='+id.Caption+'');
  DMS.QUERYTAREFAS.Parameters.ParamByName('STATUS').Value := 'FINALIZADO';
  DMS.QUERYTAREFAS.Parameters.ParamByName('DESCRICAO').Value := captiontarefa.Caption;
  DMS.QUERYTAREFAS.ExecSQL;
  // ShowMessage('Loja ' +captionloja.Caption+ ' Processada com Sucesso!');
  MessageDlg('Loja ' + captionloja.Caption + ' Processada com Sucesso!',
    mtInformation, [mbOk], 0);
  SelecionarGrid();

  //lascou menino
  //ie ie
  // lere lere
end;
end;

end.
