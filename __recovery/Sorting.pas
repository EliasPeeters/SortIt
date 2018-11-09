unit Sorting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector;

  procedure SetLengthCustom(var ArrayNumber: TArrayOfInteger);
  procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer);

implementation

procedure SetLengthCustom(var ArrayNumber: TArrayOfInteger);
begin
  setLength(ArrayNumber, 100);
end;

procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer);
var
  I: Integer;
begin
  SetLengthCustom(Numbers);
  for I := 0 to length(Numbers)-1 do
  begin
    Numbers[i]:= Random(MaxNum);
    //Numbers[i]:= i;
  end;
end;

end.
