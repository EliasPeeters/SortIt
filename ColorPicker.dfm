object ColorPickerForm: TColorPickerForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ColorPickerForm'
  ClientHeight = 338
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TopBarImage: TImage
    Left = 0
    Top = 0
    Width = 600
    Height = 50
    OnMouseDown = TopBarImageMouseDown
  end
  object Panel1: TPanel
    Left = 104
    Top = 112
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 0
    OnDragDrop = Panel1DragDrop
    OnMouseDown = Panel1MouseDown
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 432
    Top = 136
  end
end
