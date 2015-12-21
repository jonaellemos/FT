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
    procedure descricaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SelecionarGrid;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaTarefa: TConsultaTarefa;

implementation

{$R *.dfm}

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
  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add('UPDATE TAREFAS SET STATUS=:STATUS WHERE LOJA='+captionloja.Caption+' AND DESCRICAO=:DESCRICAO AND ID='+id.Caption+'');
  DMS.QUERY.Parameters.ParamByName('STATUS').Value := 'PENDENTE';
  DMS.QUERY.Parameters.ParamByName('DESCRICAO').Value := captiontarefa.Caption;
  DMS.QUERY.ExecSQL;
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
  DMS.QUERY.SQL.Clear;
  DMS.QUERY.SQL.Add('UPDATE TAREFAS SET STATUS=:STATUS WHERE LOJA='+captionloja.Caption+' AND DESCRICAO=:DESCRICAO AND ID='+id.Caption+'');
  DMS.QUERY.Parameters.ParamByName('STATUS').Value := 'FINALIZADO';
  DMS.QUERY.Parameters.ParamByName('DESCRICAO').Value := captiontarefa.Caption;
  DMS.QUERY.ExecSQL;
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
