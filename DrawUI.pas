unit DrawUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure DrawBox(Bitm: TBitmap);
  procedure FillListBox(NewListBox: TNewListbox; Content: Array of Integer);

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

procedure FillListBox(NewListBox: TNewListbox; Content: Array of Integer);
var
  I: Integer;
begin
  DrawBox(NewListbox.Box.Bitmap);
  with NewListbox.Box.Bitmap.Canvas do
  begin
    for I := NewListbox.ScrollLevel to NewListbox.NumberOfItems do
    begin
      if I = NewListbox.Selecteditem then
      begin
        Brush.Style:= bsSolid;
        Brush.Color:= LightGrey;
        Font.Color:= clBlack;
        Rectangle(0, (i*20+30)-5, NewListbox.Box.Bitmap.Width, (i+1)*20+30-3);

      end
      else
      begin
        Font.Color:= clBlack;
      end;
      Brush.Style:= bsClear;
      //NumberWidthStorage:= TextWidth(IntToStr(Numbers[i]));
      TextOut(40, I*20+30, IntToStr(Content[i]));
      Brush.Style:= bsSolid;
      Brush.Color:= LightGrey;
      Rectangle(0, (I*20+30)-5, NewListbox.Box.Bitmap.Width, (I*20+30)-2);

    end;
  end;

end;

end.
