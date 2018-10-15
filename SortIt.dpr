program SortIt;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  CreateObjects in 'CreateObjects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
