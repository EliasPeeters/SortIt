unit Quad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects, QuickSort, SliderSelector;

  procedure CreateQuad();
  procedure DrawQuad();
  procedure DestroyQuad();

var
  ArrayNumber: TArrayOfInteger;
  QuadDiagrambox1, QuadDiagrambox2, QuadDiagrambox3, QuadDiagrambox4: TDiagramBox;
  QuadDiagrambox1Status, QuadDiagrambox2Status, QuadDiagrambox3Status, QuadDiagrambox4Status: TStatus;
  QuadNumberlist: TNewListbox;
  QuadSettingsBox: TSettings;
  QuadSelector1, QuadSelector2, QuadSelector3: TImage;
  QuadSettingsBoxDiagram1, QuadSettingsBoxDiagram2, QuadSettingsBoxDiagram3, QuadSettingsBoxDiagram4: TQuadSettingsDiagram;

implementation

uses MainUnit, MainUI, DrawDiagram, Sorting, DrawUI, FileLoaderUnit, OpenImage;

procedure CreateQuad();
begin
  QuadOpened:= true;
  ChangeLastOpened(FileStorage, 2);
  CreateRandomArray(ArrayNumber, MaxNum, ArrayLength);
  CreateDiagramBox(MainForm, QuadDiagrambox1, 100, 160, 240, 240, ArrayNumber, MaxNum, 190, 190, 25, 25);
  CreateDiagramBox(MainForm, QuadDiagrambox2, 350, 160, 240, 240, ArrayNumber, MaxNum, 190, 190, 25, 25);
  CreateDiagramBox(MainForm, QuadDiagrambox3, 600, 160, 240, 240, ArrayNumber, MaxNum, 190, 190, 25, 25);
  CreateDiagramBox(MainForm, QuadDiagrambox4, 850, 160, 240, 240, ArrayNumber, MaxNum, 190, 190, 25, 25);
  CreateListbox(MainForm, QuadNumberlist, 'Numberslist', 1120, 100, 650, 100, false, ArrayNumber);
  CreateStatus(MainForm, QuadDiagrambox1Status, 100, 100, 50, 240, 25, 200, 20, 13);
  CreateStatus(MainForm, QuadDiagrambox2Status, 350, 100, 50, 240, 25, 200, 20, 13);
  CreateStatus(MainForm, QuadDiagrambox3Status, 600, 100, 50, 240, 25, 200, 20, 13);
  CreateStatus(MainForm, QuadDiagrambox4Status, 850, 100, 50, 240, 25, 200, 20, 13);
  CreateSettingsBox(MainForm, QuadSettingsBox, 100, 660, 90, 990, QuadSelector1, QuadSelector2, QuadSelector3, 1);
  CreateQuadSettingsDiagram(MainForm, QuadSettingsBoxDiagram1, 100, 380, 270, 240);
  CreateQuadSettingsDiagram(MainForm, QuadSettingsBoxDiagram2, 350, 380, 270, 240);
  CreateQuadSettingsDiagram(MainForm, QuadSettingsBoxDiagram3, 600, 380, 270, 240);
  CreateQuadSettingsDiagram(MainForm, QuadSettingsBoxDiagram4, 850, 380, 270, 240);

end;

procedure DrawQuad();
begin
  LoadImage('QuadPressed', QuadImage);
  DrawDiagramProcedure(QuadDiagrambox1);
  DrawDiagramProcedure(QuadDiagrambox2);
  DrawDiagramProcedure(QuadDiagrambox3);
  DrawDiagramProcedure(QuadDiagrambox4);
  FillListBox(QuadNumberlist);
  DrawQuadSettingsBox(QuadSettingsBoxDiagram1);
  DrawQuadSettingsBox(QuadSettingsBoxDiagram2);
  DrawQuadSettingsBox(QuadSettingsBoxDiagram3);
  DrawQuadSettingsBox(QuadSettingsBoxDiagram4);
  DrawStatus(QuadDiagrambox1Status);
  DrawStatus(QuadDiagrambox2Status);
  DrawStatus(QuadDiagrambox3Status);
  DrawStatus(QuadDiagrambox4Status);
  DrawSettings(QuadSettingsBox);
end;

procedure DestroyQuad();
begin
  QuadOpened:= false;
  QuadDiagrambox1.Image.Free;
  QuadDiagrambox2.Image.Free;
  QuadDiagrambox3.Image.Free;
  QuadDiagrambox4.Image.Free;
  QuadNumberlist.Image.Free;
  QuadSettingsBoxDiagram1.Image.Free;
  QuadSettingsBoxDiagram1.DropDown.ImageTop.Free;
  QuadSettingsBoxDiagram1.DropDown.ImageDropDown.Free;
  QuadSettingsBoxDiagram2.Image.Free;
  QuadSettingsBoxDiagram2.DropDown.ImageTop.Free;
  QuadSettingsBoxDiagram2.DropDown.ImageDropDown.Free;
  QuadSettingsBoxDiagram3.Image.Free;
  QuadSettingsBoxDiagram3.DropDown.ImageTop.Free;
  QuadSettingsBoxDiagram3.DropDown.ImageDropDown.Free;
  QuadSettingsBoxDiagram4.Image.Free;
  QuadSettingsBoxDiagram4.DropDown.ImageTop.Free;
  QuadSettingsBoxDiagram4.DropDown.ImageDropDown.Free;
  QuadDiagrambox1Status.Image.Free;
  QuadDiagrambox2Status.Image.Free;
  QuadDiagrambox3Status.Image.Free;
  QuadDiagrambox4Status.Image.Free;
  QuadSettingsBox.Image.Free;
  QuadSettingsBox.DiagramSelector1.Image.Free;
  QuadSettingsBox.DiagramSelector2.Image.Free;
  QuadSettingsBox.DiagramSelector3.Image.Free;
end;

end.
