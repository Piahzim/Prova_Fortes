object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 420
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 923
    Height = 420
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 919
    ExplicitHeight = 419
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 390
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 34
          Top = 16
          Width = 32
          Height = 15
          Caption = 'Valor :'
        end
        object Label2: TLabel
          Left = 22
          Top = 42
          Width = 44
          Height = 15
          Caption = 'Bomba :'
        end
        object Button2: TButton
          Left = 262
          Top = 12
          Width = 75
          Height = 25
          Caption = 'Cadastrar'
          TabOrder = 2
          OnClick = Button2Click
        end
        object MaskEdit1: TMaskEdit
          Left = 72
          Top = 13
          Width = 145
          Height = 23
          TabOrder = 0
          Text = ''
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 72
          Top = 42
          Width = 145
          Height = 23
          KeyField = 'cod_bomba'
          ListField = 'cod_bomba'
          ListSource = DataSource2
          TabOrder = 1
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 95
          Width = 905
          Height = 293
          DataSource = DataSourceCadastro
          ReadOnly = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object Label3: TLabel
        Left = 22
        Top = 64
        Width = 58
        Height = 15
        Caption = 'Data Final :'
      end
      object Label4: TLabel
        Left = 16
        Top = 24
        Width = 64
        Height = 15
        Caption = 'Data Inicial :'
      end
      object Label5: TLabel
        Left = 214
        Top = 26
        Width = 44
        Height = 15
        Caption = 'Bomba :'
      end
      object Label6: TLabel
        Left = 214
        Top = 64
        Width = 44
        Height = 15
        Caption = 'Tanque :'
      end
      object Label7: TLabel
        Left = 431
        Top = 24
        Width = 76
        Height = 15
        Caption = 'Combustivel : '
      end
      object DateTimePickerInicial: TDateTimePicker
        Left = 86
        Top = 24
        Width = 91
        Height = 23
        Date = 45407.000000000000000000
        Time = 0.634685763885499900
        TabOrder = 0
      end
      object DateTimePickerFinal: TDateTimePicker
        Left = 86
        Top = 64
        Width = 91
        Height = 23
        Date = 45407.000000000000000000
        Time = 0.634734108796692500
        TabOrder = 1
      end
      object ButtonConsulta: TButton
        Left = 696
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Consultar'
        TabOrder = 2
        OnClick = ButtonConsultaClick
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 104
        Width = 912
        Height = 286
        DataSource = DataSourceConsulta
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object Relatorio: TButton
        Left = 696
        Top = 60
        Width = 75
        Height = 25
        Caption = 'Relatorio'
        TabOrder = 4
        OnClick = RelatorioClick
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 264
        Top = 24
        Width = 145
        Height = 23
        KeyField = 'cod_bomba'
        ListField = 'Bomba'
        ListSource = DataSourceBombaConsulta
        TabOrder = 5
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 264
        Top = 62
        Width = 145
        Height = 23
        KeyField = 'cod_tanque'
        ListField = 'Tanque'
        ListSource = DataSourceTanque
        TabOrder = 6
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 513
        Top = 24
        Width = 145
        Height = 23
        KeyField = 'cod_combustivel'
        ListField = 'Combustivel'
        ListSource = DataSourceCombustivel
        TabOrder = 7
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Fortes2'
      'User_Name=postgres'
      'Password=1234'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 728
    Top = 336
  end
  object FDQueryCadastro: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  ab.DATA_COMPRA as "Data Compra",'
      '  ab.hora_compra as "Hora da Compra",  '
      '  ti.TIPO_TANQUE as "Tipo Combustivel",'
      '  bo.COD_BOMBA as "Bomba",'
      '  ab.VLR_ABASTECIMENTO as "Valor Abastecimento",'
      '  ab.VLR_IMPOSTO as "Valor Imposto"'
      'FROM '
      '  abastecimento ab'
      'INNER JOIN bomba bo'
      ' ON ab.cod_bomba = bo.cod_bomba'
      'Inner join tanque ta'
      ' ON bo.cod_tanque = ta.cod_tanque'
      'Inner join tipo_combustivel ti'
      ' on ta.cod_tipo_combustivel = ti.COD_COMBUSTIVEL'
      'WHERE TRUE'
      'ORDER BY ab.data_compra,ab.hora_compra DESC ')
    Left = 32
    Top = 304
    object FDQueryCadastroDataCompra: TSQLTimeStampField
      FieldName = 'Data Compra'
      Origin = '"Data Compra"'
      ProviderFlags = [pfInUpdate]
    end
    object FDQueryCadastroHoradaCompra: TTimeField
      FieldName = 'Hora da Compra'
      Origin = '"Hora da Compra"'
      ProviderFlags = [pfInUpdate]
    end
    object FDQueryCadastroTipoCombustivel: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Tipo Combustivel'
      Origin = '"Tipo Combustivel"'
      Size = 30
    end
    object FDQueryCadastroBomba: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Bomba'
      Origin = '"Bomba"'
    end
    object FDQueryCadastroValorAbastecimento: TBCDField
      FieldName = 'Valor Abastecimento'
      Origin = '"Valor Abastecimento"'
      currency = True
      Precision = 14
      Size = 2
    end
    object FDQueryCadastroValorImposto: TBCDField
      FieldName = 'Valor Imposto'
      Origin = '"Valor Imposto"'
      currency = True
      Precision = 14
      Size = 2
    end
  end
  object DataSourceCadastro: TDataSource
    DataSet = FDQueryCadastro
    Left = 120
    Top = 304
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT  cod_bomba FROM bomba')
    Left = 736
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 792
    Top = 96
  end
  object FDQueryConsulta: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  ab.DATA_COMPRA as "Data Compra",'
      '  ab.hora_compra as "Hora da Compra",'
      '  ta.cod_tanque as "Tanque",'
      '  ti.TIPO_TANQUE as "Tipo Combustivel",'
      '  bo.COD_BOMBA as "Bomba",'
      '  ab.VLR_ABASTECIMENTO as "Valor Abastecimento",'
      '  ab.VLR_IMPOSTO as "Valor Imposto"'
      'FROM '
      '  abastecimento ab'
      'INNER JOIN bomba bo'
      ' ON ab.cod_bomba = bo.cod_bomba'
      'Inner join tanque ta'
      ' ON bo.cod_tanque = ta.cod_tanque'
      'Inner join tipo_combustivel ti'
      ' on ta.cod_tipo_combustivel = ti.COD_COMBUSTIVEL'
      
        'ORDER BY ab.data_compra,ab.hora_compra,ti.TIPO_TANQUE,bo.COD_BOM' +
        'BA DESC   ')
    Left = 36
    Top = 266
    object FDQueryConsultaDataCompra: TSQLTimeStampField
      FieldName = 'Data Compra'
      Origin = '"Data Compra"'
      ProviderFlags = [pfInUpdate]
    end
    object FDQueryConsultaHoradaCompra: TTimeField
      FieldName = 'Hora da Compra'
      Origin = '"Hora da Compra"'
      ProviderFlags = [pfInUpdate]
    end
    object FDQueryConsultaTipoCombustivel: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 30
      FieldName = 'Tipo Combustivel'
      Origin = '"Tipo Combustivel"'
      Size = 60
    end
    object FDQueryConsultaTanque: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Tanque'
      Origin = '"Tanque"'
    end
    object FDQueryConsultaBomba: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Bomba'
      Origin = '"Bomba"'
    end
    object FDQueryConsultaValorAbastecimento: TBCDField
      FieldName = 'Valor Abastecimento'
      Origin = '"Valor Abastecimento"'
      currency = True
      Precision = 14
      Size = 2
    end
    object FDQueryConsultaValorImposto: TBCDField
      FieldName = 'Valor Imposto'
      Origin = '"Valor Imposto"'
      currency = True
      Precision = 14
      Size = 2
    end
  end
  object DataSourceConsulta: TDataSource
    DataSet = FDQueryConsulta
    Left = 124
    Top = 266
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 796
    Top = 338
  end
  object FDQueryTanque: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT 0 as cod_tanque, '#39'Todos'#39' as "Tanque"'
      ' UNION'
      ' SELECT '
      '  ta.cod_tanque,'
      '  CAST(ta.cod_tanque AS VARCHAR) as "Tanque"'
      ' FROM'
      '  Tanque ta'
      ' ORDER BY cod_tanque ASC'
      '')
    Left = 732
    Top = 154
  end
  object DataSourceTanque: TDataSource
    DataSet = FDQueryTanque
    Left = 796
    Top = 154
  end
  object FDQueryCombustivel: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT 0 as cod_combustivel, '#39'Todos'#39' as "Combustivel"'
      ' UNION'
      ' SELECT '
      '  ti.cod_combustivel,'
      '  CAST(ti.TIPO_TANQUE AS VARCHAR) as "Combustivel"'
      ' FROM'
      '  tipo_combustivel ti'
      ' ORDER BY cod_combustivel ASC'
      '  ')
    Left = 732
    Top = 218
  end
  object DataSourceCombustivel: TDataSource
    DataSet = FDQueryCombustivel
    Left = 796
    Top = 218
  end
  object FDQueryBombaConsulta: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT 0 as cod_bomba, '#39'Todas'#39' as "Bomba"'
      ' UNION'
      ' SELECT '
      '  bo.cod_bomba,'
      '  CAST(bo.cod_bomba AS VARCHAR) as "Bomba"'
      ' FROM'
      '  bomba bo'
      ' ORDER BY cod_bomba ASC')
    Left = 732
    Top = 282
  end
  object DataSourceBombaConsulta: TDataSource
    DataSet = FDQueryBombaConsulta
    Left = 796
    Top = 282
  end
  object FDQueryRelatorio: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  SUM(ab.vlr_abastecimento) as "venda" '
      
        'FROM                                                            ' +
        '    '
      
        '  abastecimento ab                                              ' +
        '        '
      
        'INNER JOIN bomba bo                                             ' +
        '        '
      
        ' ON ab.cod_bomba = bo.cod_bomba                                 ' +
        '        '
      
        'Inner join tanque ta                                            ' +
        '        '
      
        ' ON bo.cod_tanque = ta.cod_tanque                               ' +
        '        '
      
        'Inner join tipo_combustivel ti                                  ' +
        '        '
      
        ' on ta.cod_tipo_combustivel = ti.COD_COMBUSTIVEL                ' +
        '        '
      'WHERE TRUE ')
    Left = 396
    Top = 322
    object FDQueryRelatoriovenda: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'venda'
      Origin = 'venda'
      ReadOnly = True
      currency = True
      Precision = 64
      Size = 0
    end
  end
  object DataSourceRelatorio: TDataSource
    DataSet = FDQueryRelatorio
    Left = 436
    Top = 322
  end
end
