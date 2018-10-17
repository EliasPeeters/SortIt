unit DrawUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Math,
  Vcl.Imaging.pngimage, Types;

  procedure DrawBox(Bitm: TBitmap);
  procedure FillListBox(NewListBox: TNewListbox);
  procedure NewListboxScroll(var NewListBox: TNewListbox; NewScrollLevel: Integer);
  procedure TopSideBar(Bitm: TBitmap);

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

procedure TopSideBar(Bitm: TBitmap);
begin
  with Bitm.Canvas do
  begin
    Brush.Color:= LightBoxColor;
    Pen.Color:= LightBoxColor;
    Rectangle(0,0, Bitm.Width, Bitm.Height);
  end;
end;

procedure NewListboxScroll(var NewListBox: TNewListbox; NewScrollLevel: Integer);
begin
  NewListbox.ScrollLevel:= NewScrollLevel;
  if NewListbox.ScrollLevel < 0 then
    NewListbox.ScrollLevel:= 0;

  if NewListBox.ScrollLevel > length(ArrayNumber)-1 then
    NewListbox.ScrollLevel:= length(ArrayNumber)-1;
  FillListBox(NewListBox);
  NewListbox.Image.Picture.Bitmap:= NewListBox.Box.Bitmap;
end;

procedure FillListBox(NewListBox: TNewListbox);
var
  I, CurrentBox: Integer;
  ScrollBarPosition: Integer;
begin
  DrawBox(NewListbox.Box.Bitmap);
  with NewListbox.Box.Bitmap.Canvas do
  begin
    for I := NewListbox.ScrollLevel to NewListbox.NumberOfItems+NewListbox.ScrollLevel do
    begin
      CurrentBox:= i-NewListbox.ScrollLevel;
      if I = NewListbox.Selecteditem then
      begin
        Brush.Style:= bsSolid;
        Brush.Color:= LightBlueSelected;
        Font.Color:= TextColor;
        Rectangle(0, (CurrentBox*20+30)-5, NewListbox.Box.Bitmap.Width, (CurrentBox+1)*20+30-3);

      end
      else
      begin
        Font.Color:= TextColor;
      end;
      Brush.Style:= bsClear;
      if I < length(Newlistbox.Content) then
      begin
        TextOut(40, CurrentBox*20+30, IntToStr(NewListbox.Content[i]));
        Brush.Style:= bsSolid;
        Brush.Color:= LightGrey;

        //if i <> NewListbox.NumberOfItems then

        Rectangle(0, (CurrentBox*20+30)-5, NewListbox.Box.Bitmap.Width, (CurrentBox*20+30)-2);
      end;
    end;
    if NewListbox.ScrollLevel <> 0 then
    begin
      Scrollbarposition:= Ceil((NewListbox.Box.Height-10-50) / Length(NewListBox.Content))*NewListBox.ScrollLevel;
    end
    else
    begin
      ScrollBarPosition:= 0;
    end;
    Brush.Style:= bsSolid;
    Brush.Color:= LightBlueSelected;
    Pen.Color:= LightBlueSelected;
    RoundRect(NewListbox.Box.Width-5, ScrollBarPosition+10, NewListbox.Box.Width, ScrollBarPosition+50, 4, 4);
    //Rectangle(0, ((NewListbox.NumberOfItems+1)*20+30)-5, NewListbox.Box.Bitmap.Width, ((NewListbox.NumberOfItems+1)*20+30)-2);
  end;
  NewListbox.Image.Picture.Bitmap:= NewListbox.Box.Bitmap;
end;

end.
