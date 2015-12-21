unit TLigacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, DM, Vcl.Imaging.pngimage;

type
  TGerarLigacao = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image2: TImage;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    lojaproc: TEdit;
    gerente: TEdit;
    email: TEdit;
    cnpj: TEdit;
    telfixo: TEdit;
    endereco: TEdit;
    check_atendimento: TCheckBox;
    check_visita: TCheckBox;
    check_serint: TCheckBox;
    check_outros: TCheckBox;
    assunto: TMemo;
    telefone: TMaskEdit;
    Button1: TButton;
    buscarmovimento: TMaskEdit;
    Button2: TButton;
    procedure lojaprocExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure check_outrosClick(Sender: TObject);
    procedure check_atendimentoClick(Sender: TObject);
    procedure check_visitaClick(Sender: TObject);
    procedure check_serintClick(Sender: TObject);

  private
    { Private declarations }
  public
    procedure Inserir_Ligacao;
    procedure ReloadGridLigacoes;
  end;

var
  GerarLigacao: TGerarLigacao;
  Data: String;
  Hora: String;
  Protocolo: String;

implementation

{$R *.dfm}

procedure TGerarLigacao.Button1Click(Sender: TObject);
begin
  if check_outros.Checked = TRUE then
  begin
    Inserir_Ligacao();
    dms.QUERY.SQL.Clear;
    dms.QUERY.SQL.Text :=
      'INSERT INTO PROCESSAMENTOS (LOJAPROC,ASSUNTO,DATAPROCESSAMENTO,TIPO_PROCESSAMENTO) VALUES (:LOJAPROC,:ASSUNTO,:DT,:TIPOPROCESSAMENTO)';
    dms.QUERY.Parameters.ParamByName('LOJAPROC').Value := lojaproc.Text;
    dms.QUERY.Parameters.ParamByName('ASSUNTO').Value := assunto.Text;
    dms.QUERY.Parameters.ParamByName('DT').Value := DateTimeToStr(now);
    dms.QUERY.Parameters.ParamByName('TIPOPROCESSAMENTO').Value :=
      'OUTROS ATENDIMENTOS';
    dms.QUERY.ExecSQL;
    ShowMessage('Ocorrência adicionada a lista de processamento!');
  end

  else if check_atendimento.Checked = TRUE then
  begin
    Inserir_Ligacao();
    dms.QUERY.SQL.Clear;
    dms.QUERY.SQL.Text :=
      'INSERT INTO PROCESSAMENTOS (LOJAPROC,ASSUNTO,DATAPROCESSAMENTO,TIPO_PROCESSAMENTO) VALUES (:LOJAPROC,:ASSUNTO,:DT,:TIPOPROCESSAMENTO)';
    dms.QUERY.Parameters.ParamByName('LOJAPROC').Value := lojaproc.Text;
    dms.QUERY.Parameters.ParamByName('ASSUNTO').Value := assunto.Text;
    dms.QUERY.Parameters.ParamByName('DT').Value := DateTimeToStr(now);
    dms.QUERY.Parameters.ParamByName('TIPOPROCESSAMENTO').Value :=
      'ATENDIMENTO EM ESPERA';
    dms.QUERY.ExecSQL;
    ShowMessage('Ocorrência adicionada a lista de processamento!');
  end

  else if check_visita.Checked = TRUE then
  begin
    Inserir_Ligacao();
    dms.QUERY.SQL.Clear;
    dms.QUERY.SQL.Text :=
      'INSERT INTO PROCESSAMENTOS (LOJAPROC,ASSUNTO,DATAPROCESSAMENTO,TIPO_PROCESSAMENTO) VALUES (:LOJAPROC,:ASSUNTO,:DT,:TIPOPROCESSAMENTO)';
    dms.QUERY.Parameters.ParamByName('LOJAPROC').Value := lojaproc.Text;
    dms.QUERY.Parameters.ParamByName('ASSUNTO').Value := assunto.Text;
    dms.QUERY.Parameters.ParamByName('DT').Value := DateTimeToStr(now);
    dms.QUERY.Parameters.ParamByName('TIPOPROCESSAMENTO').Value :=
      'VISITA TECNICA';
    dms.QUERY.ExecSQL;
    ShowMessage('Ocorrência adicionada a lista de processamento!');
    // INSERINDO VISITA
    dms.QUERY.SQL.Clear;
    dms.QUERY.SQL.Text :=
      'INSERT INTO VISITA_TECNICA (LOJAPROC,ASSUNTO,DATAINICIAL) VALUES (:LOJAPROC,:ASSUNTO,:DT)';
    dms.QUERY.Parameters.ParamByName('LOJAPROC').Value := lojaproc.Text;
    dms.QUERY.Parameters.ParamByName('ASSUNTO').Value := assunto.Text;
    dms.QUERY.Parameters.ParamByName('DT').Value := DateTimeToStr(now);
    dms.QUERY.ExecSQL;
    ShowMessage('Visita Enviada para Agendamento!');
  end

  else if check_serint.Checked = TRUE then
  begin
    Inserir_Ligacao();
    dms.QUERY.SQL.Clear;
    dms.QUERY.SQL.Text :=
      'INSERT INTO PROCESSAMENTOS (LOJAPROC,ASSUNTO,DATAPROCESSAMENTO,TIPO_PROCESSAMENTO) VALUES (:LOJAPROC,:ASSUNTO,:DT,:TIPOPROCESSAMENTO)';
    dms.QUERY.Parameters.ParamByName('LOJAPROC').Value := lojaproc.Text;
    dms.QUERY.Parameters.ParamByName('ASSUNTO').Value := assunto.Text;
    dms.QUERY.Parameters.ParamByName('DT').Value := DateTimeToStr(now);
    dms.QUERY.Parameters.ParamByName('TIPOPROCESSAMENTO').Value := 'SERINT ' +
      lojaproc.Text + '';
    dms.QUERY.ExecSQL;
    ShowMessage('Ocorrência adicionada a lista de processamento!');
  end

  else
  begin
    Inserir_Ligacao();
  end;
