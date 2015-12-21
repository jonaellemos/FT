unit PrincipalM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage;

type
  TPrincipal = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Image3: TImage;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Seletor: TComboBox;
    buscador: TEdit;
    lojaproc: TEdit;
    lojainf: TEdit;
    cidade: TEdit;
    endereco: TEdit;
    bairro: TEdit;
    razaosocial: TEdit;
    email: TEdit;
    supervisor: TEdit;
    gerente: TEdit;
    telloja: TEdit;
    telgerente: TEdit;
    cnpj: TEdit;
    unidade: TEdit;
    SeletorAvancado: TComboBox;
    buscador2: TEdit;
    DBGrid1: TDBGrid;
    tservidor: TEdit;
    tcpd: TEdit;
    tpdv01: TEdit;
    tpdv02: TEdit;
    tterminal: TEdit;
    certificadositef: TEdit;
    circuitompls: TEdit;
    iplan: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure buscadorKeyPress(Sender: TObject; var Key: Char);
    procedure buscador2KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    // procedure AtualizarRegistros;

  public
    procedure AtualizarRegistros;
    procedure LimparCampos;
  end;

var
  Principal: TPrincipal;
  hPrWindow: HWND;


implementation

{$R *.dfm}

uses Login, DM, MenuGeral;

procedure TPrincipal.buscador2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DMS.CONEXAO.Connected := TRUE;
    // DMS.QueryGrid.SQL.Clear;

    if SeletorAvancado.Text = 'GERAL' then
    begin
      if buscador2.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QueryGrid.SQL.Clear;
        DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS');
        DMS.QueryGrid.Active := TRUE;
      end
    end
    else if SeletorAvancado.Text = 'SUPERVISOR' then
    begin
      // ShowMessage('Escolheu Supervisor');

      if buscador2.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QueryGrid.SQL.Clear;
        DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS WHERE SUPERVISOR =:PARAM');
        DMS.QueryGrid.Parameters.ParamByName('PARAM').Value := buscador2.Text;
        DMS.QueryGrid.Active := TRUE;
      end

    end
    else if SeletorAvancado.Text = 'ENDEREÇO' then
      if buscador2.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QueryGrid.SQL.Clear;
        DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS WHERE ENDERECO LIKE ''%' +
          buscador2.Text + '%''');
        DMS.QueryGrid.Active := TRUE;
      end
    else if SeletorAvancado.Text = 'CIDADE' then
      if buscador2.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        // ShowMessage('Escolheu Supervisor');
        DMS.QueryGrid.SQL.Clear;
        DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS WHERE CIDADE LIKE ''%' +
          buscador2.Text + '%''');
        DMS.QueryGrid.Active := TRUE;
      end

    else if SeletorAvancado.Text = 'BAIRRO' then
      if buscador2.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        // ShowMessage('Escolheu Supervisor');
        DMS.QueryGrid.SQL.Clear;
        DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS WHERE BAIRRO LIKE ''%' +
          buscador2.Text + '%''');;
        DMS.QueryGrid.Active := TRUE;
      end

    else if SeletorAvancado.Text = 'RAZAO SOCIAL' then
      if buscador2.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        // ShowMessage('Escolheu Supervisor');
        DMS.QueryGrid.SQL.Clear;
        DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS WHERE RAZAOSOCIAL LIKE ''%' +
          buscador2.Text + '%''');
        DMS.QueryGrid.Active := TRUE;
      end;

    // else if SeletorAvancado.Text = 'COORDENACAO' then
    // begin
    // ShowMessage('Escolheu Supervisor');
    // DMS.QueryGrid.SQL.Clear;
    // DMS.QueryGrid.SQL.Add('SELECT * FROM LOJAS WHERE CIDADE LIKE ''%' +
    // buscador2.Text + '%''');
    // DMS.QueryGrid.Active := TRUE;
    // end;

  end;

end;

