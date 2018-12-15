unit SortingAlgos;

interface
  uses
    Types, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
    Vcl.Imaging.pngimage;


  procedure BubbleSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
  procedure SelectionSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
  function BubbleSortSpeed(Diagrambox: TDiagrambox): Integer;

  procedure QuickSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
  function QuickSortProcedureQuick(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus): Integer;

  var
    HelperInt, StatusInt, Steps: Integer;
implementation
uses
  DrawDiagram, DrawUI, Single,MainUnit, Colors;


procedure Swoop(DiagramBox: TDiagramBox; Element1, Element2: Integer; SpeedEdit: TEditfield; Status: TStatus; TotalSteps, CurrentSteps: Integer);
var
  temp, Speed, Speed2, SpeedCount: Integer;
  Storage, StatusBarWidth: Integer;
begin
  temp:= DiagramBox.Content[Element2];
  DiagramBox.Content[Element2]:= DiagramBox.Content[Element1];
  DiagramBox.Content[Element1]:= temp;

    TThread.Synchronize(nil,
        procedure
        begin
          Diagrambox.SelectedItem:= Element1;
          DrawDiagramProcedure(DiagramBox);
          FillListBox(SingleNumberList);
          Storage:= Round(StrToFloat(SpeedEdit.Text)*100);
          with Status.Box.Bitmap.Canvas do
          begin
            Brush.Color:= StatusBarColor;
            Pen.Style:= psClear;
            Rectangle(Status.StatusBar.x+2,
            Status.StatusBar.y+2,
            Status.StatusBar.x+Status.StatusBar.Width-2,
            Status.StatusBar.y+Status.StatusBar.Height-2);
            StatusBarWidth:= Round((Status.Box.Width / 100) * StatusInt);
            Brush.Color:= clBoxColor;
            Rectangle(Status.StatusBar.x+StatusBarWidth+2, Status.StatusBar.y+2, Status.StatusBar.x+Status.StatusBar.Width-2, Status.StatusBar.y+Status.StatusBar.Height-2);
          end;
          Status.Image.Picture.Bitmap:= Status.Box.Bitmap;
        end
        );
        sleep(StrToInt(SpeedEdit.Text));


end;


procedure SwoopSpeed(var Numbers: Array Of Integer; Element1, Element2: Integer);
var
  temp, Speed, Speed2: Integer;
begin
  temp:= Numbers[Element2];
  Numbers[Element2]:= Numbers[Element1];
  Numbers[Element1]:= temp;
end;

procedure BubbleSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
var
  I, Counter, CurrentSteps: Integer;
  unsorted: Boolean ;
begin
  CurrentSteps:= 0;
  unsorted:= true;
  HelperInt:= 0;
  while unsorted do
  begin
    Counter:= 0;
    for I := 0 to length(DiagramBox.Content) do
    begin
      if AbortBoolean then Abort;

      if DiagramBox.Content[I] > DiagramBox.Content[I+1] then
      begin
        Swoop(DiagramBox, I, I+1, SpeedEdit, Status, TotalStep, CurrentSteps);
        StatusInt:= (CurrentSteps*100 div TotalStep);
        CurrentSteps:= CurrentSteps+1;
      end
      else
        Counter:= Counter+1;

    end;
    if Counter = length(DiagramBox.Content)+1 then unsorted:= false;

  end;
end;

function BubbleSortSpeed(Diagrambox: TDiagrambox): Integer;
var
  Unsorted: Boolean;
  Counter, I, Steps: Integer;
  Numbers: Array of Integer;
begin
  setlength(Numbers, length(Diagrambox.Content));

  for I := 0 to length(Diagrambox.Content) do
  begin
    Numbers[i]:= Diagrambox.Content[i];
  end;

  unsorted:= true;
  Steps:= 0;
  while unsorted do
  begin
    Counter:= 0;
    for I := 0 to length(Numbers)-1 do
    begin
      if AbortBoolean then Abort;

      if Numbers[I] > Numbers[I+1] then
      begin
        Steps:= Steps+1;
        SwoopSpeed(Numbers, I, I+1);
      end
      else
        Counter:= Counter+1;

    end;
    if Counter = length(Numbers) then unsorted:= false;

  end;

  result:= Steps;
