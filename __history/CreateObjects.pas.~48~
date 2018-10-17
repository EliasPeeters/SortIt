unit CreateObjects;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure CreateButton(var ButtonName: TButton; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; CaptionString: String);
  procedure CreateImage(var ImageName: TImage; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; LoadImageName: String);
  procedure CreateListbox(Form: TForm; var NewListBox: TNewListbox; Name: String; x, y, Height, Width: Integer; Dark: Boolean; Content: TArrayOfInteger; Image: TImage; Bitmap: TBitmap);
  procedure CreateDiagramBox(Form: TForm; var DiagramBox: TDiagramBox; xInt, yInt, HeightInt, WidthInt: Integer; Content: TArrayOfInteger; Image: TImage; Bitmap: TBitmap; MaxNum: Integer; DHeight, DWidth, Dx, Dy: Integer);

implementation

uses MainUnit, OpenImage, DrawUI, DrawDiagram;

procedure CreateButton(var ButtonName: TButton; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; CaptionString: String);
begin
  ButtonName:= TButton.Create(Form);

  with ButtonName do
  begin
    Visible:= false;
    Caption:= CaptionString;
    Parent := Form;
    Height := HeightInteger;
    Width := WidthInteger;
    Left:= LeftInteger;
    Top:= TopInteger;
    Visible:= true;
  end;
  TMainForm.DefineButtonOnclick(ButtonName);
end;

procedure CreateImage(var ImageName: TImage; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; LoadImageName: String);
begin
  ImageName:= TImage.Create(Form);

  with ImageName do
  begin
    Parent := Form;
    Height := HeightInteger;
    Width := WidthInteger;
    Left:= LeftInteger;
    Top:= TopInteger;
    Proportional:= True;
  end;
  if LoadImageName <> '' then
  begin
    LoadImage(LoadImageName, ImageName);
  end;
  TMainForm.DefineImageOnClick(ImageName);
end;

procedure ConvertBoxToArea(var Box: TBox; var Area: TClickAbleArea);
begin
  Area.x1:= Box.x;
  Area.y1:= Box.y;
  Area.x2:= Box.x + Box.Width;
  Area.y2:= Box.y + Box.Height;
end;

procedure CreateListbox(Form: TForm; var NewListBox: TNewListbox; Name: String; x, y, Height, Width: Integer; Dark: Boolean; Content: TArrayOfInteger; Image: TImage; Bitmap: TBitmap);
begin
  NewListbox.ScrollLevel:= 0;
  NewListbox.Box.Height:= Height;
  NewListbox.Box.Width:= Width;
  NewListbox.Box.x:= x;
  NewListbox.Box.y:= y;
  NewListbox.Box.Bitmap:= Bitmap;
  ConvertBoxToArea(NewListbox.Box, NewListbox.Area);
  NewListbox.Dark:= false;
  NewListbox.NumberOfItems:= (Trunc((Height-60) div 20));
  NewListbox.Box.Bitmap:= Bitmap;
  NewListbox.Box.Bitmap:= TBitmap.Create;
  NewListbox.Box.Bitmap.Height:= NewListbox.Box.Height;
  NewListBox.Box.Bitmap.Width:= NewListBox.Box.Width;
  NewListbox.Image:= Image;
  NewListbox.Content:= Content;
  NewListbox.SelectedItem:= -1;
  CreateImage(NewListbox.Image, Form, NewListbox.Box.Height, NewListbox.Box.Width, NewListbox.Box.x, NewListbox.Box.y, '');
  //DrawBox(NewListbox.Box.Bitmap);
  //NewListbox.Content:= Content;
  FillListbox(Newlistbox);
  NewListbox.Image.Picture.Bitmap:= NewListBox.Box.Bitmap;
end;

procedure CreateDiagramBox(Form: TForm; var DiagramBox: TDiagramBox; xInt, yInt, HeightInt, WidthInt: Integer; Content: TArrayOfInteger; Image: TImage; Bitmap: TBitmap; MaxNum: Integer; DHeight, DWidth, Dx, Dy: Integer);
begin
  with DiagramBox.Box do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;

  DiagramBox.Diagram.Height:= DHeight;
  DiagramBox.Diagram.Width:= DWidth;
  DiagramBox.Diagram.x:= Dx;
  DiagramBox.Diagram.y:= Dy;
  DiagramBox.Diagram.ColorMode:= true;

  DiagramBox.MaxNum:= MaxNum;
  DiagramBox.SelectedItem:= -1;
  DiagramBox.Box.Bitmap:= Bitmap;
  DiagramBox.Box.Bitmap:= TBitmap.Create;
  DiagramBox.Box.Bitmap.Height:= DiagramBox.Box.Height;
  Diagrambox.Box.Bitmap.Width:= DiagramBox.Box.Width;
  Diagrambox.Image:= Image;
  Diagrambox.Content:= Content;
  CreateImage(Diagrambox.Image, Form, DiagramBox.Box.Height, DiagramBox.Box.Width, DiagramBox.Box.x, DiagramBox.Box.y, '');
  DrawBox(DiagramBox.Box.Bitmap);
  DrawbarChart(Diagrambox);
  DiagramBox.Image.Picture.Bitmap:= Diagrambox.Box.Bitmap;
end;

end.
