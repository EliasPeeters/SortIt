unit DropDownMenu;

interface

uses Types, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Colors, Convert;

  procedure CreateDropDownMenu(Form: TForm; var DropDownMenu: TDropDownMenu; xInt, yInt, HeightInt, WidthInt: Integer; Items: TArrayOfString);
  procedure DrawDropDown(var DropDown: TDropDownMenu);
  procedure AnimateDropDown(DropDownAnimate: TDropDownMenu);
  procedure DrawTextOnDropdownMenu(DropDownAnimate: TDropDownMenu);

implementation

uses CreateObjects, MainUnit, Sorting;


function CalcAreas(DropDownMenu: TDropDownMenu; Item: Integer):TClickAbleArea;
begin
  if Item < 7 then
  begin
    result.x1:= DropDownMenu.Cords.x + 30;
    result.y1:= DropDownMenu.Cords.y + 60 + (Item * 30);
    result.x2:= result.x1 + (DropDownMenu.Cords.Width-10) div 2;
    result.y2:= DropDownMenu.Cords.y + 60 + ((Item + 1) * 30);
  end
  else
  begin
  end;
end;

procedure CreateDropDownMenu(Form: TForm; var DropDownMenu: TDropDownMenu; xInt, yInt, HeightInt, WidthInt: Integer; Items: TArrayOfString);
var
  I: Integer;
begin

  with DropDownMenu.Cords do
  begin
    Height:= HeightInt;
    Width:= WidthInt;
    x:= xInt;
    y:= yInt;
  end;

  ConvertCordsToArea(DropDownMenu.Cords, DropDownMenu.Area);
  DropDownMenu.BitmapTop:= TBitmap.Create;
  DropDownMenu.BitmapDropDown:= TBitmap.Create;
  DropDownMenu.BitmapTop.Height:= DropDownMenu.Cords.Height;
  DropDownMenu.BitmapTop.Width:= DropDownMenu.Cords.Width;
  DropDownMenu.BitmapDropDown.Height:= 0;
  DropDownMenu.BitmapDropDown.Width:= DropDownMenu.Cords.Width;
  DropDownMenu.Items:= Items;
  DropDownMenu.Opened:= false;
  DropDownMenu.SelectedItem:= -1;
  CreateImage(DropDownMenu.ImageDropDown, Form, 0, DropDownMenu.Cords.Width, DropDownMenu.Cords.x, DropDownMenu.Cords.y + DropDownMenu.Cords.height + 5, '');
  CreateImage(DropDownMenu.ImageTop, Form, DropDownMenu.Cords.Height, DropDownMenu.Cords.Width, DropDownMenu.Cords.x, DropDownMenu.Cords.y, '');

  SetLength(DropDownMenu.ItemAreas, 6);
  for I := 1 to 6 do
    DropDownMenu.ItemAreas[i]:= CalcAreas(DropDownMenu, i);
end;

procedure DrawDropDown(var DropDown: TDropDownMenu);
begin
  with DropDown.BitmapTop.Canvas do
  begin
    Pen.Color:= grey;
    Pen.Width:= 3;
    Brush.Color:= clBoxColor;
    RoundRect(5,5,DropDown.Cords.Width-5, DropDown.Cords.Height-5, DropDown.Cords.Height-10,  DropDown.Cords.Height-10);
    Font.Size:= (DropDown.Cords.Height-10) div 4;
    if DropDown.SelectedItem < 0 then
    begin
      Font.Color:= grey;
      TextOut(DropDown.Cords.Height div 3 * 2, 20, 'Select Algorythm')
    end
    else
    begin
      Font.Color:= TextColor;

      TextOut(DropDown.Cords.Height div 3 * 2, 20, Sorting.ListofAlgo[DropDown.SelectedItem]);
    end;
    Pen.Color:= clSelectColor;
    Pen.Width:= 2;
    Font.Name:= FontFamily;
    if DropDown.Opened then
    begin
      MoveTo(DropDown.Cords.Width-50, DropDown.Cords.Height div 2 + 4);
      LineTo(DropDown.Cords.Width-40, DropDown.Cords.Height div 2);
      LineTo(DropDown.Cords.Width-30, DropDown.Cords.Height div 2 + 4);
    end
    else
    begin
      MoveTo(DropDown.Cords.Width-50, DropDown.Cords.Height div 2);
      LineTo(DropDown.Cords.Width-40, DropDown.Cords.Height div 2 + 8);
      LineTo(DropDown.Cords.Width-30, DropDown.Cords.Height div 2);
    end;
  end;
 DropDown.ImageTop.Picture.Bitmap:= DropDown.BitmapTop;
