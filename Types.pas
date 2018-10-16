unit Types;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;



type

  TText = Record
    Text: String;
    x: Integer;
    y: Integer;
  End;

  TClickAbleArea = Record
    x1: Integer;
    x2: Integer;
    y1: Integer;
    y2: Integer;
    Text: TText;
    Position: Integer;
  End;

  TBox = Record
    Height: Integer;
    Width: Integer;
    x: Integer;
    y: Integer;
    Dark: Boolean;
    Bitmap: TBitmap;
  End;

  TNewListbox = Record
    Name: String;
    Box: TBox;
    Area: TClickableArea;
    Dark: Boolean;
    Content: Array of Integer;
    SelectedItem: Integer;
    NumberOfItems: Integer;
    Image: TImage;
    ScrollLevel: Integer;
  end;

implementation

end.
