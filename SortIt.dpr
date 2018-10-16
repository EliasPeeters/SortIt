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
  DrawUI in 'DrawUI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
