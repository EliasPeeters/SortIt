unit Single;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects;

  var
    ArrayNumber: TArrayOfInteger;
    SingleNumberList: TNewListbox;
    SingleNumberListImage: TImage;
    SingleNumberListBitmap: TBitmap;

   procedure CreateSingle();
   procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer);
   procedure SingleScroll(WheelData: Integer);


implementation

uses
  MainUnit, DrawUI;


procedure SetLengthCustom();
begin
  setLength(ArrayNumber, 40);
end;

procedure SingleScroll(WheelData: Integer);
begin
  if MainForm.CursorIsInArea(SingleNumberList.Area) then
  begin
    NewListboxScroll(SingleNumberList, Wheeldata div 120 + SingleNumberList.ScrollLevel);
    Test.Caption:= IntToStr(SingleNumberList.ScrollLevel);
  end;
end;

procedure CreateSingle();
begin;
  SingleOpened:= true;
  SetLengthCustom();
  CreateRandomArray(ArrayNumber, 30);
  CreateListbox(MainForm, SingleNumberlist, 'Numberslist', 775, 100, 650, 100, false, ArrayNumber, SingleNumberListImage, SingleNumberListBitmap);
end;

procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer);
var
  I: Integer;
begin
  SetLengthCustom;
  for I := 0 to length(Numbers)-1 do
  begin
    Numbers[i]:= Random(MaxNum);
  end;
end;

end.
