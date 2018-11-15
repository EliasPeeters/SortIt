unit Convert;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure ImageToArea(Image: TImage; var Area: TClickAbleArea);
  function Bool(Bool: Integer):Integer;
  function IntToBool(Int: Integer): Boolean;
  function BoolToInt(BooleanInput: Boolean): Integer;

implementation

procedure ImageToArea(Image: TImage; var Area: TClickAbleArea);
begin
  Area.x1:= Image.Left;
  Area.y1:= Image.Top;
  Area.x2:= Image.Left + Image.Width;
  Area.y2:= Image.Top + Image.Height;
end;

function Bool(Bool: Integer):Integer;
begin
  if Bool = 1 then result:= 0
  else if Bool = 0 then result:= 1;
end;

function IntToBool(Int: Integer): Boolean;
begin
   if Int = 1 then result:= true
  else if Int = 0 then result:= false;
end;


function BoolToInt(BooleanInput: Boolean): Integer;
begin
   if BooleanInput then result:= 1
  else if BooleanInput = false then result:= 0;
end;

end.
