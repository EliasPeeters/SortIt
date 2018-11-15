unit settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, colors, CreateObjects, Types, Vcl.AppEvnts;
type
  TSettingsForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure DrawSettingsTopBar;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DrawColorThemeSelector;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  SettingsForm: TSettingsForm;
  TopBarBitmap: TBitmap;
  TopBarImage, LightSelector, DarkSelector: TImage;
  DarkThemeArea, LightThemeArea: TClickAbleArea;

implementation

uses MainUnit, FileLoaderUnit, Single, MainUI;

{$R *.dfm}

function CursorIsInArea(Area: TClickAbleArea):Boolean;
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

procedure TSettingsForm.FormCreate(Sender: TObject);
var
  regn: HRGN;
begin
  regn := CreateRoundRectRgn(0, 0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, regn, True);
  SettingsForm.Color:= clSettingsBackground;
  DrawSettingsTopBar;
  DrawColorThemeSelector;

end;

procedure TSettingsForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TSettingsForm.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if Msg.message = WM_LBUTTONDOWN then
  begin
    if CursorIsInArea(LightThemeArea) then
    begin
      //ChangeDarkMode(FileStorage, 'false');
      DefineColors;
      LoadConfig(FileStorage);
      DrawMainUI;
      DestroySingle;
      CreateSingle;
      DrawSingle;
    end;

    if CursorIsInArea(DarkThemeArea) then
    begin
      //ChangeDarkMode(FileStorage, 'true');
      DefineColors;
      LoadConfig(FileStorage);
      DrawMainUI;
      DestroySingle;
      CreateSingle;
      DrawSingle;
    end;
  end;

  if Msg.message=WM_MOUSEMOVE then
  begin
    CursorPosition:= ScreenToClient(Mouse.CursorPos);
  end;
end;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  FileLoaderUnit.ChangeLanguage(FileStorage, 'en');
  LoadConfig(FileStorage);
  DestroySingle;
  CreateSingle;
  DrawSingle;
end;

procedure TSettingsForm.Button2Click(Sender: TObject);
begin
  FileLoaderUnit.ChangeLanguage(FileStorage, 'de');
    LoadConfig(FileStorage);
  DestroySingle;
  CreateSingle;
  DrawSingle;
end;

procedure TSettingsForm.DrawColorThemeSelector;
begin
  CreateImage(LightSelector, SettingsForm, 100, SettingsForm.Width, 0, 70, '');
  with LightSelector.Canvas do
  begin
    Brush.Color:= clSettingsBackground;
    pen.Color:= clSettingsBackground;
    Rectangle(0,0, LightSelector.Width, LightSelector.Height);
    Brush.Color:= clWhite;
    Ellipse((LightSelector.Width div 2)-150, 0, (LightSelector.Width div 2)-50, 100);
    Brush.Color:= rgb(26, 27, 32);
    Ellipse((LightSelector.Width div 2)+150, 0, (LightSelector.Width div 2)+50, 100);
  end;

  with LightThemeArea do
  begin
    x1:= (LightSelector.Width div 2)-150;
    y1:= 70;
    x2:= (LightSelector.Width div 2)-50;
    y2:= 170;
  end;

  with DarkThemeArea do
  begin
    x1:= (LightSelector.Width div 2)+50;
    y1:= 70;
    x2:= (LightSelector.Width div 2)+150;
    y2:= 170;
  end;
end;


procedure TSettingsForm.DrawSettingsTopBar;
begin
  TopBarBitmap:= TBitmap.Create;
  TopBarBitmap.Height:= 50;
  TopBarBitmap.Width:= SettingsForm.Width;
  CreateImage(TopBarImage, SettingsForm, 50, SettingsForm.Width, 0,0, '');
  with TopBarBitmap.Canvas do
  begin
    brush.Color:= clBoxColor;
    pen.Color:= clBoxColor;
    Rectangle(0,0, SettingsForm.Width, 50);
  end;
  TopBarImage.Picture.Bitmap:= TopBarBitmap;
end;

end.
