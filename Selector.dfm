object SelectorForm: TSelectorForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'SelectorForm'
  ClientHeight = 328
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 570
    Height = 49
    OnMouseDown = PaintBox1MouseDown
  end
end
