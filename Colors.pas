unit Colors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage;


  procedure DefineColors;

var
  Grey: TColor;
  clBoxColor: TColor;
  clSelectColor: TColor;
  clBackground: TColor;
  TextColor, DiagramColor, StatusBarColor: TColor;
  clSettingsBackground: TColor;


implementation

uses MainUnit;

procedure DefineColors;
begin
  if not(DarkModeBoolean) then
  begin
    Grey:= rgb(231,231, 231);
    clBoxColor:= clWhite;
    clSelectColor:= rgb(96, 157, 254);
    //LightBlueSelected:= rgb(226, 190, 76);
    TextColor:= clBlack;
    DiagramColor:= clSelectColor;
    StatusBarColor:= rgb(107, 205, 0);
    clSettingsBackground:= rgb(220,220, 220)
  end;

  if DarkModeBoolean then
  begin
    Grey:= rgb(26, 27, 32);
    clBoxColor:= rgb(50, 50, 60);
    //LightBlueSelected:= rgb(226, 190, 76);
    clSelectColor:= rgb(96, 157, 254);
    //LightBlueSelected:= clWhite;
    TextColor:= clWhite;
    DiagramColor:= clSelectColor;
    StatusBarColor:= rgb(107, 205, 0);
    clSettingsBackground:= rgb(20,20, 25)
  end;
end;

end.
