unit ReadLanguage;

interface

function ReadLang(PlaceString: String):String;

implementation

uses MainUnit, lang;

function ReadLang(PlaceString: String):String;
var
  I: Integer;
  StorageString: String;
begin
  if Language = 'de' then
  begin
    for I := 0 to length(LanguageDE) do
    begin
      StorageString:= Copy(LanguageDE[i], 0, length(PlaceString));
      if StorageString = PlaceString then
      begin
        result:= Copy(LanguageDE[i], length(PlaceString)+3, length(LanguageDE[i])-length(PlaceString)+3) ;
        break;
      end;
    end;
  end;

  if Language = 'en' then
  begin
    for I := 0 to length(LanguageEN) do
    begin
      StorageString:= Copy(LanguageEN[i], 0, length(PlaceString));
      if StorageString = PlaceString then
      begin
        result:= Copy(LanguageEN[i], length(PlaceString)+3, length(LanguageEN[i])-length(PlaceString)+3) ;
        break;
      end;
    end;
  end;
end;

end.
