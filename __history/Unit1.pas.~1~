unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.FMTBcd, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, Data.SqlExpr, Vcl.DBCtrls, Vcl.NumberBox, Vcl.Mask,StrUtils,
  Datasnap.Provider, Datasnap.DBClient, Vcl.ComCtrls, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBDef, FireDAC.Phys.IB, FireDAC.Phys.IBBase, FireDAC.Phys.FB;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQueryCadastro: TFDQuery;
    DataSourceCadastro: TDataSource;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    MaskEdit1: TMaskEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    TabSheet2: TTabSheet;
    DateTimePickerInicial: TDateTimePicker;
    DateTimePickerFinal: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    FDQueryConsulta: TFDQuery;
    DataSourceConsulta: TDataSource;
    ButtonConsulta: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Relatorio: TButton;
    FDQueryConsultaDataCompra: TSQLTimeStampField;
    FDQueryConsultaHoradaCompra: TTimeField;
    FDQueryConsultaTipoCombustivel: TWideStringField;
    FDQueryConsultaBomba: TIntegerField;
    FDQueryConsultaValorAbastecimento: TBCDField;
    FDQueryConsultaValorImposto: TBCDField;
    FDQueryConsultaTanque: TIntegerField;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDQueryCadastroDataCompra: TSQLTimeStampField;
    FDQueryCadastroHoradaCompra: TTimeField;
    FDQueryCadastroTipoCombustivel: TWideStringField;
    FDQueryCadastroBomba: TIntegerField;
    FDQueryCadastroValorAbastecimento: TBCDField;
    FDQueryCadastroValorImposto: TBCDField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    FDQueryTanque: TFDQuery;
    DataSourceTanque: TDataSource;
    DBLookupComboBox4: TDBLookupComboBox;
    Label7: TLabel;
    FDQueryCombustivel: TFDQuery;
    DataSourceCombustivel: TDataSource;
    FDQueryBombaConsulta: TFDQuery;
    DataSourceBombaConsulta: TDataSource;
    FDQueryRelatorio: TFDQuery;
    DataSourceRelatorio: TDataSource;
    FDQueryRelatoriovenda: TFMTBCDField;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonConsultaClick(Sender: TObject);
    procedure RelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

Uses unit2;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  lqryAux : TFDQuery;
  lqryAuxCadastro : TFDQuery;
begin
  lqryAuxCadastro := TFDQuery.Create(nil);
  try
   lqryAuxCadastro.Connection := FDConnection1 ;
     With lqryAuxCadastro do
     begin
        close;
        sql.clear;
        sql.Text := 'INSERT INTO abastecimento( ' +
                    '    data_compra,           ' +
                    '    hora_compra,           ' +
                    '    cod_tanque,            ' +
                    '    cod_bomba,             ' +
                    '    vlr_abastecimento,     ' +
                    '    vlr_imposto)           ' +
                    ' VALUES (                  ' +
                    '    current_date,          ' +
                    '    current_time,          ' +
                    '    :cod_tanque,           ' +
                    '    :cod_bomba,            ' +
                    '    :vlr_abastecimento,    ' +
                    '    :vlr_imposto)          ';
        ParamByName('cod_bomba').AsInteger := DBLookupComboBox2.KeyValue;
        lqryAux :=  TfdQuery.Create(nil);
        try
          lqryAux.Connection := FDConnection1 ;
          lqryAux.SQL.Text := 'SELECT cod_tanque FROM bomba where cod_bomba = :cod_bomba';
          lqryAux.ParamByName('cod_bomba').AsInteger := DBLookupComboBox2.KeyValue;
          lqryAux.Open;
          ParamByName('cod_tanque').AsInteger := lqryAux.FieldByName('cod_tanque').AsInteger;
        finally
         freeandnil(lqryAux)
        end;

        ParamByName('vlr_abastecimento').AsFloat := StrToFloat(MaskEdit1.EditText);
        ParamByName('vlr_imposto').AsFloat := StrToFloat(MaskEdit1.Text)*0.013;

        ExecSQL;

     end;

  finally
     freeandnil(lqryAuxCadastro)
  end;

  FDQueryCadastro.Close;
  FDQueryCadastro.Open;
end;

