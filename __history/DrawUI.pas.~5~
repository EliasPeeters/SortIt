unit DrawUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure DrawBox(Bitm: TBitmap);

implementation

uses Colors;

procedure DrawBox(Bitm: TBitmap);
begin
  with Bitm.Canvas do
  begin
    Brush.Color:= LightGrey;
    Pen.Color:= LightGrey;
    Rectangle(0,0, Bitm.Width, Bitm.Height);
    Brush.Color:= LightBoxColor;
    Pen.Color:= LightBoxColor;
    RoundRect(0,0,Bitm.Width, Bitm.Height, 30, 30);
  end;
end;

end.
