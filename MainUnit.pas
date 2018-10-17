unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage, Colors, FileLoaderUnit, Types, Single, DrawUI,
  Vcl.AppEvnts;

type

  TMainForm = class(TForm)
    ApplicationEvents: TApplicationEvents;
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
  private
    { Private-Deklarationen }
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
  //
end;

procedure TMainForm.FormScroll(Wheeldata: Integer);
begin
  Wheeldata:= Wheeldata*-1;
  if CursorIsInArea(SingleNumberList.Area) then
  begin
    NewListboxScroll(SingleNumberList, Wheeldata div 120 + SingleNumberList.ScrollLevel);
    Test.Caption:= IntToStr(SingleNumberList.ScrollLevel);
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
  CreateRandomArray(ArrayNumber, 30);
  FillListBox(SingleNumberList, ArrayNumber);
  SingleNumberList.Image.Picture.Bitmap:= SingleNumberList.Box.Bitmap;
end;

procedure TMainForm.ImageClick(Sender: TObject);
var
  Image: TImage;
begin
  Image:= Sender as TImage;
  //LoadImage('Bar', Im);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DefineColors;
  CreateButton(Test, self, 100, 100, 100, 100, IntToStr(SingleNumberList.ScrollLevel));
  TextFileToArray(FileStorage, 'config.txt');
  MainForm.Color:= LightGrey;
  CreateSingle;
end;

procedure TMainForm.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  FormScroll(WheelDelta);
end;

end.
