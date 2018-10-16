unit CreateObjects;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure CreateButton(var ButtonName: TButton; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; CaptionString: String);
  procedure CreateImage(var ImageName: TImage; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; LoadImageName: String);
  procedure CreateListbox(Form: TForm; var NewListBox: TNewListbox; Name: String; x, y, Height, Width: Integer; Dark: Boolean; Content: Array of Integer; Image: TImage; Bitmap: TBitmap);

implementation

uses MainUnit, OpenImage, DrawUI;

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

procedure CreateListbox(Form: TForm; var NewListBox: TNewListbox; Name: String; x, y, Height, Width: Integer; Dark: Boolean; Content: Array of Integer; Image: TImage; Bitmap: TBitmap);
begin
  NewListbox.ScrollLevel:= 0;
  NewListbox.Box.Height:= Height;
  NewListbox.Box.Width:= Width;
  NewListbox.Box.x:= x;
  NewListbox.Box.y:= y;
  NewListbox.Box.Bitmap:= Bitmap;
  ConvertBoxToArea(NewListbox.Box, NewListbox.Area);
  NewListbox.Dark:= false;
  NewListbox.NumberOfItems:= Round(Height-60 div 20);
  NewListbox.Box.Bitmap:= Bitmap;
  NewListbox.Box.Bitmap:= TBitmap.Create;
  NewListbox.Box.Bitmap.Height:= NewListbox.Box.Height;
  NewListBox.Box.Bitmap.Width:= NewListBox.Box.Width;
  NewListbox.Image:= Image;
  CreateImage(NewListbox.Image, Form, NewListbox.Box.Height, NewListbox.Box.Width, NewListbox.Box.x, NewListbox.Box.y, '');
  //DrawBox(NewListbox.Box.Bitmap);
  FillListbox(Newlistbox, Content);
  NewListbox.Image.Picture.Bitmap:= NewListBox.Box.Bitmap;
end;

end.
