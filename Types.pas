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

  TArrayOfInteger = Array of Integer;

  TNewImage = Record
    Image: TImage;
    Area: TClickableArea;
  End;


  TNewListbox = Record
    Name: String;
    Box: TBox;
    Area: TClickableArea;
    Dark: Boolean;
    Content: TArrayOfInteger;
    SelectedItem: Integer;
    NumberOfItems: Integer;
    Image: TImage;
    ScrollLevel: Integer;
  end;

  TDiagram = Record
    Height: Integer;
    Width: Integer;
    x: Integer;
    y: Integer;
    DiagramTyp: Integer;
    HeightMode: Boolean;
    ColorMode: Boolean;
  End;

  TDiagramBox = Record
    Box: TBox;
    Content: TArrayOfInteger;
    Image: TImage;
    SelectedItem: Integer;
    MaxNum: Integer;
    Diagram: TDiagram;
  End;

  TStatusBar = Record
    Height: Integer;
    Width: Integer;
    x: Integer;
    y: Integer;
  End;

  TStatus = Record
    Box: TBox;
    Image: TImage;
    Status: Integer;
    StatusBar: TStatusBar;
  End;

  TTopBar = Record
    Area: TClickableArea;
  End;

  TCustomCords = Record
    x: Integer;
    y: Integer;
    Height: Integer;
    Width: Integer;
  End;

  TSelectorSlider = Record
    Image: TImage;
    Bitmap: TBitmap;
    x: Integer;
    y: Integer;
    Height: Integer;
    Width: Integer;
    Slider: TCustomCords;
    Caption: String;
    Selected: Integer;
    Area: TClickAbleArea;
  End;

  TCustomButton = Record
    x: Integer;
    y: Integer;
    Height: Integer;
    Width: Integer;
    Image: TImage;
    Bitmap: TBitmap;
    Caption: String;
    Area: TClickAbleArea;
  End;


  TSettings = Record
    Box: TBox;
    Image: TImage;
    DiagramSelector1: TNewImage;
    DiagramSelector2: TNewImage;
    DiagramSelector3: TNewImage;
  End;

implementation

end.
