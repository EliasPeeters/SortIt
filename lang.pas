unit lang;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

var
LanguageDE, LanguageEN: Array of String;

  procedure AssignLanguageDE();
  procedure AssignLanguageEN();

implementation



procedure AssignLanguageDE();
begin
  SetLength(LanguageDE, 10);
  LanguageDE[0]:= 'SortButton: Sortieren';
  LanguageDE[1]:= 'HeightMode: Höhen Modus';
  LanguageDE[2]:= 'GradientMode: Verlaufs Mode';
  LanguageDE[3]:= 'ArrayLength: Zahlen Anzahl';
  LanguageDE[4]:= 'Speed: Geschwindigkeit';
  LanguageDE[5]:= 'MaxNum: Max Zahl';
  LanguageDE[6]:= 'Stop: Stopp';
  LanguageDE[7]:= 'More: Mehr...';
  LanguageDE[8]:= 'Close: Schließen';
  LanguageDE[9]:= 'New: Neu';
end;

procedure AssignLanguageEN();
begin
  SetLength(LanguageEN, 10);
  LanguageEN[0]:= 'SortButton: Sort';
  LanguageEN[1]:= 'HeightMode: Height Mode';
  LanguageEN[2]:= 'GradientMode: Gradient Mode';
  LanguageEN[3]:= 'ArrayLength: Array Length';
  LanguageEN[4]:= 'Speed: Speed';
  LanguageEN[5]:= 'MaxNum: MaxNum';
  LanguageEN[6]:= 'Stop: Stop';
  LanguageEN[7]:= 'More: More...';
  LanguageEN[8]:= 'Close: Close';
  LanguageEN[8]:= 'New: New';
end;

procedure AssingLanguages();
begin
  AssignLanguageDE;
end;

end.
