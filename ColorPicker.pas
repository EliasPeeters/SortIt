unit ColorPicker;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, Types, Vcl.AppEvnts;

type
  TColorPickerForm = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    TopBarImage: TImage;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure DrawTopBar;
    procedure TopBarImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CreateColorPicker;
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  ColorPickerForm: TColorPickerForm;
  TopBarBitmap: TBitmap;
  GradientMode, ColorMode: Boolean;

  SelectorGradientMode, SelectorColorode: TTab;
  SelectorGradientModeImage, SelectorColorodeImage: TImage;
  SelectorGradientModeBitmap, SelectorColorodeBitmap: TBitmap;

  GradientSelect: TImage;
  GradientSelectBitmap: TBitmap;

  GradientSelector1: TGradientSelector;

implementation

uses
   MainUnit, Convert, Colors, Tab;

{$R *.dfm}


function CursorIsInAreaColor(Area: TClickAbleArea):Boolean;
var
  XAchsTrue, YAchsTrue: Boolean;
begin
  XAchsTrue:= False;
  YAchsTrue:= False;

  if (CursorPosition.x >= Area.x1) and (CursorPosition.x <= Area.x2) then
  begin
    XAchsTrue:= True;
  end;

   if (CursorPosition.y >= Area.y1) and (CursorPosition.y <= Area.y2) then
  begin
    YAchsTrue:= True;
  end;

  if (YAchsTrue) and (XAchsTrue) then
  begin
    result:= true;
  end
  else
  begin
    result:= false;
  end;
end;

procedure DrawGradientSelector(Bitmap: TBitmap; GradientSelector: TGradientSelector);
begin
  GradientSelector.y:= Bitmap.Height div 2;
  with Bitmap.Canvas do
  begin
    Brush.Style:= bsClear;
    Pen.Color:= clBlack;
    Pen.Width:= 3;
    Ellipse(GradientSelector.x-GradientSelector.Size,GradientSelector.y-GradientSelector.Size, GradientSelector.x+GradientSelector.Size, GradientSelector.y+GradientSelector.Size);
  end;
end;

procedure GradientSelectorArea(var GradientSelector: TGradientSelector; Image: TImage);
begin
  with GradientSelector.Area do
  begin
    x1:= Image.Left + GradientSelector.x-GradientSelector.Size;
    y1:= Image.Top + GradientSelector.y-GradientSelector.Size-30;
    x2:= Image.Left + GradientSelector.x+GradientSelector.Size;
    y2:= Image.Top + GradientSelector.x+GradientSelector.Size-30;
  end;
end;

procedure GradientSelectorCursorArea(var GradientSelector: TGradientSelector);
begin
  with GradientSelector.Area do
  begin
    x1:= CursorPosition.X;
    y1:= CursorPosition.Y;
    x2:= CursorPosition.X;
    y2:= CursorPosition.Y;
  end;
  with GradientSelector do
  begin
    x:= GradientSelector.Area.x1 + GradientSelector.Size;
    y:= GradientSelector.Area.y1 + GradientSelector.Size;
  end;
end;

procedure CreateGradientSelector(var GradientSelector: TGradientSelector);
begin
  with GradientSelector do
  begin
    x:= 100;
    y:= 100;
    Size:= 10;
  end;
end;

procedure CreateGradientMode;
var
  I: Integer;
begin
  CreateTab(ColorPickerForm, SelectorGradientMode, 100, 10, 30, 150,SelectorGradientModeImage, SelectorGradientModeBitmap, 'Gradient Mode' );
  CreateTab(ColorPickerForm, SelectorColorode, 350, 10, 30, 150,SelectorColorodeImage, SelectorColorodeBitmap, 'Gradient Mode' );
  CreateImage(GradientSelect, ColorPickerForm,ColorPickerForm.Height-200, ColorPickerForm.Width-100, 50, 150, '');
  ImageToBitmap(GradientSelect, GradientSelectBitmap);
  CreateGradientSelector(GradientSelector1);
  GradientSelectorArea(GradientSelector1,GradientSelect);
end;


procedure DrawGradientMode;
var
  I: Integer;
begin
  with GradientSelectBitmap.Canvas do
  begin
    brush.Color:= clSettingsBackground;
    Pen.Color:= clSettingsBackground;
    Rectangle(0,0,GradientSelectBitmap.Width, GradientSelectBitmap.Height);
    brush.Color:= clBoxColor;
    Pen.Color:= clBoxColor;
    RoundRect(0,0,GradientSelectBitmap.Width, GradientSelectBitmap.Height, 30, 30);
    Pen.Width:= 1;
    for I := 10 to GradientSelectBitmap.Width-10 do
    begin
      Pen.Color:= GiveColorBack(GradientSelectBitmap.Width-10, I);

      MoveTo(I, 10);
      LineTo(I,GradientSelectBitmap.Height-10);
    end;
  end;
  DrawGradientSelector(GradientSelectBitmap, GradientSelector1);
  GradientSelect.Picture.Bitmap:= GradientSelectBitmap;
end;

procedure DrawTabBar;
begin
  DrawTab(SelectorGradientMode);
  DrawTab(SelectorColorode);
end;

procedure TColorPickerForm.FormActivate(Sender: TObject);
var
  regn: HRGN;
begin
  DefineColors;
  regn := CreateRoundRectRgn(0, 0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, regn, True);
  ColorPickerForm.Color:= clSettingsBackground;
  DrawTopBar;
  CreateColorPicker;
  DrawGradientMode;
  DrawTabBar;
end;

procedure TColorPickerForm.FormCreate(Sender: TObject);
var
  regn: HRGN;
begin

end;

procedure TColorPickerForm.Panel1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  Panel1.Left:= X;
end;

procedure TColorPickerForm.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Panel1.Left:= X;
end;

procedure TColorPickerForm.TopBarImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;


procedure TColorPickerForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if Msg.message=WM_MOUSEMOVE then
  begin
    CursorPosition:= ColorPickerForm.ScreenToClient(Mouse.CursorPos);
  end;

  if Msg.message=WM_LBUTTONDOWN then
  begin
    if CursorIsInAreaColor(SelectorGradientMode.Area) then
    begin
      SelectorGradientMode.Selected:= true;
      SelectorColorode.Selected:= false;
      DrawTabBar;
    end;
    if CursorIsInAreaColor(SelectorColorode.Area) then
    begin
      SelectorGradientMode.Selected:= false;
      SelectorColorode.Selected:= true;
      DrawTabBar;
    end;
    if CursorIsInAreaColor(GradientSelector1.Area) then
    begin
      GradientSelectorCursorArea(GradientSelector1);
      DrawGradientMode;
    end;
  end;
end;

procedure TColorPickerForm.CreateColorPicker;
begin
  CreateGradientMode;
end;

procedure TColorPickerForm.DrawTopBar;
begin
  TopBarBitmap:= TBitmap.Create;
  TopBarBitmap.Height:= 50;
  TopBarBitmap.Width:= ColorPickerForm.Width;
  with TopBarBitmap.Canvas do
  begin
    brush.Color:= clBoxColor;
    pen.Color:= clBoxColor;
    Rectangle(0,0, ColorPickerForm.Width, 50);
  end;
  TopBarImage.Picture.Bitmap:= TopBarBitmap;
end;

end.
