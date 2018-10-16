unit Single;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects;

  var
    ArrayNumber: Array of Integer;
    NumberList: TNewListbox;
    NumberListImage: TImage;
    NumberListBitmap: TBitmap;

   procedure CreateSingle();

implementation

uses
  MainUnit;

procedure CreateSingle();
begin
  setLength(ArrayNumber, 30);
  CreateListbox(MainForm, Numberlist, 'Numberslist', 775, 100, 650, 100, false, ArrayNumber, NumberListImage, NumberListBitmap);
end;

end.
