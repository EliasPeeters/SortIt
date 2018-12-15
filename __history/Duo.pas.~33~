unit Duo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector;

  var
    DuoDiagrambox1, DuoDiagrambox2: TDiagramBox;

    DuoNumberlist: TNewListbox;

    DuoSettingsBox: TSettings;
    DuoSettingsBoxImage: TImage;
    DuoSettingsBoxBitmap: TBitmap;
    DuoSettingsSelector1, DuoSettingsSelector2, DuoSettingsSelector3: TImage;

    DuoSortButton: TCustomButton;
    DuoSortButtonImage: TImage;
    DuoSortButtonBitmap: TBitmap;

    DuoOpenSettings: TCustomButton;
    DuoOpenSettingsImage: TImage;
    DuoOpenSettingsBitmap: TBitmap;

    DuoEditArrayLength: TEditField;
    DuoEditSpeed: TEditField;
    DuoEditMaxNum: TEditField;

    DuoSelector1: TQuadSettingsDiagram;
    DuoSelector2: TQuadSettingsDiagram;
    DuoSelector1DropDown: TDropDownMenu;
    DuoSelector2DropDown: TDropDownMenu;
    DuoSelectorDropDownItems: TArrayOfString;

    ArrayNumber: TArrayOfInteger;
    MaxNum: Integer = 30;
    DuoSettingsOpened: Boolean;



    procedure CreateDuo();
    procedure DrawDuo();
    procedure DestroyDuo();
    procedure DuoScroll(WheelData: Integer);
    procedure DuoPress();
    procedure DuoKeyPress(Key: Char);

implementation

uses MainUnit, DrawUI, DrawDiagram, Sorting, OpenImage, ReadLanguage, EditField, Convert,
      OpenSettings, DropDownMenu, MainUI, FileLoaderUnit;


procedure DuoScroll(WheelData: Integer);
begin
  if MainForm.CursorIsInArea(DuoNumberlist.Area) then
  begin
    NewListboxScroll(DuoNumberlist, Wheeldata div 120 + DuoNumberlist.ScrollLevel);
  end;
end;

procedure CreateAdvancedSettings();
begin
  CreateEditField(MainForm, DuoEditSpeed, 500, 680, 50, 130, ReadLang('Speed'), IntToStr(MaxNum));
end;

procedure DrawAdvancedSettings();
begin
  DrawEditField(DuoEditSpeed);
end;

procedure DestroyAdvancedSettings();
begin
  DuoEditSpeed.Image.Free;
end;

procedure OpenSettingsProcedure();
begin
  TThread.CreateAnonymousThread(
  procedure
  begin
    DuoSettingsOpened:= true;
    OpenSettings.AnimateSettings(true);
    CreateAdvancedSettings;
    DrawAdvancedSettings;
    ImageToArea(DuoSettingsBox.Image, DuoSettingsBox.Area);
    ImageToArea(DuoEditArrayLength.Image, DuoEditArrayLength.Area);
    ImageToArea(DuoEditMaxNum.Image, DuoEditMaxNum.Area);
  end
  ).Start();

  DuoOpenSettings.Caption:= ReadLang('Close');
  DrawButtonStyle2(DuoOpenSettings)
end;

procedure CloseSettingsProcedure();
begin
  TThread.CreateAnonymousThread(
        procedure
        begin
          DuoSettingsOpened:= false;
          OpenSettings.AnimateSettings(false);
        end
        ).Start();
  DuoOpenSettings.Caption:= ReadLang('More');
  DrawButtonStyle2(DuoOpenSettings);
  DestroyAdvancedSettings;
end;

procedure DuoKeyPress(Key: Char);
begin
  if DuoEditArrayLength.Selected then EditFieldInput(DuoEditArrayLength, Key);
  if DuoEditSpeed.Selected then EditFieldInput(DuoEditSpeed, Key);
  if DuoEditMaxNum.Selected then EditFieldInput(DuoEditMaxNum, Key);

end;

