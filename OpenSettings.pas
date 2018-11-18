unit OpenSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;

procedure AnimateSettings(Open: Boolean);

implementation

uses DrawUI, Duo;

procedure AnimateSettings(Open: Boolean);
var
  I, Height: Integer;
const
  Increase: Integer = 20;
begin

  if Open then
  begin
    I:= 0;
    Height:= DuoSettingsBox.Image.Height;
    while I < Height do
    begin
      TThread.Synchronize(nil,
          procedure
          begin
            DuoSettingsBox.Image.Height:= DuoSettingsBox.Image.Height+Increase;
            DuoSettingsBox.Image.Top:= DuoSettingsBox.Image.Top-Increase;
            DuoSettingsBox.Box.Bitmap.Height:= DuoSettingsBox.Box.Bitmap.Height+Increase;
            DrawBox(DuoSettingsBox.Box.Bitmap);
            DuoSettingsBox.Image.Picture.Bitmap:= DuoSettingsBox.Box.Bitmap;
            DuoEditArrayLength.Image.Top:= DuoEditArrayLength.Image.Top-Increase;
            DuoEditMaxNum.Image.Top:= DuoEditMaxNum.Image.Top-Increase;
            //DuoSortButton.Image.Top:= DuoSortButton.Image.Top-Increase;
            DuoSettingsBox.DiagramSelector1.Image.Top:= DuoSettingsBox.DiagramSelector1.Image.Top-Increase;
            DuoSettingsBox.DiagramSelector2.Image.Top:= DuoSettingsBox.DiagramSelector2.Image.Top-Increase;
            DuoSettingsBox.DiagramSelector3.Image.Top:= DuoSettingsBox.DiagramSelector3.Image.Top-Increase;
          end
          );
          sleep(30);
        I:= I+Increase
    end;
  end
  else
  begin
    Height:= DuoSettingsBox.Image.Height;
    I:= Height;

    while I > 90 do
    begin
      TThread.Synchronize(nil,
          procedure
          begin
            DuoSettingsBox.Image.Height:= DuoSettingsBox.Image.Height-Increase;
            DuoSettingsBox.Image.Top:= DuoSettingsBox.Image.Top+Increase;
            DuoSettingsBox.Box.Bitmap.Height:= DuoSettingsBox.Box.Bitmap.Height-Increase;
            DrawBox(DuoSettingsBox.Box.Bitmap);
            DuoSettingsBox.Image.Picture.Bitmap:= DuoSettingsBox.Box.Bitmap;
            DuoEditArrayLength.Image.Top:= DuoEditArrayLength.Image.Top+Increase;
            DuoEditMaxNum.Image.Top:= DuoEditMaxNum.Image.Top+Increase;
            //DuoSortButton.Image.Top:= DuoSortButton.Image.Top+Increase;
            DuoSettingsBox.DiagramSelector1.Image.Top:= DuoSettingsBox.DiagramSelector1.Image.Top+Increase;
            DuoSettingsBox.DiagramSelector2.Image.Top:= DuoSettingsBox.DiagramSelector2.Image.Top+Increase;
            DuoSettingsBox.DiagramSelector3.Image.Top:= DuoSettingsBox.DiagramSelector3.Image.Top+Increase;
          end
          );
          sleep(30);
        I:= I-Increase
    end;
  end;

end;

end.
