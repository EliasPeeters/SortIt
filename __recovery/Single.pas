unit Single;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector, Sorting;

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

    SingleHeightModeSelector: TSelectorSlider;
    SingleHeightModeSelectorImage: TImage;
    SingleHeightModeSelectorBitmap: TBitmap;

    SingleGradientModeSelector: TSelectorSlider;
    SingleGradientModeSelectorImage: TImage;
    SingleGradientModeSelectorBitmap: TBitmap;

    MaxNum: Integer;

   procedure CreateSingle();
   procedure DrawSingle();
   procedure DestroySingle();
   procedure SingleScroll(WheelData: Integer);
   procedure SinglePress();


implementation

uses
  MainUnit, DrawUI, DrawDiagram, OpenImage, MainUI, ReadLanguage;




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

  if MainForm.CursorIsInArea(SingleHeightModeSelector.Area) then
  begin

    TThread.CreateAnonymousThread(
      procedure
      begin
        MoveSlider(SingleHeightModeSelector);
        if SingleHeightModeSelector.Selected = 1 then
          SingleHeightModeSelector.Selected:= 0
        else if SingleHeightModeSelector.Selected = 0 then
          SingleHeightModeSelector.Selected:= 1;
      end
      ).Start();


  end;
end;

procedure CreateSingle();
begin;
  MaxNum:= 360;
  SingleOpened:= true;
  SetLengthCustom(ArrayNumber);
  CreateRandomArray(ArrayNumber, MaxNum);
  CreateListbox(MainForm, SingleNumberlist, 'Numberslist', 775, 100, 650, 100, false, ArrayNumber, SingleNumberListImage, SingleNumberListBitmap);
  CreateDiagramBox(MainForm, SingleDiagram, 100, 100, 650, 650, ArrayNumber, SingleDiagramImage, SingleDiagramBitmap, MaxNum, 600, 600, 25, 25);
  CreateStatus(MainForm, SinlgeStatusBar, 900, 100, 66, 340, StatusBarImage, StatusBarBitmap, 30, 290, 25, 19);
  CreateSettingsBox(MainForm, SingleSettings, 900, 190, 560, 340, SingleSettingsImage, SingleSettingsBitmap, SingleDiagramSelector1,
    SingleDiagramSelector2, SingleDiagramSelector3, 0);
  SingleDiagram.Diagram.DiagramTyp:= DefautlDiagramtype;
  CreateCustomButton(MainForm, SingleSortButton, 925, 670, 50, 290, SingleSortButtonImage, SingleSortButtonBitmap, ReadLang('SortButton'));
  CreateVertSelector(MainForm, SingleHeightModeSelector, 925, 400, 25, 290, SingleHeightModeSelectorImage, SingleHeightModeSelectorBitmap, ReadLang('HeightMode'));
  CreateVertSelector(MainForm, SingleGradieModeSelector, 925, 400, 25, 290, SingleHeightModeSelectorImage, SingleHeightModeSelectorBitmap, ReadLang('HeightMode'));
end;

procedure DestroySingle();
begin
  SingleOpened:= false;
  SingleNumberlist.Image.Free;
  SingleDiagram.Image.Free;
  SinlgeStatusBar.Image.Free;
  SingleSettings.Image.Free;
  SingleSortButton.Image.Free;
  SingleHeightModeSelector.Image.Free;
  SingleSettings.DiagramSelector1.Image.Free;
  SingleSettings.DiagramSelector2.Image.Free;
  SingleSettings.DiagramSelector3.Image.Free;
end;

procedure DrawSingle();
begin
  LoadImage('SinglePressed', SingleImage);
  FillListBox(SingleNumberList);
  DrawDiagramProcedure(SingleDiagram);
  SinlgeStatusBar.Status:= 60;
  DrawStatus(SinlgeStatusBar);
  DrawSettings(SingleSettings);

  if SingleDiagram.Diagram.DiagramTyp = 0 then LoadImage('CirclePressed', SingleSettings.DiagramSelector1.Image)
  else if SingleDiagram.Diagram.DiagramTyp = 1 then   LoadImage('BarPressed', SingleSettings.DiagramSelector2.Image)
  else if SingleDiagram.Diagram.DiagramTyp = 2 then   LoadImage('ColumnPressed', SingleSettings.DiagramSelector3.Image);
  SingleHeightModeSelector.Selected:= 0;
  DrawButtonStyle1(SingleSortButton);
  DrawVertSelectorDuo(SingleHeightModeSelector);
  FillListbox(SingleNumberlist);
  SingleNumberlist.Image.Picture.Bitmap:= SingleNumberlist.Box.Bitmap;
  DrawBox(SingleDiagram.Box.Bitmap);
  SingleDiagram.Image.Picture.Bitmap:= SingleDiagram.Box.Bitmap;
  DrawDiagramProcedure(SingleDiagram);
end;

end.