procedure DuoPress();
begin
  if (DuoSettingsOpened) and not(MainForm.CursorIsInArea(DuoSettingsBox.Area)) then
  begin
    CloseSettingsProcedure;
  end
  else
  begin
    if MainForm.CursorIsInArea(DuoEditMaxNum.Area) then
    begin
      DuoEditMaxNum.Selected:= true;

      TThread.CreateAnonymousThread(
        procedure
        begin
          //SingleEditMaxNum.Bitmap.Canvas.Lock;
          AnimateEditField(DuoEditMaxNum);
          //SingleEditMaxNum.Bitmap.Canvas.UnLock;
        end
        ).Start();
      //DrawEditField(SingleEditSpeed);
    end

    else if MainForm.CursorIsInArea(DuoSelector1DropDown.Area) then
    begin
      ShowMessage('hello');
    end
    else if not(MainForm.CursorIsInArea(DuoEditMaxNum.Area)) and DuoEditMaxNum.Selected then
    begin
      DuoEditMaxNum.Selected:= false;
      if (DuoEditMaxNum.Text = '') or (DuoEditMaxNum.Text = '0') then DuoEditMaxNum.Text := '20';
      DrawEditField(DuoEditMaxNum);
      if maxnum <> StrToInt(DuoEditMaxNum.Text) then
      begin
        maxnum:= StrToInt(DuoEditMaxNum.Text);
        DuoDiagrambox1.MaxNum:= maxnum;
        DuoDiagrambox2.MaxNum:= maxnum;
        CreateRandomArray(ArrayNumber, MaxNum, ArrayLength);
        DuoDiagrambox1.Content:= ArrayNumber;
        DuoDiagrambox2.Content:= ArrayNumber;
        DuoNumberList.Content:= ArrayNumber;
        DrawDiagramProcedure(DuoDiagrambox1);
        DrawDiagramProcedure(DuoDiagrambox2);
        FillListBox(DuoNumberList);
      end
    end
    else if MainForm.CursorIsInArea(DuoEditSpeed.Area) then
    begin
      DuoEditSpeed.Selected:= true;

      TThread.CreateAnonymousThread(
        procedure
        begin
          //SingleEditSpeed.Bitmap.Canvas.Lock;
          AnimateEditField(DuoEditSpeed);
          //SingleEditSpeed.Bitmap.Canvas.UnLock;
        end
        ).Start();

      //DrawEditField(SingleEditSpeed);
    end
    else if not(MainForm.CursorIsInArea(DuoEditSpeed.Area)) and DuoEditSpeed.Selected then
    begin
      DuoEditSpeed.Selected:= false;
      if (DuoEditSpeed.Text = '') or (DuoEditSpeed.Text = '0') then DuoEditSpeed.Text := '20';
      DrawEditField(DuoEditSpeed);
    end
    else if MainForm.CursorIsInArea(DuoEditArrayLength.Area) then
    begin
      DuoEditArrayLength.Selected:= true;
       TThread.CreateAnonymousThread(
        procedure
        begin
          //SingleEditArrayLength.Bitmap.Canvas.Lock;
          AnimateEditField(DuoEditArrayLength);
          //SingleEditArrayLength.Bitmap.Canvas.UnLock;
        end
        ).Start();
    end
    else if not(MainForm.CursorIsInArea(DuoEditArrayLength.Area)) and DuoEditArrayLength.Selected then
    begin
      if DuoEditArrayLength.Selected = true then
      begin
        DuoEditArrayLength.Selected:= false;
        if (DuoEditArrayLength.Text = '') or (DuoEditArrayLength.Text = '0') then DuoEditArrayLength.Text := '20';

        DrawEditField(DuoEditArrayLength);
        if ArrayLength <> StrToInt(DuoEditArrayLength.Text) then
        begin
          ArrayLength:= StrToInt(DuoEditArrayLength.Text);
          CreateRandomArray(ArrayNumber, MaxNum, ArrayLength);
          DuoNumberList.Content:= ArrayNumber;
          DuoDiagrambox1.Content:= ArrayNumber;
          DuoDiagrambox2.Content:= ArrayNumber;
          DrawDiagramProcedure(DuoDiagrambox1);
          DrawDiagramProcedure(DuoDiagrambox2);
          FillListBox(DuoNumberList);
        end;
      end;
    end

    else if MainForm.CursorIsInArea(DuoSettingsBox.DiagramSelector1.Area) then
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
    else if MainForm.CursorIsInArea(DuoSortButton.Area) then
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
    end
    else if MainForm.CursorIsInArea(DuoOpenSettings.Area) then
    begin
      if DuoSettingsOpened then
      begin
        CloseSettingsProcedure;
      end
      else
      begin
        OpenSettingsProcedure();
      end;
    end;
  end;
