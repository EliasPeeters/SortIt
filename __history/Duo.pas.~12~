unit Duo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector;

  var
    DuoDiagrambox1, DuoDiagrambox2: TDiagramBox;
    DuoDiagrambox1Image, DuoDiagrambox2Image: TImage;
    DuoDiagrambox1Bitmap, DuoDiagrambox2Bitmap: TBitmap;

    DuoNumberlist: TNewListbox;
    DuoNumberlistImage: TImage;
    DuoNumberlistBitmap: TBitmap;

    DuoSettingsBox: TSettings;
    DuoSettingsBoxImage: TImage;
    DuoSettingsBoxBitmap: TBitmap;
    DuoSettingsSelector1, DuoSettingsSelector2, DuoSettingsSelector3: TImage;

    SortButton: TCustomButton;
    SortButtonImage: TImage;
    SortButtonBitmap: TBitmap;

    ArrayNumber: TArrayOfInteger;
    MaxNum: Integer = 30;

    procedure CreateDuo();
    procedure DrawDuo();
    procedure DestroyDuo();
    procedure DuoScroll(WheelData: Integer);
    procedure DuoPress();

implementation

uses MainUnit, DrawUI, DrawDiagram, Sorting, OpenImage, ReadLanguage;


procedure DuoScroll(WheelData: Integer);
begin
  if MainForm.CursorIsInArea(DuoNumberlist.Area) then
  begin
    NewListboxScroll(DuoNumberlist, Wheeldata div 120 + DuoNumberlist.ScrollLevel);
  end;
end;

procedure DuoPress();
begin
  if MainForm.CursorIsInArea(DuoSettingsBox.DiagramSelector1.Area) then
  begin
    LoadImage('CirclePressed', DuoSettingsBox.DiagramSelector1.Image);
    LoadImage('Bar', DuoSettingsBox.DiagramSelector2.Image);
    LoadImage('Column', DuoSettingsBox.DiagramSelector3.Image);
    DuoDiagrambox1.Diagram.DiagramTyp:= 0;
    DuoDiagrambox2.Diagram.DiagramTyp:= 0;
    DrawDiagramProcedure(DuoDiagrambox1);
    DrawDiagramProcedure(DuoDiagrambox2);
  end
  else if MainForm.CursorIsInArea(DuoSettingsBox.DiagramSelector2.Area) then
  begin
    LoadImage('Circle', DuoSettingsBox.DiagramSelector1.Image);
    LoadImage('BarPressed', DuoSettingsBox.DiagramSelector2.Image);
    LoadImage('Column', DuoSettingsBox.DiagramSelector3.Image);
    DuoDiagrambox1.Diagram.DiagramTyp:= 1;
    DuoDiagrambox2.Diagram.DiagramTyp:= 1;
    DrawDiagramProcedure(DuoDiagrambox1);
    DrawDiagramProcedure(DuoDiagrambox2);
  end
  else if MainForm.CursorIsInArea(DuoSettingsBox.DiagramSelector3.Area) then
  begin
    LoadImage('Circle', DuoSettingsBox.DiagramSelector1.Image);
    LoadImage('Bar', DuoSettingsBox.DiagramSelector2.Image);
    LoadImage('ColumnPressed', DuoSettingsBox.DiagramSelector3.Image);
    DuoDiagrambox1.Diagram.DiagramTyp:= 2;
    DuoDiagrambox2.Diagram.DiagramTyp:= 2;
    DrawDiagramProcedure(DuoDiagrambox1);
    DrawDiagramProcedure(DuoDiagrambox2);
  end
  else if MainForm.CursorIsInArea(SortButton.Area) then
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        QuickSortProcedure(ArrayNumber, DuoDiagrambox1, 100);
      end
      ).Start();

    TThread.CreateAnonymousThread(
      procedure
      begin
        QuickSortProcedure(ArrayNumber, DuoDiagrambox2, 100);
      end
      ).Start();
  end;

end;

procedure CreateDuo();
begin
  DuoOpened:= true;
  SetLengthCustom(ArrayNumber, ArrayLength);
  CreateRandomArray(ArrayNumber, MaxNum, ArrayLength);
  DuoDiagrambox1.MaxNum:= 360;
  DuoDiagrambox2.MaxNum:= 360;
  CreateDiagramBox(MainForm, DuoDiagrambox1, 100, 160, 480, 480, ArrayNumber, DuoDiagrambox1Image, DuoDiagrambox1Bitmap, MaxNum, 450, 450, 15, 15);
  CreateDiagramBox(MainForm, DuoDiagrambox2, 610, 160, 480, 480, ArrayNumber, DuoDiagrambox1Image, DuoDiagrambox1Bitmap, MaxNum, 450, 450, 15, 15);
  CreateListbox(MainForm, DuoNumberlist, 'Numberslist', 1120, 100, 650, 100, false, ArrayNumber, DuoNumberlistImage, DuoNumberlistBitmap);
  CreateSettingsBox(MainForm, DuoSettingsBox, 100, 660, 90, 990, DuoSettingsBoxImage, DuoSettingsBoxBitmap, DuoSettingsSelector1, DuoSettingsSelector2, DuoSettingsSelector3, 1);
  CreateCustomButton(MainForm, SortButton, 780, 680, 50, 290, SortButtonImage, SortButtonBitmap, ReadLang('SortButton'));
end;

procedure DrawDuo();
begin
  DrawDiagramProcedure(DuoDiagrambox1);
  DrawDiagramProcedure(DuoDiagrambox2);
  FillListBox(DuoNumberlist);
  DrawSettings(DuoSettingsBox);
  DrawButtonStyle1(SortButton);
end;

procedure DestroyDuo();
begin
  DuoOpened:= false;
  DuoDiagrambox1.Image.Free;
  DuoDiagrambox2.Image.Free;
  DuoNumberlist.Image.Free;
  DuoSettingsBox.Image.Free;
  DuoSettingsBox.DiagramSelector1.Image.Free;
  DuoSettingsBox.DiagramSelector2.Image.Free;
  DuoSettingsBox.DiagramSelector3.Image.Free;
  SortButton.Image.Free;
end;

end.