end;



procedure SelectionSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
var
  I, II, Counter, CurrentSteps, Min: Integer;
begin
  CurrentSteps:= 0;
  HelperInt:= 0;
  for I := low(DiagramBox.Content) to high(DiagramBox.Content)-1 do
  begin
    //if AbortBoolean then Abort;

    //Min:= i;

    for II := high(DiagramBox.Content) downto i+1  do
    begin
      if DiagramBox.Content[I] > DiagramBox.Content[II] then
      begin
        //Min:= II;
        Swoop(DiagramBox, I, I+1, SpeedEdit, Status, TotalStep, CurrentSteps);
      end;
    end;
  end;
end;








function divid(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus): Integer;
var
Count1, Count2, pivot: Integer;
begin

  pivot:= Numbers[lastElement];

  Count1:= firstElement;

  for Count2 := firstElement to lastElement-1 do
  begin
     if Numbers[Count2] < pivot then
     begin
        Swoop(Diagram, Count1, Count2, SpeedEdit, Status, TotalStep, Steps);
        //Switch(Numbers, Count1, Count2, Diagram);
        Count1:= Count1+1;
        Steps:= Steps+1;
     end;
     if AbortBoolean then Abort;
  end;
  Swoop(Diagram, Count1, lastElement, SpeedEdit, Status, TotalStep, Steps);

  result:= Count1;
end;

procedure Quick(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagramBox;  SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
var
divider: Integer;
begin
  if firstElement < lastElement then
  begin
    divider:= divid(Numbers,firstElement, lastElement, Diagram, SpeedEdit, TotalStep, Status);
    Quick(Numbers, firstElement, divider-1, Diagram, SpeedEdit, TotalStep, Status);
    Quick(Numbers, divider+1, lastElement, Diagram, SpeedEdit, TotalStep, Status);
  end;
end;

procedure QuickSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
var
  I, II, Counter, CurrentSteps, Min: Integer;
begin
  Steps:= 0;
  Quick(DiagramBox.Content, 0, length(DiagramBox.Content), DiagramBox, SpeedEdit, TotalStep, Status);
end;






function dividQuick(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus): Integer;
var
Count1, Count2, pivot: Integer;
begin

  pivot:= Numbers[lastElement];

  Count1:= firstElement;

  for Count2 := firstElement to lastElement-1 do
  begin
     if Numbers[Count2] < pivot then
     begin
        //Swoop(Diagram, Count1, Count2, SpeedEdit, Status, TotalStep, 1);
        SwoopSpeed(Numbers, Count1, Count2);
        Count1:= Count1+1;
        Steps:= Steps+1;
     end;
  end;
  SwoopSpeed(Numbers, Count1, lastElement);

  result:= Count1;
end;

procedure QuickQuick(var Numbers: Array of Integer; firstElement, lastElement: Integer; Diagram: TDiagramBox;  SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
var
divider: Integer;
begin
  if firstElement < lastElement then
  begin
    divider:= dividQuick(Numbers,firstElement, lastElement, Diagram, SpeedEdit, TotalStep, Status);
    QuickQuick(Numbers, firstElement, divider-1, Diagram, SpeedEdit, TotalStep, Status);
    QuickQuick(Numbers, divider+1, lastElement, Diagram, SpeedEdit, TotalStep, Status);
  end;
end;

function QuickSortProcedureQuick(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus): Integer;
var
  I, II, Counter, CurrentSteps, Min: Integer;
  Numbers: Array of Integer;
begin
  setlength(Numbers, length(Diagrambox.Content));

  for I := 0 to length(Diagrambox.Content) do
  begin
    Numbers[i]:= Diagrambox.Content[i];
  end;


  Steps:= 0;
  QuickQuick(Numbers, 0, length(DiagramBox.Content), DiagramBox, SpeedEdit, TotalStep, Status);
  result:= Steps;
end;

end.