end;

procedure AnimateDropDown(DropDownAnimate: TDropDownMenu);
var
  I: Integer;
begin
  TThread.CreateAnonymousThread(
  procedure
  var
    I: Integer;
  begin
    if DropDownAnimate.Opened then
    begin
      for I := 1 to 8 do
      begin
        TThread.Synchronize(nil,
        procedure
        begin
          with DropDownAnimate.BitmapTop.Canvas do
          begin
            Pen.Color:= grey;
            Brush.Style:= bsClear;
            RoundRect(5,5,DropDownAnimate.Cords.Width-5, DropDownAnimate.Cords.Height-5, DropDownAnimate.Cords.Height-10,  DropDownAnimate.Cords.Height-10);

            Brush.Color:= clBoxColor;
            Pen.Color:= clBoxColor;
            Rectangle(DropDownAnimate.Cords.Width-60, 15, DropDownAnimate.Cords.Width-20, DropDownAnimate.Cords.Height - 15);
            Pen.Color:= clSelectColor;
            MoveTo(DropDownAnimate.Cords.Width-50, DropDownAnimate.Cords.Height div 2 + 8 - i);
            LineTo(DropDownAnimate.Cords.Width-40, DropDownAnimate.Cords.Height div 2 + I);
            LineTo(DropDownAnimate.Cords.Width-30, DropDownAnimate.Cords.Height div 2 + 8 - i);
            DropDownAnimate.ImageTop.Picture.Bitmap:= DropDownAnimate.BitmapTop;
          end;
        end
        );
        sleep(Round(AnimationSpeedExt*2));
      end;
    end
    else if DropDownAnimate.Opened = false then
    begin
      for I := 1 to 8 do
      begin
        TThread.Synchronize(nil,
        procedure
        begin
          with DropDownAnimate.BitmapTop.Canvas do
          begin
            Pen.Color:= grey;
            Brush.Style:= bsClear;
            RoundRect(5,5,DropDownAnimate.Cords.Width-5, DropDownAnimate.Cords.Height-5, DropDownAnimate.Cords.Height-10,  DropDownAnimate.Cords.Height-10);
            Brush.Color:= clBoxColor;
            Pen.Color:= clBoxColor;
            Rectangle(DropDownAnimate.Cords.Width-60, 15, DropDownAnimate.Cords.Width-20, DropDownAnimate.Cords.Height - 15);
            Pen.Color:= clSelectColor;
            MoveTo(DropDownAnimate.Cords.Width-50, DropDownAnimate.Cords.Height div 2 + i);
            LineTo(DropDownAnimate.Cords.Width-40, DropDownAnimate.Cords.Height div 2 + 8 -I);
            LineTo(DropDownAnimate.Cords.Width-30, DropDownAnimate.Cords.Height div 2 + i);
            DropDownAnimate.ImageTop.Picture.Bitmap:= DropDownAnimate.BitmapTop;
          end;
        end
        );
        sleep(Round(AnimationSpeedExt*2));
      end;
    end;
  end
  ).Start();


  DropDownAnimate.BitmapDropDown.Canvas.Pen.Width:= 3;

  if DropDownAnimate.Opened then
  begin
    for i := Round(300/ AnimationSpeedExt / 4) downto 0  do
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          DropDownAnimate.BitmapDropDown.Canvas.Brush.Color:= clBoxColor;
          DropDownAnimate.BitmapDropDown.Canvas.Pen.Color:= clBoxColor;
          DropDownAnimate.BitmapDropDown.Canvas.Rectangle(0,0,DropDownAnimate.ImageDropDown.Width, DropDownAnimate.ImageDropDown.Height);
          DropDownAnimate.BitmapDropDown.Canvas.Brush.Color:= clBoxColor;
          DropDownAnimate.BitmapDropDown.Canvas.Pen.Color:= grey;
          DropDownAnimate.ImageDropDown.Height:= i * Round(AnimationSpeedExt * 4);
          DropDownAnimate.BitmapDropDown.Height:= i *  Round(AnimationSpeedExt * 4);
          DropDownAnimate.BitmapDropDown.Canvas.RoundRect(5, 5,
                                                          DropDownAnimate.ImageDropDown.Width-5,
                                                          DropDownAnimate.ImageDropDown.Height-5,
                                                          30, 30);
          DropDownAnimate.ImageDropDown.Picture.Bitmap:= DropDownAnimate.BitmapDropDown;
        end
        );
      sleep(30);
    end;
  end
  else
  begin
    for i := 1 to Round(300/ AnimationSpeedExt / 4) do
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          DropDownAnimate.BitmapDropDown.Canvas.Brush.Color:= clBoxColor;
          DropDownAnimate.BitmapDropDown.Canvas.Pen.Color:= clBoxColor;
          DropDownAnimate.BitmapDropDown.Canvas.Rectangle(0,0,DropDownAnimate.ImageDropDown.Width, DropDownAnimate.ImageDropDown.Height);
          DropDownAnimate.BitmapDropDown.Canvas.Brush.Color:= clBoxColor;
          DropDownAnimate.BitmapDropDown.Canvas.Pen.Color:= grey;
          DropDownAnimate.ImageDropDown.Height:= i * Round(AnimationSpeedExt * 4);
          DropDownAnimate.BitmapDropDown.Height:= i *  Round(AnimationSpeedExt * 4);
          DropDownAnimate.BitmapDropDown.Canvas.RoundRect(5, 5,
                                                          DropDownAnimate.ImageDropDown.Width-5,
                                                          DropDownAnimate.ImageDropDown.Height-5,
                                                          30, 30);

          DropDownAnimate.ImageDropDown.Picture.Bitmap:= DropDownAnimate.BitmapDropDown;

        end
        );
      sleep(30);
    end;
  end;

  if DropDownAnimate.Opened = false then
  begin
  TThread.Synchronize(nil,
        procedure
        begin
          DrawTextOnDropdownMenu(DropDownAnimate);
        end
        );
        //ShowMessage('test');
  end;
