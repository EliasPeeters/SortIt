object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'MainForm'
  ClientHeight = 800
  ClientWidth = 1260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object TitleBar: TImage
    Left = 0
    Top = 0
    Width = 1260
    Height = 50
    OnMouseDown = TitleBarMouseDown
  end
  object Panel1: TPanel
    Left = 992
    Top = 600
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
  end
end
