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
  procedure CreateStatus(Form: TForm; var Status: TStatus; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; StatusBarHeight, StatusBarWidth, StatusBarX, StatusBarY: Integer);
  procedure CreateSettingsBox(Form: TForm; var Settings: TSettings; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Selector1, Selector2, Selector3: TImage; Mode: Integer);
  procedure CreateCustomButton(Form: TForm; var Button: TCustomButton; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption: String);
  procedure CreateVertSelector(Form: TForm; var Selector: TSelectorSlider; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption: String);
  procedure CreateEditField(Form: TForm; var Editfield: TEditfield; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption, Text: String);


implementation

uses MainUnit, OpenImage, DrawUI, DrawDiagram, Convert;

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



procedure ConvertImageToArea(var Image: TImage; var Area: TClickAbleArea);
begin
  Area.x1:= Image.Left;
  Area.y1:= Image.Top;
  Area.x2:= Image.Left + Image.Width;
  Area.y2:= Image.Top + Image.Height;
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
  DiagramBox.Diagram.HeightMode:= true;

  DiagramBox.MaxNum:= MaxNum;
  DiagramBox.SelectedItem:= -1;
  DiagramBox.Box.Bitmap:= Bitmap;
  DiagramBox.Box.Bitmap:= TBitmap.Create;
  DiagramBox.Box.Bitmap.Height:= DiagramBox.Box.Height;
  Diagrambox.Box.Bitmap.Width:= DiagramBox.Box.Width;
  Diagrambox.Image:= Image;
  Diagrambox.Content:= Content;
  CreateImage(Diagrambox.Image, Form, DiagramBox.Box.Height, DiagramBox.Box.Width, DiagramBox.Box.x, DiagramBox.Box.y, '');

end;

procedure CreateStatus(Form: TForm; var Status: TStatus; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; StatusBarHeight, StatusBarWidth, StatusBarX, StatusBarY: Integer);
begin
  with Status.Box do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;
  Status.Box.Bitmap:= Bitmap;
  Status.Box.Bitmap:= TBitmap.Create;
  with Status.Box.Bitmap do
  begin
    Height:= Status.Box.Height;
    Width:= Status.Box.Width;
  end;
  Status.Image:= Image;
  CreateImage(Status.Image, Form, Status.Box.Height, Status.Box.Width, Status.Box.x, Status.Box.y, '');

  with Status.Statusbar do
  begin
    x:= StatusBarX;
    y:= StatusBarY;
    Height:= StatusBarHeight;
    Width:= StatusBarWidth;
  end;
end;

procedure CreateSettingsBox(Form: TForm; var Settings: TSettings; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Selector1, Selector2, Selector3: TImage; Mode: Integer);


begin
  with Settings.Box do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;
  Settings.Box.Bitmap:= Bitmap;
  Settings.Box.Bitmap:= TBitmap.Create;
  with Settings.Box.Bitmap do
  begin
    Height:= Settings.Box.Height;
    Width:= Settings.Box.Width;
  end;
  Settings.Image:= Image;

  if Mode = 0 then
  begin
    CreateImage(Settings.Image, Form, Settings.Box.Height, Settings.Box.Width, Settings.Box.x, Settings.Box.y, '');
    CreateImage(Settings.DiagramSelector1.Image, Form, 83, 83, 928, 300, '');
    CreateImage(Settings.DiagramSelector2.Image, Form, 83, 83, 1028, 300, '');
    CreateImage(Settings.DiagramSelector3.Image, Form, 83, 83, 1128, 300, '');

    ConvertImageToArea(Settings.DiagramSelector1.Image, Settings.DiagramSelector1.Area);
    ConvertImageToArea(Settings.DiagramSelector2.Image, Settings.DiagramSelector2.Area);
    ConvertImageToArea(Settings.DiagramSelector3.Image, Settings.DiagramSelector3.Area);
  end;

  if Mode = 1 then
  begin
    CreateImage(Settings.Image, Form, Settings.Box.Height, Settings.Box.Width, Settings.Box.x, Settings.Box.y, '');
    CreateImage(Settings.DiagramSelector1.Image, Form, 70, 70, 120, 670, '');
    CreateImage(Settings.DiagramSelector2.Image, Form, 70, 70, 200, 670, '');
    CreateImage(Settings.DiagramSelector3.Image, Form, 70, 70, 280, 670, '');

    ConvertImageToArea(Settings.DiagramSelector1.Image, Settings.DiagramSelector1.Area);
    ConvertImageToArea(Settings.DiagramSelector2.Image, Settings.DiagramSelector2.Area);
    ConvertImageToArea(Settings.DiagramSelector3.Image, Settings.DiagramSelector3.Area);
  end;

end;

procedure CreateCustomButton(Form: TForm; var Button: TCustomButton; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption: String);
begin
  Button.Bitmap:= Bitmap;
  Button.Bitmap:= TBitmap.Create;
  with Button do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;
  with Button.Bitmap do
  begin
    Height:= Button.Height;
    Width:= Button.Width;
  end;
  Button.Image:= Image;
  CreateImage(Button.Image, Form, Button.Height, Button.Width, Button.x, Button.y, '');
  Button.Area.x1:= xInt;
  Button.Area.y1:= yInt;
  Button.Area.x2:= xInt+WidthInt;
  Button.Area.y2:= yInt+HeightInt;
  Button.Caption:= Caption;


end;

procedure CreateVertSelector(Form: TForm; var Selector: TSelectorSlider; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption: String);
begin
  Selector.Bitmap:= Bitmap;
  Selector.Bitmap:= TBitmap.Create;
  with Selector do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;
  with Selector.Bitmap do
  begin
    Height:= Selector.Height;
    Width:= Selector.Width;
  end;
  Selector.Image:= Image;
  CreateImage(Selector.Image, Form, Selector.Height, Selector.Width, Selector.x, Selector.y, '');
  Selector.Area.x1:= xInt;
  Selector.Area.y1:= yInt;
  Selector.Area.x2:= xInt+WidthInt;
  Selector.Area.y2:= yInt+HeightInt;

  Selector.Caption:= Caption;
  Selector.Slider.x:= xInt;
  Selector.Slider.y:= yInt;
  Selector.Slider.Height:= HeightInt;
  Selector.Slider.Width:= HeightInt *2;
  //Selector.Value:= true;

end;


procedure CreateEditField(Form: TForm; var Editfield: TEditfield; xInt, yInt, HeightInt, WidthInt: Integer; Image: TImage; Bitmap: TBitmap; Caption, Text: String);
begin
  Editfield.Bitmap:= Bitmap;
  Editfield.Bitmap:= TBitmap.Create;
  with Editfield.Box do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;
  with Editfield.Bitmap do
  begin
    Height:= Editfield.Box.Height;
    Width:= Editfield.Box.Width;
  end;
  Editfield.Image:= Image;
  CreateImage(Editfield.Image, Form, Editfield.Box.Height, Editfield.Box.Width, Editfield.Box.x, Editfield.Box.y, '');
  ImageToArea(Editfield.Image, Editfield.Area);
  Editfield.Caption:= Caption;
  Editfield.Selected:= false;
  Editfield.Text:= Text;

end;


end.
