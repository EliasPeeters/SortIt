unit Error;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, CreateObjects, OpenImage;


implementation

procedure TMainForm.Error(ErrorInteger: Integer; Form: TForm);
var
  Stor: Double;
  Error: Boolean;
begin
  case ErrorInteger of
    1:
      begin
        with TTaskDialog.Create(Form) do
          begin
           try
            Caption := 'Error 1';
            Title := 'Error 1';
            Text := 'This is a test error and means nothing. You can keep going with any further thoughts';
            CommonButtons := [];
            with TTaskDialogButtonItem(Buttons.Add) do
            begin
              Caption := 'Close Dialog';
              CommandLinkHint := 'You can ignore this type of error';
              ModalResult := mrClose;
            end;

             Flags := [tfUseCommandLinks];
            MainIcon := tdiNone;
            if execute then

            if ModalResult = mrClose then
            begin
              //nothing
            end;

          finally
            Free;
          end;
        end;
      end;

    300:
      begin
        with TTaskDialog.Create(Form) do
          begin
           try
            Caption := 'Error 300';
            Title := 'FATAL ERROR: Error 300';
            Text := 'Not able to find config file';
            CommonButtons := [];
            with TTaskDialogButtonItem(Buttons.Add) do
            begin
              Caption := 'CloseProgram';
              CommandLinkHint := 'Error 300 is a fatal error';
              ModalResult := mrClose;
            end;

            with TTaskDialogButtonItem(Buttons.Add) do
            begin
              Caption := 'Try fix';
              CommandLinkHint := 'Try to add default config file';
              ModalResult := mrYes;
            end;

            Flags := [tfUseCommandLinks];
            MainIcon := tdiError;
            if execute then

            if ModalResult = mrClose then
            begin
              Application.Terminate;
            end;

            if ModalResult = mrYes then
            begin
              //AddStringToConfig('ja moin');
              //LoadSampleConfig();
            end;

          finally
            Free;
          end;
        end;
      end;

    306:
      begin
        with TTaskDialog.Create(Form) do
          begin
           try
            Caption := 'Error 306';
            Title := 'FATAL ERROR: Error 306';
            Text := 'Not able to find "animation-speed" in config file';
            CommonButtons := [];
            with TTaskDialogButtonItem(Buttons.Add) do
            begin
              Caption := 'CloseProgram';
              CommandLinkHint := 'Error 306 is a fatal error';
              ModalResult := mrClose;
            end;

            with TTaskDialogButtonItem(Buttons.Add) do
            begin
              Caption := 'Try fix';
              CommandLinkHint := 'Try to add default animation-speed to config file';
              ModalResult := mrYes;
            end;

            Flags := [tfUseCommandLinks];
            MainIcon := tdiError;
            if execute then

            if ModalResult = mrClose then
            begin
              Application.Terminate;
            end;

            if ModalResult = mrYes then
            begin

            end;

          finally
            Free;
          end;
        end;
      end;

    404:
      begin
        with TTaskDialog.Create(Form) do
          begin
           try
            Caption := 'Error 404';
            Title := 'Error 404';
            Text := 'The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible.';
            CommonButtons := [];
            with TTaskDialogButtonItem(Buttons.Add) do
            begin
              Caption := 'Ignore';
              CommandLinkHint := 'Igrnore and abort the current action';
              ModalResult := mrClose;
            end;

             Flags := [tfUseCommandLinks];
            //MainIcon := tdiNone;
            if execute then

            if ModalResult = mrClose then
            begin
              //nothing
            end;

          finally
            Free;
          end;
        end;
      end;

    //404: ShowMessage('Error 404'+#10#13+ 'Something not found');
  end;
end;

end.