procedure TPrincipal.buscadorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DMS.CONEXAO.Connected := TRUE;
    DMS.QUERY.SQL.Clear;

    if Seletor.Text = 'COD PROCFIT' then
    begin
      // ShowMessage('Escolheu PROCFIT');
      if buscador.Text = '' then
      begin
        // ShowMessage('Preencha os Dados de Pesquisa');
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QUERY.SQL.Add
          ('SELECT LOJAPROC,LOJAINF,UNIDADE,ENDERECO,BAIRRO,CIDADE,CNPJ,EMAIL,GERENTE,RAZAOSOCIAL,SUPERVISOR,TELLOJA,TELGERENTE,TEAMSERVIDOR,TEAMCPD,TEAMCAIXA,TEAMCAIXA2,TEAMSOM,CERTIFICADOSITEF,CIRCUITOMPLS,IPLAN FROM LOJAS WHERE LOJAPROC = '
          + buscador.Text + '');
        DMS.QUERY.ExecSQL;
        DMS.QUERY.Open;
        if DMS.QUERY.IsEmpty then
        begin
          Application.MessageBox('Registro Não Encontrado',
            'MENSAGEM DE AVISO', 0)
        end
        else
        begin
          lojaproc.Text := DMS.QUERY.FieldByName('LOJAPROC').Text;
          lojainf.Text := DMS.QUERY.FieldByName('LOJAINF').Text;
          unidade.Text := DMS.QUERY.FieldByName('UNIDADE').Text;
          endereco.Text := DMS.QUERY.FieldByName('ENDERECO').Text;
          bairro.Text := DMS.QUERY.FieldByName('BAIRRO').Text;
          cidade.Text := DMS.QUERY.FieldByName('CIDADE').Text;
          cnpj.Text := DMS.QUERY.FieldByName('CNPJ').Text;
          email.Text := DMS.QUERY.FieldByName('EMAIL').Text;
          gerente.Text := DMS.QUERY.FieldByName('GERENTE').Text;
          razaosocial.Text := DMS.QUERY.FieldByName('RAZAOSOCIAL').Text;
          telloja.Text := DMS.QUERY.FieldByName('TELLOJA').Text;
          telgerente.Text := DMS.QUERY.FieldByName('TELGERENTE').Text;
          supervisor.Text := DMS.QUERY.FieldByName('SUPERVISOR').Text;

          tServidor.Text := DMS.QUERY.FieldByName('TEAMSERVIDOR').Text;
          tCPD.Text := DMS.QUERY.FieldByName('TEAMCPD').Text;
          tPDV01.Text := DMS.QUERY.FieldByName('TEAMCAIXA').Text;
          tPDV02.Text := DMS.QUERY.FieldByName('TEAMCAIXA2').Text;
          TTerminal.Text := DMS.QUERY.FieldByName('TEAMSOM').Text;

          CERTIFICADOSITEF.Text := DMS.QUERY.FieldByName('CERTIFICADOSITEF').Text;
          CircuitoMPLS.Text := DMS.QUERY.FieldByName('CIRCUITOMPLS').Text;
          IPLAN.Text := DMS.QUERY.FieldByName('IPLAN').Text;



          DMS.CONEXAO.Close;
        end
      end
    end
    else if Seletor.Text = 'COD INFARMA' then
    begin
      // ShowMessage('Escolheu PROCFIT');
      if buscador.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QUERY.SQL.Add
          ('SELECT LOJAPROC,LOJAINF,UNIDADE,ENDERECO,BAIRRO,CIDADE,CNPJ,EMAIL,GERENTE,RAZAOSOCIAL,SUPERVISOR,TELLOJA,TELGERENTE,TEAMSERVIDOR,TEAMCPD,TEAMCAIXA,TEAMCAIXA2,TEAMSOM,CERTIFICADOSITEF,CIRCUITOMPLS,IPLAN FROM LOJAS WHERE LOJAINF = '
          + buscador.Text + '');
        DMS.QUERY.ExecSQL;
        DMS.QUERY.Open;
        if DMS.QUERY.IsEmpty then
        begin
          Application.MessageBox('Registro Não Encontrado',
            'MENSAGEM DE AVISO', 0)
        end
        else
        begin
          lojaproc.Text := DMS.QUERY.FieldByName('LOJAPROC').Text;
          lojainf.Text := DMS.QUERY.FieldByName('LOJAINF').Text;
          unidade.Text := DMS.QUERY.FieldByName('UNIDADE').Text;
          endereco.Text := DMS.QUERY.FieldByName('ENDERECO').Text;
          bairro.Text := DMS.QUERY.FieldByName('BAIRRO').Text;
          cidade.Text := DMS.QUERY.FieldByName('CIDADE').Text;
          cnpj.Text := DMS.QUERY.FieldByName('CNPJ').Text;
          email.Text := DMS.QUERY.FieldByName('EMAIL').Text;
          gerente.Text := DMS.QUERY.FieldByName('GERENTE').Text;
          razaosocial.Text := DMS.QUERY.FieldByName('RAZAOSOCIAL').Text;
          telloja.Text := DMS.QUERY.FieldByName('TELLOJA').Text;
          telgerente.Text := DMS.QUERY.FieldByName('TELGERENTE').Text;
          supervisor.Text := DMS.QUERY.FieldByName('SUPERVISOR').Text;
          tServidor.Text := DMS.QUERY.FieldByName('TEAMSERVIDOR').Text;
          tCPD.Text := DMS.QUERY.FieldByName('TEAMCPD').Text;
          tPDV01.Text := DMS.QUERY.FieldByName('TEAMCAIXA').Text;
          tPDV02.Text := DMS.QUERY.FieldByName('TEAMCAIXA2').Text;
          TTerminal.Text := DMS.QUERY.FieldByName('TEAMSOM').Text;
          CERTIFICADOSITEF.Text := DMS.QUERY.FieldByName('CERTIFICADOSITEF').Text;
          CircuitoMPLS.Text := DMS.QUERY.FieldByName('CIRCUITOMPLS').Text;
          IPLAN.Text := DMS.QUERY.FieldByName('IPLAN').Text;

          DMS.CONEXAO.Close;
        end
      end
    end
    else if Seletor.Text = 'UNIDADE' then
    begin
      // ShowMessage('Escolheu UNIDADE') ;
      if buscador.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QUERY.SQL.Add
          ('SELECT LOJAPROC,LOJAINF,UNIDADE,ENDERECO,BAIRRO,CIDADE,CNPJ,EMAIL,GERENTE,RAZAOSOCIAL,SUPERVISOR,TELLOJA,TELGERENTE,TEAMSERVIDOR,TEAMCPD,TEAMCAIXA,TEAMCAIXA2,TEAMSOM,CERTIFICADOSITEF,CIRCUITOMPLS,IPLAN FROM LOJAS WHERE UNIDADE LIKE ''%'
          + buscador.Text + '%''');
        DMS.QUERY.ExecSQL;
        DMS.QUERY.Open;
        if DMS.QUERY.IsEmpty then
        begin
          Application.MessageBox('Registro Não Encontrado',
            'MENSAGEM DE AVISO', 0)
        end
        else
        begin
          lojaproc.Text := DMS.QUERY.FieldByName('LOJAPROC').Text;
          lojainf.Text := DMS.QUERY.FieldByName('LOJAINF').Text;
          unidade.Text := DMS.QUERY.FieldByName('UNIDADE').Text;
          endereco.Text := DMS.QUERY.FieldByName('ENDERECO').Text;
          bairro.Text := DMS.QUERY.FieldByName('BAIRRO').Text;
          cidade.Text := DMS.QUERY.FieldByName('CIDADE').Text;
          cnpj.Text := DMS.QUERY.FieldByName('CNPJ').Text;
          email.Text := DMS.QUERY.FieldByName('EMAIL').Text;
          gerente.Text := DMS.QUERY.FieldByName('GERENTE').Text;
          razaosocial.Text := DMS.QUERY.FieldByName('RAZAOSOCIAL').Text;
          telloja.Text := DMS.QUERY.FieldByName('TELLOJA').Text;
          telgerente.Text := DMS.QUERY.FieldByName('TELGERENTE').Text;
          supervisor.Text := DMS.QUERY.FieldByName('SUPERVISOR').Text;
          tServidor.Text := DMS.QUERY.FieldByName('TEAMSERVIDOR').Text;
          tCPD.Text := DMS.QUERY.FieldByName('TEAMCPD').Text;
          tPDV01.Text := DMS.QUERY.FieldByName('TEAMCAIXA').Text;
          tPDV02.Text := DMS.QUERY.FieldByName('TEAMCAIXA2').Text;
          TTerminal.Text := DMS.QUERY.FieldByName('TEAMSOM').Text;
          CERTIFICADOSITEF.Text := DMS.QUERY.FieldByName('CERTIFICADOSITEF').Text;
          CircuitoMPLS.Text := DMS.QUERY.FieldByName('CIRCUITOMPLS').Text;
          IPLAN.Text := DMS.QUERY.FieldByName('IPLAN').Text;
          DMS.CONEXAO.Close;
        end
      end
    end
    else if Seletor.Text = 'CNPJ' then
    begin
      // ShowMessage('Escolheu CNPJ');
      if buscador.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QUERY.SQL.Add
          ('SELECT LOJAPROC,LOJAINF,UNIDADE,ENDERECO,BAIRRO,CIDADE,CNPJ,EMAIL,GERENTE,RAZAOSOCIAL,SUPERVISOR,TELLOJA,TELGERENTE,TEAMSERVIDOR,TEAMCPD,TEAMCAIXA,TEAMCAIXA2,TEAMSOM,CERTIFICADOSITEF,CIRCUITOMPLS,IPLAN FROM LOJAS WHERE CNPJ_J = '
          + buscador.Text + '');
        DMS.QUERY.ExecSQL;
        DMS.QUERY.Open;
        if DMS.QUERY.IsEmpty then
        begin
          Application.MessageBox('Registro Não Encontrado',
            'MENSAGEM DE AVISO', 0)
        end
        else
        begin
          lojaproc.Text := DMS.QUERY.FieldByName('LOJAPROC').Text;
          lojainf.Text := DMS.QUERY.FieldByName('LOJAINF').Text;
          unidade.Text := DMS.QUERY.FieldByName('UNIDADE').Text;
          endereco.Text := DMS.QUERY.FieldByName('ENDERECO').Text;
          bairro.Text := DMS.QUERY.FieldByName('BAIRRO').Text;
          cidade.Text := DMS.QUERY.FieldByName('CIDADE').Text;
          cnpj.Text := DMS.QUERY.FieldByName('CNPJ').Text;
          email.Text := DMS.QUERY.FieldByName('EMAIL').Text;
          gerente.Text := DMS.QUERY.FieldByName('GERENTE').Text;
          razaosocial.Text := DMS.QUERY.FieldByName('RAZAOSOCIAL').Text;
          telloja.Text := DMS.QUERY.FieldByName('TELLOJA').Text;
          telgerente.Text := DMS.QUERY.FieldByName('TELGERENTE').Text;
          supervisor.Text := DMS.QUERY.FieldByName('SUPERVISOR').Text;
          tServidor.Text := DMS.QUERY.FieldByName('TEAMSERVIDOR').Text;
          tCPD.Text := DMS.QUERY.FieldByName('TEAMCPD').Text;
          tPDV01.Text := DMS.QUERY.FieldByName('TEAMCAIXA').Text;
          tPDV02.Text := DMS.QUERY.FieldByName('TEAMCAIXA2').Text;
          TTerminal.Text := DMS.QUERY.FieldByName('TEAMSOM').Text;
          CERTIFICADOSITEF.Text := DMS.QUERY.FieldByName('CERTIFICADOSITEF').Text;
          CircuitoMPLS.Text := DMS.QUERY.FieldByName('CIRCUITOMPLS').Text;
          IPLAN.Text := DMS.QUERY.FieldByName('IPLAN').Text;
          DMS.CONEXAO.Close;
        end
      end
    end
    else if Seletor.Text = 'GERENTE' then
    begin
      if buscador.Text = '' then
      begin
        Application.MessageBox('Preencha os Dados Para Efetuar a Pesquisa',
          'MENSAGEM DE AVISO', 0)
      end
      else
      begin
        DMS.QUERY.SQL.Add
          ('SELECT LOJAPROC,LOJAINF,UNIDADE,ENDERECO,BAIRRO,CIDADE,CNPJ,EMAIL,GERENTE,RAZAOSOCIAL,SUPERVISOR,TELLOJA,TELGERENTE,TEAMSERVIDOR,TEAMCPD,TEAMCAIXA,TEAMCAIXA2,TEAMSOM,CERTIFICADOSITEF,CIRCUITOMPLS,IPLAN FROM LOJAS WHERE GERENTE LIKE ''%'
          + buscador.Text + '%''');
        DMS.QUERY.ExecSQL;
        DMS.QUERY.Open;
        if DMS.QUERY.IsEmpty then
        begin
          Application.MessageBox('Registro Não Encontrado',
            'MENSAGEM DE AVISO', 0)
        end
        else
        begin
          lojaproc.Text := DMS.QUERY.FieldByName('LOJAPROC').Text;
          lojainf.Text := DMS.QUERY.FieldByName('LOJAINF').Text;
          unidade.Text := DMS.QUERY.FieldByName('UNIDADE').Text;
          endereco.Text := DMS.QUERY.FieldByName('ENDERECO').Text;
          bairro.Text := DMS.QUERY.FieldByName('BAIRRO').Text;
          cidade.Text := DMS.QUERY.FieldByName('CIDADE').Text;
          cnpj.Text := DMS.QUERY.FieldByName('CNPJ').Text;
          email.Text := DMS.QUERY.FieldByName('EMAIL').Text;
          gerente.Text := DMS.QUERY.FieldByName('GERENTE').Text;
          razaosocial.Text := DMS.QUERY.FieldByName('RAZAOSOCIAL').Text;
          telloja.Text := DMS.QUERY.FieldByName('TELLOJA').Text;
          telgerente.Text := DMS.QUERY.FieldByName('TELGERENTE').Text;
          supervisor.Text := DMS.QUERY.FieldByName('SUPERVISOR').Text;
          tServidor.Text := DMS.QUERY.FieldByName('TEAMSERVIDOR').Text;
          tCPD.Text := DMS.QUERY.FieldByName('TEAMCPD').Text;
          tPDV01.Text := DMS.QUERY.FieldByName('TEAMCAIXA').Text;
          tPDV02.Text := DMS.QUERY.FieldByName('TEAMCAIXA2').Text;
          TTerminal.Text := DMS.QUERY.FieldByName('TEAMSOM').Text;
          CERTIFICADOSITEF.Text := DMS.QUERY.FieldByName('CERTIFICADOSITEF').Text;
          CircuitoMPLS.Text := DMS.QUERY.FieldByName('CIRCUITOMPLS').Text;
          IPLAN.Text := DMS.QUERY.FieldByName('IPLAN').Text;
          DMS.CONEXAO.Close;
          // AtualizarRegistros();
        end
      end
    end

  end
