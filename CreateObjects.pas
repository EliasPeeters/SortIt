unit CreateObjects;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, DrawUI;

  procedure CreateButton(var ButtonName: TButton; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; CaptionString: String);
  procedure CreateImage(var ImageName: TImage; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; LoadImageName: String);
  procedure CreateListbox(var NewListBox: TNewListbox; Name: String; x, y, Height, Width: Integer; Dark: Boolean; Content: Array of Integer);

implementation

uses MainUnit, OpenImage;

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
  LoadImage(LoadImageName, ImageName);
  TMainForm.DefineImageOnClick(ImageName);
end;

procedure ConvertBoxToArea(var Box: TBox; var Area: TClickAbleArea);
begin
  Area.x1:= Box.x;
  Area.y1:= Box.y;
  Area.x2:= Box.x + Box.Width;
  Area.y2:= Box.y + Box.Height;
end;

procedure CreateListbox(var NewListBox: TNewListbox; Name: String; x, y, Height, Width: Integer; Dark: Boolean; Content: Array of Integer);
begin
  NewListbox.Box.Height:= Height;
  NewListbox.Box.Width:= Width;
  NewListbox.Box.x:= x;
  NewListbox.Box.y:= y;
  ConvertBoxToArea(NewListbox.Box, NewListbox.Area);
  NewListbox.Dark:= false;
  NewListbox.NumberOfItems:= Round(Height-60 div 20);
end;

end.
