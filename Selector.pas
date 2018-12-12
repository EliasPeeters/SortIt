unit Selector;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Types;

type
  TSelectorForm = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  SelectorForm: TSelectorForm;
  CloseImage, MinimizeImage, MaximizeImage: TImage;
  BubbleSortButton: TCustomButton;

implementation

uses
  CreateObjects, Colors, DrawUI;


{$R *.dfm}

procedure TSelectorForm.FormCreate(Sender: TObject);
const
  Size: Integer = 14;
begin
  DefineColors;
  CreateImage(CloseImage, Self, Size, Size, 10, 20, 'Close');
  CreateImage(MinimizeImage, Self, Size, Size, 30, 20, 'Minimize');
  CreateImage(MaximizeImage, Self, Size, Size, 50, 20, 'Maximize');
  SelectorForm.Color:= clBackground;
  with PaintBox1.Canvas do
  begin
    brush.Color:= clBoxColor;
    Rectangle(0,0, Paintbox1.Width, Paintbox1.Height);
  end;
  CreateCustomButton(SelectorForm, BubbleSortButton, 100, 100, 30, 100, 'BubbleSort');
  DrawButtonStyle1(BubbleSortButton);

end;

procedure TSelectorForm.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
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

end.
