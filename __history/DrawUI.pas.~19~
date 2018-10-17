unit DrawUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

  procedure DrawBox(Bitm: TBitmap);
  procedure FillListBox(NewListBox: TNewListbox; Content: Array of Integer);
  procedure NewListboxScroll(var NewListBox: TNewListbox; NewScrollLevel: Integer);

implementation

uses Colors, Single;

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

procedure NewListboxScroll(var NewListBox: TNewListbox; NewScrollLevel: Integer);
begin
  NewListbox.ScrollLevel:= NewScrollLevel;
  if NewListbox.ScrollLevel < 0 then
    NewListbox.ScrollLevel:= 0;

  if NewListBox.ScrollLevel > NewListbox.NumberOfItems-1 then
    NewListbox.ScrollLevel:= NewListbox.NumberOfItems-1;
  FillListBox(NewListBox, ArrayNumber);
  NewListbox.Image.Picture.Bitmap:= NewListBox.Box.Bitmap;
end;

procedure FillListBox(NewListBox: TNewListbox; Content: Array of Integer);
var
  I, CurrentBox: Integer;
begin
  DrawBox(NewListbox.Box.Bitmap);
  with NewListbox.Box.Bitmap.Canvas do
  begin
    NewListbox.SelectedItem:= 5;

    for I := NewListbox.ScrollLevel to NewListbox.NumberOfItems do
    begin
      CurrentBox:= i-NewListbox.ScrollLevel;
      if I = NewListbox.Selecteditem then
      begin
        Brush.Style:= bsSolid;
        Brush.Color:= LightBlueSelected;
        Font.Color:= clBlack;
        Rectangle(0, (CurrentBox*20+30)-5, NewListbox.Box.Bitmap.Width, (CurrentBox+1)*20+30-3);

      end
      else
      begin
        Font.Color:= clBlack;
      end;
      Brush.Style:= bsClear;
      TextOut(40, CurrentBox*20+30, IntToStr(Content[i+NewListBox.ScrollLevel]));
      Brush.Style:= bsSolid;
      Brush.Color:= LightGrey;

      //if i <> NewListbox.NumberOfItems then

      Rectangle(0, (CurrentBox*20+30)-5, NewListbox.Box.Bitmap.Width, (CurrentBox*20+30)-2);

    end;

    Rectangle(0, ((NewListbox.NumberOfItems+1)*20+30)-5, NewListbox.Box.Bitmap.Width, ((NewListbox.NumberOfItems+1)*20+30)-2);
  end;

end;

end.
