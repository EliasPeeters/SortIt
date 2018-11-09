unit QuickSort;



interface
  uses Types, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

  procedure Quick(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagrambox);
  procedure QuickSortProcedure(var Numbers: Array of Integer; Diagram: TDiagramBox);

implementation
uses DrawDiagram;

procedure Switch(var Numbers2: Array of Integer; Number1, Number2: Integer; Diagram: TDiagramBox);
var
  temp: Integer;
begin
  temp:= Numbers2[Number1];
  Numbers2[Number1]:= Numbers2[Number2];
  Numbers2[Number2]:= temp;
  TThread.Synchronize(nil,
    procedure
    begin
      DrawDiagramProcedure(Diagram);
    end
    );

end;

procedure QuickSortProcedure(var Numbers: Array of Integer; Diagram: TDiagramBox);
begin
  Quick(Numbers, 0, length(Numbers), Diagram);
end;


function divid(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagramBox): Integer;
var
Count1, Count2, pivot: Integer;
begin

  pivot:= Numbers[lastElement];

  Count1:= firstElement;

  for Count2 := firstElement to lastElement-1 do
  begin
     if Numbers[Count2] < pivot then
     begin
        Switch(Numbers, Count1, Count2, Diagram);
        Count1:= Count1+1;
     end;
  end;
  Switch(Numbers, Count1, lastElement, Diagram);

  result:= Count1;
end;

procedure Quick(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagramBox);
var
divider: Integer;
begin
  if firstElement < lastElement then
  begin
    divider:= divid(Numbers,firstElement, lastElement, Diagram);
    Quick(Numbers, firstElement, divider-1, Diagram);
    Quick(Numbers, divider+1, lastElement, Diagram);
  end;
end;




end.
