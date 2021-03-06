unit Sorting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector;

  procedure SetLengthCustom(var ArrayNumber: TArrayOfInteger; Length: Integer);
  procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer; LengthInt: Integer);
  procedure FillSortingAlgoArray(var FillArray: TArrayOfString);
  procedure Sort(Diagram: TDiagramBox;var DropDown: TDropDownMenu; SpeedEdit: TEditfield;var SortButton: TCustomButton; var Status: TStatus);
  var
    ListofAlgo: Array[1..6] of String;
    Steps: Integer;

implementation

uses
  SortingAlgos,DrawDiagram, DropDownMenu, Single, DrawUI, ReadLanguage;

procedure SetLengthCustom(var ArrayNumber: TArrayOfInteger; Length: Integer);
begin
  setLength(ArrayNumber, Length);
end;

procedure SetLengthCustomString(var ArrayNumber: TArrayOfString; Length: Integer);
begin
  setLength(ArrayNumber, Length);
end;

procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer; LengthInt: Integer);
var
  I: Integer;
begin
  SetLengthCustom(Numbers, LengthInt);
  for I := 0 to length(Numbers)-1 do
  begin
    Numbers[i]:= Random(MaxNum);
    //Numbers[i]:= i;
  end;
end;

procedure FillSortingAlgoArray(var FillArray: TArrayOfString);
begin
  ListofAlgo[1]:= 'QuickSort';
  ListofAlgo[2]:= 'BubbleSort';
  ListofAlgo[3]:= 'Insertionsort';
  ListofAlgo[4]:= 'SelectionSort';
  ListofAlgo[5]:= 'BoggoSort';
  ListofAlgo[6]:= 'ShakerSort';

end;

procedure Sort(Diagram: TDiagramBox;var DropDown: TDropDownMenu; SpeedEdit: TEditfield;var SortButton: TCustomButton; var Status: TStatus);
begin
  SortButton.Caption:= ReadLang('Stop');

  TThread.Synchronize(nil,
      procedure
      begin
        DrawButtonStyle1(Single.SingleSortButton);
      end
      );

  if DropDown.SelectedItem = 1 then
  begin
    Steps:= QuickSortProcedureQuick(Diagram, SpeedEdit, Steps, Status);
    SortingAlgos.QuickSortProcedure(Diagram, SpeedEdit, Steps, Status);
  end
  else if DropDown.SelectedItem = 2 then
  begin
    Steps:= BubbleSortSpeed(Diagram);
    SortingAlgos.BubbleSortProcedure(Diagram, SpeedEdit, Steps, Status);
  end
  else
  begin
    with DropDown.BitmapTop.Canvas do
    begin
      Pen.Color:= clRed;
      Brush.Style:= bsClear;
      RoundRect(5,5,DropDown.Cords.Width-5, DropDown.Cords.Height-5, DropDown.Cords.Height-10,  DropDown.Cords.Height-10);
    end;
    DropDown.ImageTop.Picture.Bitmap:= DropDown.BitmapTop;
  end;
  SortButton.Caption:= ReadLang('New');

  TThread.Synchronize(nil,
    procedure
    begin
      DrawButtonStyle1(Single.SingleSortButton);
    end
    );

  DrawDiagramProcedure(Diagram);
end;

end.