end;

procedure TPrincipal.DBGrid1CellClick(Column: TColumn);
begin
LimparCampos();
Seletor.ItemIndex := 0;
buscador.Text := DMS.QueryGrid.FieldByName('LOJAPROC').AsString;
DMS.Controle.SQL.Clear;
//ShowMessage(DMS.Controle.SQL.Text);
        DMS.Controle.SQL.Add
          ('SELECT LOJAPROC,LOJAINF,UNIDADE,ENDERECO,BAIRRO,CIDADE,CNPJ,EMAIL,GERENTE,RAZAOSOCIAL,SUPERVISOR,TELLOJA,TELGERENTE,TEAMSERVIDOR,TEAMCPD,TEAMCAIXA,TEAMCAIXA2,TEAMSOM,CERTIFICADOSITEF,CIRCUITOMPLS,IPLAN FROM LOJAS WHERE LOJAPROC = '
          + buscador.Text + '');
        //  ShowMessage(DMS.Controle.SQL.Text);
        DMS.Controle.ExecSQL;
        DMS.Controle.Open;
          lojaproc.Text := DMS.Controle.FieldByName('LOJAPROC').Text;
          lojainf.Text := DMS.Controle.FieldByName('LOJAINF').Text;
          unidade.Text := DMS.Controle.FieldByName('UNIDADE').Text;
          endereco.Text := DMS.Controle.FieldByName('ENDERECO').Text;
          bairro.Text := DMS.Controle.FieldByName('BAIRRO').Text;
          cidade.Text := DMS.Controle.FieldByName('CIDADE').Text;
          cnpj.Text := DMS.Controle.FieldByName('CNPJ').Text;
          email.Text := DMS.Controle.FieldByName('EMAIL').Text;
          gerente.Text := DMS.Controle.FieldByName('GERENTE').Text;
          razaosocial.Text := DMS.Controle.FieldByName('RAZAOSOCIAL').Text;
          telloja.Text := DMS.Controle.FieldByName('TELLOJA').Text;
          telgerente.Text := DMS.Controle.FieldByName('TELGERENTE').Text;
          supervisor.Text := DMS.Controle.FieldByName('SUPERVISOR').Text;
          tServidor.Text := DMS.Controle.FieldByName('TEAMSERVIDOR').Text;
          tCPD.Text := DMS.Controle.FieldByName('TEAMCPD').Text;
          tPDV01.Text := DMS.Controle.FieldByName('TEAMCAIXA').Text;
          tPDV02.Text := DMS.Controle.FieldByName('TEAMCAIXA2').Text;
          TTerminal.Text := DMS.Controle.FieldByName('TEAMSOM').Text;
          CERTIFICADOSITEF.Text := DMS.Controle.FieldByName('CERTIFICADOSITEF').Text;
          CircuitoMPLS.Text := DMS.Controle.FieldByName('CIRCUITOMPLS').Text;
          IPLAN.Text := DMS.Controle.FieldByName('IPLAN').Text;
  //DMS.CONEXAO.Close;