end;

procedure CreateDuo();
begin
  DuoOpened:= true;
  ChangeLastOpened(FileStorage, 1);
  SetLengthCustom(ArrayNumber, ArrayLength);
  CreateRandomArray(ArrayNumber, MaxNum, ArrayLength);
  DuoDiagrambox1.MaxNum:= 360;
  DuoDiagrambox2.MaxNum:= 360;
  CreateDiagramBox(MainForm, DuoDiagrambox1, 100, 160, 480, 480, ArrayNumber, MaxNum, 450, 450, 15, 15);
  CreateDiagramBox(MainForm, DuoDiagrambox2, 610, 160, 480, 480, ArrayNumber, MaxNum, 450, 450, 15, 15);
  CreateListbox(MainForm, DuoNumberlist, 'Numberslist', 1120, 70, 680, 100, false, ArrayNumber);
  CreateSettingsBox(MainForm, DuoSettingsBox, 100, 660, 90, 990, DuoSettingsSelector1, DuoSettingsSelector2, DuoSettingsSelector3, 1);
  CreateCustomButton(MainForm, DuoSortButton, 780, 680, 50, 290, ReadLang('SortButton'));
  CreateCustomButton(MainForm, DuoOpenSettings, 650, 680, 50, 130, ReadLang('More'));
  CreateEditField(MainForm, DuoEditArrayLength, 360, 680, 50, 130, ReadLang('ArrayLength'), IntToStr(Arraylength));
  CreateEditField(MainForm, DuoEditMaxNum, 500, 680, 50, 130, ReadLang('MaxNum'), IntToStr(MaxNum));
  ImageToArea(DuoSettingsBox.Image, DuoSettingsBox.Area);
  CreateDuoSelectorBox(MainForm, DuoSelector1, 100, 70, 75, 480);
  CreateDuoSelectorBox(MainForm, DuoSelector2, 610, 70, 75, 480);
  CreateDropDownMenu(MainForm, DuoSelector1DropDown, 138, 80, 55, 408, DuoSelectorDropDownItems);
  CreateDropDownMenu(MainForm, DuoSelector2DropDown, 648, 80, 55, 408, DuoSelectorDropDownItems);
end;



procedure DrawDuo();
begin
  LoadImage('DuoPressed', DuoImage);
  DrawDiagramProcedure(DuoDiagrambox1);
  DrawDiagramProcedure(DuoDiagrambox2);
  FillListBox(DuoNumberlist);
  DrawSettings(DuoSettingsBox);
  DrawButtonStyle2(DuoOpenSettings);
  DrawButtonStyle1(DuoSortButton);
  DrawEditField(DuoEditArrayLength);
  DrawEditField(DuoEditMaxNum);
  DrawDuoSelectorBox(DuoSelector1);
  DrawDuoSelectorBox(DuoSelector2);
  DrawDropDown(DuoSelector1DropDown);
  DrawDropDown(DuoSelector2DropDown);
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
  DuoSortButton.Image.Free;
  DuoEditArrayLength.Image.Free;
  DuoEditMaxNum.Image.Free;
  DuoOpenSettings.Image.Free;
  DuoSelector1DropDown.ImageTop.Free;
  DuoSelector1DropDown.ImageDropDown.Free;
  DuoSelector2DropDown.ImageTop.Free;
  DuoSelector2DropDown.ImageDropDown.Free;
  DuoSelector1.Image.Free;
  DuoSelector2.Image.Free;

end;

end.
