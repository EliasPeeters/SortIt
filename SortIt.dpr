program SortIt;

{$R 'Ressources.res' 'Ressources.rc'}

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  CreateObjects in 'CreateObjects.pas',
  OpenImage in 'OpenImage.pas',
  Colors in 'Colors.pas',
  FileLoaderUnit in 'FileLoaderUnit.pas',
  Error in 'Error.pas',
  Types in 'Types.pas',
  Single in 'Single.pas',
  DrawUI in 'DrawUI.pas',
  DrawDiagram in 'DrawDiagram.pas',
  MainUI in 'MainUI.pas',
  QuickSort in 'QuickSort.pas',
  SliderSelector in 'SliderSelector.pas',
  Convert in 'Convert.pas',
  ReadLanguage in 'ReadLanguage.pas',
  lang in 'lang.pas',
  Duo in 'Duo.pas',
  Sorting in 'Sorting.pas',
  settings in 'settings.pas' {SettingsForm},
  EditField in 'EditField.pas',
  ColorPicker in 'ColorPicker.pas' {ColorPickerForm},
  Tab in 'Tab.pas',
  DropDownMenu in 'DropDownMenu.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TColorPickerForm, ColorPickerForm);
  Application.Run;
end.
