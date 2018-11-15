unit Tab;

interface

uses Types, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Colors;

  procedure CreateTab(Form: TForm; var Tab: TTab; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption: String);
  procedure DrawTab(Tab: TTab);

implementation

uses
  CreateObjects, Convert;

procedure CreateTab(Form: TForm; var Tab: TTab; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption: String);
begin
  Tab.Bitmap:= Bitmap;
  Tab.Bitmap:= TBitmap.Create;
  with Tab do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;
  with Tab.Bitmap do
  begin
    Height:= Tab.Height;
    Width:= Tab.Width;
  end;
  Tab.Image:= Image;
  CreateImage(Tab.Image, Form, Tab.Height, Tab.Width, Tab.x, Tab.y, '');
  Convert.ImageToArea(Tab.Image, Tab.Area);

  Tab.Caption:= Caption;
  Tab.Selected := false;
  //Selector.Value:= true;
end;

procedure DrawTab(Tab: TTab);
var
  RectForUse: TRect;
begin
  with Tab.Bitmap.Canvas do
  begin
    if Tab.Selected then
    begin
      Brush.Color:= clSelectColor;
      Pen.Color:= clSelectColor;
    end
    else
    begin
      Brush.Color:= grey;
      Pen.Color:= grey;
    end;
    Rectangle(0,Tab.Height-2, Tab.Width, Tab.Height);
    RectForUse.Left:= 0;
    RectForUse.Top:= 5;
    RectForUse.Bottom:= Tab.Height-3;
    RectForUse.Right:= Tab.Width;
    Font.Size:= 11;
    Font.Color:= TextColor;
    Brush.Color:= clBoxColor;
    TextRect(RectForUse,Tab.Caption,[tfCenter,tfVerticalCenter,tfSingleLine])

  end;
  Tab.Image.Picture.Bitmap:= Tab.Bitmap;
end;

end.