end;

procedure DrawTextOnDropdownMenu(DropDownAnimate: TDropDownMenu);
var
  I: Integer;
begin

  DropDownAnimate.BitmapDropDown.Canvas.Pen.Color:= grey;
  DropDownAnimate.BitmapDropDown.Canvas.RoundRect(5, 5,
                                                DropDownAnimate.ImageDropDown.Width-5,
                                                DropDownAnimate.ImageDropDown.Height-5,
                                                30, 30);
  for i := 1 to 6 do
  begin
    if i = DropDownAnimate.HoverItem  then
    begin
      DropDownAnimate.BitmapDropDown.Canvas.Brush.Color:= clSelectColor;
      DropDownAnimate.BitmapDropDown.Canvas.Pen.Color:= clSelectColor;
      DropDownAnimate.BitmapDropDown.Canvas.RoundRect(15, i*30-7, 140, i*30 +23, 5, 5 );
      DropDownAnimate.BitmapDropDown.Canvas.Font.Color:= clWhite;
    end
    else
    begin
      DropDownAnimate.BitmapDropDown.Canvas.Brush.Color:= clBoxColor;
      DropDownAnimate.BitmapDropDown.Canvas.Font.Color:= clBlack;
    end;

    DropDownAnimate.BitmapDropDown.Canvas.Font.Name:= FontFamily;
    DropDownAnimate.BitmapDropDown.Canvas.TextOut(30, i*30, Sorting.ListofAlgo[i]);

  end;
  DropDownAnimate.ImageDropDown.Picture.Bitmap:= DropDownAnimate.BitmapDropDown;
end;

end.
