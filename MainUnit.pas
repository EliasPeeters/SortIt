unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage, Colors, FileLoaderUnit, Types, Single, DrawUI,
  Vcl.AppEvnts, MainUI;

type

  TMainForm = class(TForm)
    ApplicationEvents: TApplicationEvents;
    TitleBar: TImage;

    procedure buttonClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormClick();

    procedure FormScroll(Wheeldata: Integer);

    Constructor DefineButtonOnClick(Button: TButton);
    Constructor DefineImageOnClick(Image: TImage);

    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    function CursorIsInArea(Area: TClickAbleArea):Boolean;
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure LoadCompleteUI();
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TitleBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private-Deklarationen }

  protected
    { Portected-Deklarationen }

  public
    { Public-Deklarationen }
  end;

var
  MainForm: TMainForm;
  Test: TButton;
  Im: TImage;
  FileStorage: Array[0..100] of String;
  CursorPosition: TPoint;
  SingleOpened, DuoOpened, QuadOpened, SixOpened : Boolean;

  DarkModeBoolean: Boolean;
  AnimationSpeedExt: Extended;
  DefautlDiagramtype: Integer;



  {
    1: Button
    2: Image
  }

implementation

{$R *.dfm}

function TMainForm.CursorIsInArea(Area: TClickAbleArea):Boolean;
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


Constructor TMainForm.DefineButtonOnClick(Button: TButton);
begin
  Button.OnClick:= ButtonClick;
end;

Constructor TMainForm.DefineImageOnClick(Image: TImage);
begin
  Image.OnClick:= ImageClick;
end;

procedure TMainForm.FormClick();
begin
  if SingleOpened then
  begin
    SinglePress();
  end;
end;

procedure TMainForm.FormScroll(Wheeldata: Integer);
begin
  Wheeldata:= Wheeldata*-1;

  if SingleOpened then
  begin
    SingleScroll(Wheeldata);
  end;
end;

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if Msg.message=WM_LBUTTONDOWN then
  begin
    FormClick;
  end;

  if Msg.message=WM_MOUSEMOVE then
  begin
    CursorPosition:= ScreenToClient(Mouse.CursorPos);
  end;
end;

procedure TMainForm.buttonClick(Sender: TObject);
var
  Button: TButton;
begin
  Button:= Sender as TButton;
  Button.Caption:= FloatToStr(AnimationSpeed(FileStorage));
  //CreateRandomArray(ArrayNumber, 30);
  //FillListBox(SingleNumberList);
  //SingleNumberList.Image.Picture.Bitmap:= SingleNumberList.Box.Bitmap;
  //LoadConfig(FileStorage);

  {if DarkModeBoolean then DarkModeBoolean:= false
  else if not(DarkModeBoolean) then DarkModeBoolean:= true;}
  LoadConfig(FileStorage);
  LoadCompleteUI;
end;

Procedure MySpecialMouseDownStuff(Sender: TObject; Button: TMouseButton;
                           Shift: TShiftState; X, Y: Integer);
begin
  //T
end;



procedure TMainForm.ImageClick(Sender: TObject);
var
  Image: TImage;
begin
  Image:= Sender as TImage;
  //LoadImage('Bar', Im);
end;

procedure TMainForm.LoadCompleteUI();
begin
  DefineColors;
  MainForm.Color:= LightGrey;
  DrawMainUI;
  DrawSingle;
end;

procedure SetTransparent(Aform: TForm; AValue: Boolean);
begin
  Aform.TransparentColor := AValue;
  Aform.TransparentColorValue := Aform.Color;
end;

procedure TMainForm.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TMainForm.TitleBarMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TMainForm.FormCreate(Sender: TObject);
var
  regn: HRGN;
begin
  regn := CreateRoundRectRgn(0, 0,ClientWidth,ClientHeight,40,40);
  SetWindowRgn(Handle, regn, True);

  LoadConfig(FileStorage);
  DefineColors;
  //CreateButton(Test, self, 100, 100, 900, 100, IntToStr(SingleNumberList.ScrollLevel));
  TextFileToArray(FileStorage, 'config.txt');
  MainForm.Color:= LightGrey;
  CreateSingle;
  CreateMainUI;
  LoadCompleteUI;
  //SetTransparent(self, true);
end;




procedure TMainForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  FormScroll(WheelDelta);
end;

end.