end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // GeralMenu.ShowModal;
end;

procedure TPrincipal.SpeedButton2Click(Sender: TObject);
begin
  AtualizarRegistros();
end;

procedure TPrincipal.SpeedButton5Click(Sender: TObject);
begin
  ShowMessage('Calminha, estamos em desenvolvimento :) ');
end;

procedure TPrincipal.SpeedButton6Click(Sender: TObject);
begin
LimparCampos();
end;

procedure TPrincipal.SpeedButton7Click(Sender: TObject);
begin
Principal.Close;
end;

procedure TPrincipal.SpeedButton8Click(Sender: TObject);
begin
  hPrWindow := Principal.WindowHandle;
  SendMessage(hPrWindow, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TPrincipal.AtualizarRegistros;
begin
  DMS.Controle.SQL.Clear;
  DMS.Controle.SQL.ADD('UPDATE LOJAS SET TEAMSERVIDOR=:TSERVIDOR, TEAMCPD =:TCPD, TEAMCAIXA =:TPDV01, TEAMCAIXA2=:TPDV02, TEAMSOM =:TSOM, SUPERVISOR=:TSUPERVISOR WHERE LOJAPROC ='+LOJAPROC.Text+'');
  DMS.Controle.Parameters.ParamByName('TSERVIDOR').Value := Tservidor.Text;
  DMS.Controle.Parameters.ParamByName('TCPD').Value := Tcpd.Text;
  DMS.Controle.Parameters.ParamByName('TPDV01').Value := Tpdv01.Text;
  DMS.Controle.Parameters.ParamByName('TPDV02').Value := Tpdv02.Text;
  DMS.Controle.Parameters.ParamByName('TSOM').Value := Tterminal.Text;
  DMS.Controle.Parameters.ParamByName('TSUPERVISOR').Value := Supervisor.Text;
  DMS.Controle.ExecSQL;
  ShowMessage('REGISTRO ALTERADO!');
end;

procedure TPrincipal.LimparCampos;
begin
          lojaproc.Text := '';
          lojainf.Text := '';
          unidade.Text := '';
          endereco.Text := '';
          bairro.Text := '';
          cidade.Text := '';
          cnpj.Text := '';
          email.Text := '';
          gerente.Text := '';
          razaosocial.Text := '';
          telloja.Text := '';
          telgerente.Text := '';
          supervisor.Text := '';
          tServidor.Text := '';
          tCPD.Text := '';
          tPDV01.Text := '';
          tPDV02.Text := '';
          TTerminal.Text := '';
          CERTIFICADOSITEF.Text := '';
          CIRCUITOMPLS.Text := '';
          IPLAN.Text := '';
end;

end.
