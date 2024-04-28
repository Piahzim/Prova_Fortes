object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 721
  ClientWidth = 887
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object relpro: TRLReport
    Left = 48
    Top = 8
    Width = 794
    Height = 1123
    DataSource = Form1.DataSourceConsulta
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 70
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 48
        Top = 32
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object RLLabel3: TRLLabel
        Left = 136
        Top = 32
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object RLLabel4: TRLLabel
        Left = 246
        Top = 32
        Width = 74
        Height = 16
        Caption = 'Combustivel'
      end
      object RLLabel5: TRLLabel
        Left = 350
        Top = 32
        Width = 45
        Height = 16
        Caption = 'Bomba'
      end
      object RLLabel6: TRLLabel
        Left = 451
        Top = 33
        Width = 34
        Height = 15
        Caption = 'Valor'
      end
      object RLLabel7: TRLLabel
        Left = 603
        Top = 32
        Width = 84
        Height = 16
        Caption = 'Valor Imposto'
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 2
      object RLLabel1: TRLLabel
        Left = 328
        Top = 21
        Width = 48
        Height = 16
        Alignment = taCenter
        Caption = 'Vendas'
      end
    end
    object RLDetailGrid1: TRLDetailGrid
      Left = 38
      Top = 167
      Width = 718
      Height = 26
      object RLDBText7: TRLDBText
        Left = 24
        Top = 7
        Width = 80
        Height = 16
        DataField = 'Data Compra'
        DataSource = Form1.DataSourceConsulta
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 152
        Top = 7
        Width = 46
        Height = 16
        DataField = 'Tanque'
        DataSource = Form1.DataSourceConsulta
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 246
        Top = 7
        Width = 102
        Height = 16
        DataField = 'Tipo Combustivel'
        DataSource = Form1.DataSourceConsulta
        Text = ''
      end
      object RLDBText10: TRLDBText
        Left = 366
        Top = 7
        Width = 45
        Height = 16
        DataField = 'Bomba'
        DataSource = Form1.DataSourceConsulta
        Text = ''
      end
      object RLDBText11: TRLDBText
        Left = 451
        Top = 7
        Width = 125
        Height = 16
        DataField = 'Valor Abastecimento'
        DataSource = Form1.DataSourceConsulta
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 603
        Top = 7
        Width = 84
        Height = 16
        DataField = 'Valor Imposto'
        DataSource = Form1.DataSourceConsulta
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 193
      Width = 718
      Height = 48
      BandType = btSummary
      object RLLabel8: TRLLabel
        Left = 320
        Top = 16
        Width = 115
        Height = 16
        Caption = 'Valor Total Venda :'
      end
      object RLDBText1: TRLDBText
        Left = 451
        Top = 16
        Width = 37
        Height = 16
        DataField = 'venda'
        DataSource = Form1.DataSourceRelatorio
        Text = ''
      end
    end
  end
end
