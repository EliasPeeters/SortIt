unit FileLoaderUnit;

interface



uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

  procedure TextFileToArray(var ArrayForWriting: Array of String; TextFileName: String);


implementation

  type
    TStringArray = array of String;

procedure TextFileToArray(var ArrayForWriting: Array of String; TextFileName: String);
var
   WorkingFile: TextFile;
   TextFileLength, I: Integer;
   StorageString: String;
begin
  if FileExists(TextFileName) then
  begin
    AssignFile(WorkingFile, TextFileName);
    Reset(WorkingFile);
    TextFileLength:= 0;
    while not eof(WorkingFile) do
    begin
      Readln(WorkingFile, StorageString);
      TextFileLength:= TextFileLength+1;
    end;
    CloseFile(WorkingFile);
    SetLength(ArrayForWriting, TextFileLength);

    AssignFile(WorkingFile, TextFileName);
    Reset(WorkingFile);
    //setLength(ArrayForWriting, 10);
    ArrayForWriting[0]:= IntToStr(TextFileLength);

    for I := 1 to TextFileLength do
    begin
      Readln(WorkingFile, StorageString);
      ArrayForWriting[i]:= StorageString;

    end;
    CloseFile(WorkingFile);
  end
  else
  begin
    ShowMessage('Looks like this file does not exist');
  end;
end;

end.

