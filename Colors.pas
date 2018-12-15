unit Colors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage;


  procedure DefineColors;
  function GiveColorBack(NumberofItems, Item: Integer):TColor;

var
  Grey: TColor;
  clBoxColor: TColor;
  clSelectColor: TColor;
  clBackground: TColor;
  TextColor, DiagramColor, DiagramColorSecond, StatusBarColor: TColor;
  clSettingsBackground: TColor;


implementation

uses MainUnit;

function GiveColorBack(NumberofItems, Item: Integer):TColor;
var
  HueWert: Extended;
begin
  HueWert:= (360 / NumberofItems)*Item;
  while HueWert > 360 do Huewert:= Huewert / 360;

  if HueWert <= 60 then result:= rgb(255, Round((255 / 60) * Huewert), 0)
  else if HueWert <= 120 then result:= rgb(Round(255 - (255 / 60 * (Huewert - 60))), 255 , 0)
  else if HueWert <= 180 then result:= rgb(0, 255 , Round(255 / 60 * (Huewert-120)))
  else if HueWert <= 240 then result:= rgb(0, Round(255 - (255 / 60 * (Huewert-180))) , 255)
  else if HueWert <= 300 then result:= rgb(Round(255 / 60 * (Huewert-240)), 0 , 255)
  else if HueWert <= 360 then result:= rgb(255 , 0 , Round(255 - (255 / 60 * Round(Huewert-300))));

end;

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
    DiagramColorSecond:= rgb(181, 210, 255);
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
