unit FileLoaderUnit;

interface



uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

  procedure TextFileToArray(var ArrayForWriting: Array of String; TextFileName: String);
  function AnimationSpeed(var ArrayForWriting: Array of String): Extended;
  function DarkMode(var ArrayForWriting: Array of String): Boolean;
  procedure LoadConfig(var ArrayForWriting: Array of String);

implementation

uses
  MainUnit, Error;


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



function AnimationSpeed(var ArrayForWriting: Array of String): Extended;
var
  StorageString: String;
  AnimationSpeedString: String;
  FoundInLine, i, ConfigTXTLength: Integer;
  ConfigTXT: TextFile;
begin

  //if Array is empty fill it


  for I := 1 to StrToInt(ArrayForWriting[0])  do
  begin
    StorageString:= ArrayForWriting[i];
    StorageString:= Copy(StorageString, 1, 15);
    if StorageString = 'animation-speed' then
    begin
      result:= StrToFloat(Copy(ArrayForWriting[i], 18, Length(ArrayForWriting[i])-17));
      break;
    end;
  end;

  if i-1 = StrToInt(ArrayForWriting[0]) then
  begin
    errorProcedure(306, MainForm);
    Abort;
  end;

end;

function ReadFileInt(var ArrayForWriting: Array of String; Input: String): Integer;
var
  StorageString: String;
  AnimationSpeedString: String;
  FoundInLine, i, ConfigTXTLength: Integer;
  ConfigTXT: TextFile;
begin

  for I := 1 to StrToInt(ArrayForWriting[0])  do
  begin
    StorageString:= ArrayForWriting[i];
    StorageString:= Copy(StorageString, 1, length(input));
    if StorageString = input then
    begin
      result:= StrToInt(Copy(ArrayForWriting[i], length(input)+3,
      Length(ArrayForWriting[i])-length(input)+1));
      break;
    end;
  end;

  if i-1 = StrToInt(ArrayForWriting[0]) then
  begin
    errorProcedure(306, MainForm);
    Abort;
  end;

end;

function DarkMode(var ArrayForWriting: Array of String): Boolean;
var
  StorageString: String;
  AnimationSpeedString: String;
  FoundInLine, i, ConfigTXTLength: Integer;
  ConfigTXT: TextFile;
begin

  //if Array is empty fill it

  for I := 1 to StrToInt(ArrayForWriting[0])  do
  begin
    StorageString:= ArrayForWriting[i];
    StorageString:= Copy(StorageString, 1, 9);
    if StorageString = 'dark-mode' then
    begin
      StorageString:= Copy(ArrayForWriting[i], 12, StrToInt(ArrayForWriting[0]));
      break;
    end;
  end;

  if StorageString = 'false' then
  begin
    result:= false;
  end
  else if StorageString = 'true' then
  begin
    result:= true;
  end;


  if i-1 = StrToInt(ArrayForWriting[0]) then
  begin
    errorProcedure(306, MainForm);
    Abort;
  end;

end;

procedure LoadConfig(var ArrayForWriting: Array of String);
begin

  TextFileToArray(ArrayForWriting, 'config.txt');
  DarkModeBoolean:= DarkMode(ArrayForWriting);
  AnimationSpeedExt:= AnimationSpeed(ArrayForWriting);
  DefautlDiagramtype:= ReadFileInt(ArrayForWriting, 'default-diagram-type');
end;


end.

