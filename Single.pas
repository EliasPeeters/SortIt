unit Single;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort;

  var
    ArrayNumber: TArrayOfInteger;
    SingleNumberList: TNewListbox;
    SingleDiagram: TDiagramBox;
    SinlgeStatusBar: TStatus;
    SingleSettings: TSettings;
    SingleNumberListImage, SingleDiagramImage, StatusBarImage, SingleSettingsImage, SingleDiagramSelector1,
    SingleDiagramSelector2, SingleDiagramSelector3: TImage;
    SingleNumberListBitmap, SingleDiagramBitmap, StatusBarBitmap, SingleSettingsBitmap: TBitmap;

    SingleSortButton: TCustomButton;
    SingleSortButtonImage: TImage;
    SingleSortButtonBitmap: TBitmap;

    MaxNum: Integer;

   procedure CreateSingle();
   procedure DrawSingle();
   procedure CreateRandomArray(var Numbers: TArrayOfInteger; MaxNum: Integer);
   procedure SingleScroll(WheelData: Integer);
   procedure SinglePress();


implementation

uses
  MainUnit, DrawUI, DrawDiagram, OpenImage;


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

procedure SinglePress();
begin
  if MainForm.CursorIsInArea(SingleSettings.DiagramSelector1.Area) then
  begin
    LoadImage('CirclePressed', SingleSettings.DiagramSelector1.Image);
    LoadImage('Bar', SingleSettings.DiagramSelector2.Image);
    LoadImage('Column', SingleSettings.DiagramSelector3.Image);
    SingleDiagram.Diagram.DiagramTyp:= 0;
    DrawDiagramProcedure(SingleDiagram);
  end;

  if MainForm.CursorIsInArea(SingleSettings.DiagramSelector2.Area) then
  begin
    LoadImage('Circle', SingleSettings.DiagramSelector1.Image);
    LoadImage('BarPressed', SingleSettings.DiagramSelector2.Image);
    LoadImage('Column', SingleSettings.DiagramSelector3.Image);
    SingleDiagram.Diagram.DiagramTyp:= 1;
    DrawDiagramProcedure(SingleDiagram);
  end;

  if MainForm.CursorIsInArea(SingleSettings.DiagramSelector3.Area) then
  begin
    LoadImage('Circle', SingleSettings.DiagramSelector1.Image);
    LoadImage('Bar', SingleSettings.DiagramSelector2.Image);
    LoadImage('ColumnPressed', SingleSettings.DiagramSelector3.Image);
    SingleDiagram.Diagram.DiagramTyp:= 2;
    DrawDiagramProcedure(SingleDiagram);
  end;

  if MainForm.CursorIsInArea(SingleSortButton.Area) then
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        QuickSortProcedure(ArrayNumber, SingleDiagram);
      end
      ).Start();
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
  CreateStatus(MainForm, SinlgeStatusBar, 900, 100, 66, 340, StatusBarImage, StatusBarBitmap, 30, 290, 25, 19);
  CreateSettingsBox(MainForm, SingleSettings, 900, 190, 560, 340, SingleSettingsImage, SingleSettingsBitmap, SingleDiagramSelector1,
    SingleDiagramSelector2, SingleDiagramSelector3);
  SingleDiagram.Diagram.DiagramTyp:= DefautlDiagramtype;
  CreateCustomButton(MainForm, SingleSortButton, 925, 670, 50, 290, SingleSortButtonImage, SingleSortButtonBitmap, 'Sort');
end;

procedure DrawSingle();
begin
  FillListBox(SingleNumberList);
  DrawDiagramProcedure(SingleDiagram);
  SinlgeStatusBar.Status:= 60;
  DrawStatus(SinlgeStatusBar);
  DrawSettings(SingleSettings);

  if SingleDiagram.Diagram.DiagramTyp = 0 then LoadImage('CirclePressed', SingleSettings.DiagramSelector1.Image)
  else if SingleDiagram.Diagram.DiagramTyp = 1 then   LoadImage('BarPressed', SingleSettings.DiagramSelector2.Image)
  else if SingleDiagram.Diagram.DiagramTyp = 2 then   LoadImage('ColumnPressed', SingleSettings.DiagramSelector3.Image);

  DrawButtonStyle1(SingleSortButton);

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