end;

procedure TGerarLigacao.lojaprocExit(Sender: TObject);
begin
  dms.QUERY.SQL.Clear;
  dms.QUERY.SQL.ADD
    ('SELECT LOJAPROC,GERENTE,EMAIL,CNPJ,ENDERECO,TELLOJA FROM LOJAS WHERE LOJAPROC='
    + lojaproc.Text + '');
  dms.QUERY.ExecSQL;
  dms.QUERY.Open;
  lojaproc.Text := dms.QUERY.FieldByName('LOJAPROC').Text;
  gerente.Text := dms.QUERY.FieldByName('GERENTE').Text;
  email.Text := dms.QUERY.FieldByName('EMAIL').Text;
  cnpj.Text := dms.QUERY.FieldByName('CNPJ').Text;
  telfixo.Text := dms.QUERY.FieldByName('TELLOJA').Text;
  endereco.Text := dms.QUERY.FieldByName('ENDERECO').Text;

end;

procedure TGerarLigacao.Button2Click(Sender: TObject);
begin
  ReloadGridLigacoes();
end;

procedure TGerarLigacao.check_atendimentoClick(Sender: TObject);
begin
  check_outros.Checked := FALSE;
  check_visita.Checked := FALSE;
  check_serint.Checked := FALSE;
end;

procedure TGerarLigacao.check_outrosClick(Sender: TObject);
begin
  check_atendimento.Checked := FALSE;
  check_visita.Checked := FALSE;
  check_serint.Checked := FALSE;
end;

procedure TGerarLigacao.check_serintClick(Sender: TObject);
begin
  check_outros.Checked := FALSE;
  check_atendimento.Checked := FALSE;
  check_visita.Checked := FALSE;
end;

procedure TGerarLigacao.check_visitaClick(Sender: TObject);
begin
  check_outros.Checked := FALSE;
  check_atendimento.Checked := FALSE;
  check_serint.Checked := FALSE;
end;

procedure TGerarLigacao.Inserir_Ligacao;
begin
  dms.QUERY.SQL.Clear;
  dms.QUERY.SQL.Text :=
    'INSERT INTO LIGACOES (LOJAPROC,TELEFONECONTATO,ASSUNTO,DATAGERADA,PROTOCOLO) VALUES (:LOJAPROC,:TELEFONECONTATO,:ASSUNTO,:DT,:PROTOCOLO)';
  dms.QUERY.Parameters.ParamByName('LOJAPROC').Value := lojaproc.Text;
  dms.QUERY.Parameters.ParamByName('TELEFONECONTATO').Value := telefone.Text;
  dms.QUERY.Parameters.ParamByName('ASSUNTO').Value := assunto.Text;
  dms.QUERY.Parameters.ParamByName('DT').Value := DateTimeToStr(now);
  Data := formatdatetime('ddmmyyyy', now);
  Hora := formatdatetime('hhmmss', now);
  Protocolo := Data + Hora;
  dms.QUERY.Parameters.ParamByName('PROTOCOLO').Value := Protocolo;
  dms.QUERY.ExecSQL;
  ShowMessage('Registro Gerado com Sucesso, seu Protocolo é: ' +
    Protocolo + '');
end;

procedure TGerarLigacao.ReloadGridLigacoes;
begin
  dms.GridLigacoes.SQL.Clear;
  dms.GridLigacoes.SQL.Text :=
    'SELECT * FROM LIGACOES WHERE DATAGERADA LIKE ''%' +
    buscarmovimento.Text + '%''';
  dms.GridLigacoes.Open;
end;

end.

//ai dento
