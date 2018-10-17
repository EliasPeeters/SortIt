unit Single;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects;

  var
    ArrayNumber: TArrayOfInteger;
    SingleNumberList: TNewListbox;
    SingleDiagram: TDiagramBox;
    SingleNumberListImage, SingleDiagramImage: TImage;
    SingleNumberListBitmap, SingleDiagramBitmap: TBitmap;

    MaxNum: Integer;

   procedure CreateSingle();
   procedure DrawSingle();
   procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer);
   procedure SingleScroll(WheelData: Integer);


implementation

uses
  MainUnit, DrawUI, DrawDiagram;


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
  MaxNum:= 30;
  SingleOpened:= true;
  SetLengthCustom();
  CreateRandomArray(ArrayNumber, MaxNum);
  CreateListbox(MainForm, SingleNumberlist, 'Numberslist', 775, 100, 650, 100, false, ArrayNumber, SingleNumberListImage, SingleNumberListBitmap);
  CreateDiagramBox(MainForm, SingleDiagram, 100, 100, 650, 650, ArrayNumber, SingleDiagramImage, SingleDiagramBitmap, MaxNum, 600, 600, 25, 25);
end;

procedure DrawSingle();
begin
  FillListBox(SingleNumberList);
  DrawBox(SingleDiagram.Box.Bitmap);
  DrawbarChart(SingleDiagram);
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
