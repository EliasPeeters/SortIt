unit CreateObjects;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

  procedure CreateButton(var ButtonName: TButton; Form: TForm; HeightInteger, WidthInteger, LeftInteger, TopInteger: Integer; CaptionString: String);

implementation

uses MainUnit;

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


end.