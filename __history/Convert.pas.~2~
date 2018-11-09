unit Convert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure ImageToArea(Image: TImage; var Area: TClickAbleArea);

implementation

procedure ImageToArea(Image: TImage; var Area: TClickAbleArea);
begin
  Area.x1:= Image.Left;
  Area.y1:= Image.Top;
  Area.x2:= Image.Left + Image.Width;
  Area.y2:= Image.Top + Image.Height;
end;

end.
