unit FVisitaTecnica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Imaging.pngimage,DM;

type
  TVisitaTecnica = class(TForm)
    Image1: TImage;
    assunto: TMemo;
    agendador: TMaskEdit;
    idvisita: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    lojaproc: TEdit;
    datainicial: TEdit;
    status: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
  private
//
  public
  procedure AtualizaGrid;
  end;

var
  VisitaTecnica: TVisitaTecnica;

implementation

{$R *.dfm}

procedure TVisitaTecnica.Button1Click(Sender: TObject);
begin
dms.GridVisitaPendente.SQL.Clear;
dms.GridVisitaPendente.SQL.Add('SELECT *  FROM VISITA_TECNICA WHERE STATUS = ''PENDENTE'' ORDER BY DATAINICIAL');
dms.GridVisitaPendente.ExecSQL;
dms.GridVisitaPendente.Open;
dms.GridVisitaPendente.Active := TRUE;
end;

procedure TVisitaTecnica.Button2Click(Sender: TObject);
begin
dms.QUERY.SQL.Clear;
dms.QUERY.SQL.Add('UPDATE VISITA_TECNICA SET DATAAGENDAMENTO =:DATAAGENDAMENTO,STATUS = ''AGENDADA'' WHERE IDVISITA=:IDVISITA');
dms.QUERY.Parameters.ParamByName('DATAAGENDAMENTO').Value := agendador.Text;
dms.QUERY.Parameters.ParamByName('IDVISITA').Value := idvisita.Text;
dms.QUERY.ExecSQL;
ShowMessage('Agendada Visita a loja '+lojaproc.Text+' para o dia '+agendador.text+'');
atualizagrid();
end;

procedure TVisitaTecnica.Button3Click(Sender: TObject);
begin
dms.GridVisitaAgendada.SQL.Clear;
dms.GridVisitaAgendada.SQL.Add('SELECT *  FROM VISITA_TECNICA WHERE STATUS = ''AGENDADA'' ORDER BY DATAAGENDAMENTO');
dms.GridVisitaAgendada.ExecSQL;
dms.GridVisitaAgendada.Open;
dms.GridVisitaAgendada.Active := TRUE;

end;

procedure TVisitaTecnica.DBGrid1CellClick(Column: TColumn);
begin
  dms.GridVisitaAgendada.SQL.Clear;
  dms.GridVisitaAgendada.SQL.Add
    ('SELECT *  FROM VISITA_TECNICA WHERE STATUS = ''AGENDADA''');
  dms.GridVisitaAgendada.ExecSQL;
  lojaproc.Text := dms.GridVisitaPendente.FieldByName('LOJAPROC').Text;
  idvisita.Text := dms.GridVisitaPendente.FieldByName('IDVISITA').Text;
  datainicial.Text := dms.GridVisitaPendente.FieldByName('DATAINICIAL').Text;
  assunto.Text := dms.GridVisitaPendente.FieldByName('ASSUNTO').Text;
  status.Text := dms.GridVisitaPendente.FieldByName('STATUS').Text;
  dms.GridVisitaPendente.Open;
end;

procedure TVisitaTecnica.AtualizaGrid;
begin
  dms.GridVisitaAgendada.Active := FALSE;
  dms.GridVisitaPendente.Active := FALSE;

dms.GridVisitaPendente.SQL.Clear;
dms.GridVisitaPendente.SQL.Add('SELECT *  FROM VISITA_TECNICA WHERE STATUS = ''PENDENTE'' ORDER BY DATAINICIAL');
dms.GridVisitaPendente.ExecSQL;
dms.GridVisitaPendente.Open;
dms.GridVisitaPendente.Active := TRUE;

dms.GridVisitaAgendada.SQL.Clear;
dms.GridVisitaAgendada.SQL.Add('SELECT *  FROM VISITA_TECNICA WHERE STATUS = ''AGENDADA'' ORDER BY DATAAGENDAMENTO');
dms.GridVisitaAgendada.ExecSQL;
dms.GridVisitaAgendada.Open;
dms.GridVisitaAgendada.Active := TRUE;


end;

//Fim de Programação
//Fim de Programação para o almoço.
end.
