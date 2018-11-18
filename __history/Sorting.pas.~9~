unit Sorting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector;

  procedure SetLengthCustom(var ArrayNumber: TArrayOfInteger; Length: Integer);
  procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer; LengthInt: Integer);
  procedure FillSortingAlgoArray(var FillArray: TArrayOfString);

  var
    ListofAlgo: Array[1..6] of String;

implementation

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

end.