procedure TForm1.ButtonConsultaClick(Sender: TObject);
begin

  if DateTimePickerInicial.DateTime > DateTimePickerFinal.DateTime  then
  begin
    MessageBox(Handle, 'Data Inicial deve ser maior que Data Final','Atenção', MB_YESNO + MB_ICONINFORMATION);
  end;


  With FDQueryConsulta do
  begin
    close;
    sql.clear;
    sql.Text := 'SELECT                                                                   ' +
                '  ab.DATA_COMPRA as "Data Compra",                                       ' +
                '  ab.hora_compra as "Hora da Compra",                                    ' +
                '  ta.cod_tanque as "Tanque",                                             ' +
                '  ti.TIPO_TANQUE as "Tipo Combustivel",                                  ' +
                '  bo.COD_BOMBA as "Bomba",                                               ' +
                '  ab.VLR_ABASTECIMENTO as "Valor Abastecimento",                         ' +
                '  ab.VLR_IMPOSTO as "Valor Imposto"                                      ' +
                'FROM                                                                     ' +
                '  abastecimento ab                                                       ' +
                'INNER JOIN bomba bo                                                      ' +
                ' ON ab.cod_bomba = bo.cod_bomba                                          ' +
                'Inner join tanque ta                                                     ' +
                ' ON bo.cod_tanque = ta.cod_tanque                                        ' +
                'Inner join tipo_combustivel ti                                           ' +
                ' on ta.cod_tipo_combustivel = ti.COD_COMBUSTIVEL                         ' +
                'WHERE TRUE                                                               ' +
                'AND ab.data_compra between :dt_inicial and :dt_final                     ';

    if DBLookupComboBox1.KeyValue <> 0 then
    begin
      Sql.Add('AND bo.cod_bomba = :cod_bomba');
      ParamByName('cod_bomba').AsInteger := DBLookupComboBox1.KeyValue;
    end;

    if DBLookupComboBox3.KeyValue <> 0 then
    begin
      Sql.Add('AND ta.cod_tanque = :cod_tanque');
      ParamByName('cod_tanque').AsInteger := DBLookupComboBox3.KeyValue;
    end;

    if DBLookupComboBox4.KeyValue <> 0 then
    begin
      Sql.Add('AND ti.COD_COMBUSTIVEL = :COD_COMBUSTIVEL');
      ParamByName('COD_COMBUSTIVEL').AsInteger := DBLookupComboBox4.KeyValue;
    end;

    Sql.Add('ORDER BY ab.data_compra,ab.hora_compra,ti.TIPO_TANQUE,bo.COD_BOMBA DESC  ');
    ParamByName('dt_inicial').AsDate := DateTimePickerInicial.Date;
    ParamByName('dt_final').AsDate := DateTimePickerFinal.Date;

    Open;
  end;

  With FDQueryRelatorio do
  begin
    close;
    sql.clear;
    sql.Text := 'SELECT                                                      ' +
                '  SUM(ab.vlr_abastecimento) as "venda"                      ' +
                'FROM                                                        ' +
                '  abastecimento ab                                          ' +
                'INNER JOIN bomba bo                                         ' +
                '  ON ab.cod_bomba = bo.cod_bomba                            ' +
                'Inner join tanque ta                                        ' +
                '  ON bo.cod_tanque = ta.cod_tanque                          ' +
                'Inner join tipo_combustivel ti                              ' +
                '  on ta.cod_tipo_combustivel = ti.COD_COMBUSTIVEL           ' +
                '  WHERE TRUE                                                ' +
                'AND ab.data_compra between :dt_inicial and :dt_final        ';

    if DBLookupComboBox1.KeyValue <> 0 then
    begin
      Sql.Add('AND bo.cod_bomba = :cod_bomba');
      ParamByName('cod_bomba').AsInteger := DBLookupComboBox1.KeyValue;
    end;

    if DBLookupComboBox3.KeyValue <> 0 then
    begin
      Sql.Add('AND ta.cod_tanque = :cod_tanque');
      ParamByName('cod_tanque').AsInteger := DBLookupComboBox3.KeyValue;
    end;

    if DBLookupComboBox4.KeyValue <> 0 then
    begin
      Sql.Add('AND ti.COD_COMBUSTIVEL = :COD_COMBUSTIVEL');
      ParamByName('COD_COMBUSTIVEL').AsInteger := DBLookupComboBox4.KeyValue;
    end;

    Sql.Add('ORDER BY ab.data_compra,ab.hora_compra,ti.TIPO_TANQUE,bo.COD_BOMBA DESC  ');
    ParamByName('dt_inicial').AsDate := DateTimePickerInicial.Date;
    ParamByName('dt_final').AsDate := DateTimePickerFinal.Date;

    Open;
  end;




end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   FDQuery2.Close;
   FDQuery2.Open;
   DBLookupComboBox2.KeyValue := 1;

   FDQueryTanque.Close;
   FDQueryTanque.Open;
   DBLookupComboBox3.KeyValue := 0;

   FDQueryBombaConsulta.Close;
   FDQueryBombaConsulta.Open;
   DBLookupComboBox1.KeyValue := 0;

   FDQueryCombustivel.Close;
   FDQueryCombustivel.Open;
   DBLookupComboBox4.KeyValue := 0;



   FDQueryCadastro.Close;
   FDQueryCadastro.Open;

   FDQueryConsulta.Close;
   FDQueryConsulta.Open;
end;

procedure TForm1.RelatorioClick(Sender: TObject);
begin
  Form2.relpro.Preview();
end;

end.
