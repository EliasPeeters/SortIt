unit Colors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage;


  procedure DefineColors;

var
  LightGrey: TColor;
  LightBoxColor: TColor;
  LightBlueSelected: TColor;
  LightBackground: TColor;


implementation

procedure DefineColors;
begin
  LightGrey:= rgb(231,231, 231);
  LightBoxColor:= clWhite;
  LightBlueSelected:= rgb(96, 157, 254);
end;

end.