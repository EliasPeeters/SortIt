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
  Font.Name = 'Bahnschrift'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
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
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 624
    Top = 224
  end
end
