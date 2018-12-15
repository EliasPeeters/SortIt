unit SortingAlgos;

interface
  uses
    Types, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
    Vcl.Imaging.pngimage;


  procedure BubbleSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
  procedure SelectionSortProcedure(DiagramBox: TDiagramBox; SpeedEdit: TEditfield; TotalStep: Integer; Status: TStatus);
  function BubbleSortSpeed(Diagrambox: TDiagrambox): Integer;

  var
    HelperInt, StatusInt: Integer;
implementation
uses
  DrawDiagram, DrawUI, Single,MainUnit, Colors;


procedure DrawStatusCustom(Status: TStatus);
begin
    TThread.Synchronize(nil,
        procedure
        begin

        end
        );
end;

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

end.
