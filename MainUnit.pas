unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects;

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
  Button.Caption:= '2';
end;

procedure TMainForm.ImageClick(Sender: TObject);
var
  Image: TImage;
begin
  Image:= Sender as TImage;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CreateButton(Test, MainForm, 100, 100, 100, 100, 'Test');
end;

end.
