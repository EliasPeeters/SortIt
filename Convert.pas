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
  procedure ConvertCordsToArea(var CustomCord: TCustomCords; var Area: TClickAbleArea);
  procedure ImageToBitmap(Image: TImage; var Bitmap: TBitmap);
  function SwitchBool(Bool: Boolean):Boolean;

implementation

procedure ImageToArea(Image: TImage; var Area: TClickAbleArea);
begin
  Area.x1:= Image.Left;
  Area.y1:= Image.Top;
  Area.x2:= Image.Left + Image.Width;
  Area.y2:= Image.Top + Image.Height;
end;

procedure ImageToBitmap(Image: TImage; var Bitmap: TBitmap);
begin
  Bitmap:= TBitmap.Create;
  Bitmap.Height:= Image.Height;
  Bitmap.Width:= Image.Width;
end;

function Bool(Bool: Integer):Integer;
begin
  if Bool = 1 then result:= 0
  else if Bool = 0 then result:= 1;
end;

function SwitchBool(Bool: Boolean):Boolean;
begin
  if Bool then result:= false
  else result:= true;
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

procedure ConvertCordsToArea(var CustomCord: TCustomCords; var Area: TClickAbleArea);
begin
  Area.x1:= CustomCord.x;
  Area.y1:= CustomCord.y;
  Area.x2:= CustomCord.x + CustomCord.Width;
  Area.y2:= CustomCord.y + CustomCord.Height;
end;

end.
