unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage, Colors, FileLoaderUnit, Types, Single;

type

  TMainForm = class(TForm)
    procedure buttonClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    Constructor DefineButtonOnClick(Button: TButton);
    Constructor DefineImageOnClick(Image: TImage);
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

  {
    1: Button
    2: Image
  }

implementation

{$R *.dfm}

Constructor TMainForm.DefineButtonOnClick(Button: TButton);
begin
  Button.OnClick:= ButtonClick;
end;

Constructor TMainForm.DefineImageOnClick(Image: TImage);
begin
  Image.OnClick:= ImageClick;
end;

procedure TMainForm.buttonClick(Sender: TObject);
var
  Button: TButton;
begin
  Button:= Sender as TButton;
  Button.Caption:= FloatToStr(AnimationSpeed(FileStorage));
end;

procedure TMainForm.ImageClick(Sender: TObject);
var
  Image: TImage;
begin
  Image:= Sender as TImage;
  LoadImage('Bar', Im);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DefineColors;
  CreateButton(Test, self, 100, 100, 100, 100, 'Test');
  TextFileToArray(FileStorage, 'config.txt');
  MainForm.Color:= LightGrey;
  CreateSingle;
end;

end.
