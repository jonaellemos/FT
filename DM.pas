unit DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Datasnap.Provider, IniFiles;

type
  TDMS = class(TDataModule)
    QUERY: TADOQuery;
    DT: TDataSource;
    QueryGrid: TADOQuery;
    QueryGridLOJAINF: TWideStringField;
    QueryGridLOJAPROC: TWideStringField;
    QueryGridUNIDADE: TWideStringField;
    QueryGridENDERECO: TWideStringField;
    QueryGridBAIRRO: TWideStringField;
    QueryGridCIDADE: TWideStringField;
    QueryGridCNPJ: TWideStringField;
    QueryGridEMAIL: TWideStringField;
    QueryGridGERENTE: TWideStringField;
    QueryGridSUPERVISOR: TWideStringField;
    QueryGridTELLOJA: TWideStringField;
    QueryGridTELGERENTE: TWideStringField;
    QueryGridRAZAOSOCIAL: TWideStringField;
    Conexao: TADOConnection;
    QueryGridTEAMSERVIDOR: TWideStringField;
    QueryGridTEAMCPD: TWideStringField;
    QueryGridTEAMCAIXA: TWideStringField;
    QueryGridTEAMSOM: TWideStringField;
    QueryGridTEAMCAIXA2: TWideStringField;
    Controle: TADOQuery;
    DT2: TDataSource;
    GridTarefas: TADOQuery;
    GridTarefasDESCRICAO: TWideStringField;
    GridTarefasLOJA: TWideStringField;
    GridTarefasSTATUS: TWideStringField;
    GridTarefasID: TAutoIncField;
    GridLigacoes: TADOQuery;
    DT3: TDataSource;
    GridLigacoesIDLIGACAO: TAutoIncField;
    GridLigacoesLOJAPROC: TIntegerField;
    GridLigacoesTELEFONECONTATO: TWideStringField;
    GridLigacoesPROTOCOLO: TWideStringField;
    GridLigacoesDATAGERADA: TWideStringField;
    GridLigacoesASSUNTO: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMS: TDMS;
  SERVIDOR: string;
  arqIni : TiniFile;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMS.DataModuleCreate(Sender: TObject);
begin
Conexao.Connected :=False;

arqIni := Tinifile.Create('C:\FT\Config.ini'); // Caminho do arquivo.
SERVIDOR := arqIni.ReadString('CONEXAO', 'SERVIDOR', '');
Conexao.ConnectionString := 'Provider=SQLNCLI10.1;Persist Security Info=False;User ID=SA;Initial Catalog=FT;Data Source='+SERVIDOR+';'+
'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=ZEUS;Initial File Name="";Use Encryption for Data=False;Tag with column collation when possible=False;'+
'MARS Connection=False;DataTypeCompatibility=0;Trust Server Certificate=False;Server SPN=""';

try
Conexao.Connected := true;
except

end;


end;

end.
