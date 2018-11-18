unit EditField;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types;


  procedure DrawEditField(var EditField: TEditField);
  procedure EditFieldInput(var EditField: TEditField; Key: Char);
  procedure AnimateEditField(EditField: TEditField);

implementation

uses
  Colors, MainUnit;

procedure AnimateEditField(EditField: TEditField);
var
  I,x1, MaxI: Integer;
begin
  EditField.Bitmap.Canvas.Brush.Color:= clSelectColor;
  EditField.Bitmap.Canvas.Pen.Color:= clSelectColor;
  MaxI:= Round(MainUnit.AnimationSpeedExt );
  for I := 1 to Round(MainUnit.AnimationSpeedExt) do
  begin
    TThread.Synchronize(nil,
      procedure
      begin


        with EditField.Bitmap.Canvas do
        begin
          x1:=Round((EditField.Box.Width div 2) - (EditField.Box.Width div 2 - ((EditField.Box.Width / 1/2) / (MainUnit.AnimationSpeedExt) * MaxI)));
          Rectangle(x1,
                    EditField.Box.Height div 2 -2,
                    EditField.Box.Width div 2 + Round(((EditField.Box.Width / 1/2) / (MainUnit.AnimationSpeedExt)) * I),
                    EditField.Box.Height div 2);
          MaxI:= MaxI-1;
        end;
        EditField.Image.Picture.Bitmap:= EditField.Bitmap;
      end
      );
    sleep(Round(AnimationSpeedExt*2));
  end;

  TThread.Synchronize(nil,
  procedure
  begin
    EditField.Bitmap.Canvas.Rectangle(0, EditField.Box.Height div 2 -2, EditField.Box.Width, EditField.Box.Height div 2);
    EditField.Image.Picture.Bitmap:= EditField.Bitmap;
  end
  );

end;

procedure DrawEditField(var EditField: TEditField);
var
  RectForUse: TRect;
begin
  with EditField.Bitmap.Canvas do
  begin
    Brush.Color:= clBoxColor;
    Pen.Color:= clBoxColor;
    Rectangle(0,0, EditField.Box.Width, EditField.Box.Height);
    if EditField.Selected then
    begin
      Brush.Color:= clSelectColor;
      Pen.Color:= clSelectColor;
    end
    else
    begin
      Brush.Color:= Grey;
      Pen.Color:= Grey;
    end;

    if EditField.Error then
    begin
      Brush.Color:= clRed;
      Pen.Color:= clRed;
    end;


    Rectangle(0, EditField.Box.Height div 2 -2, EditField.Box.Width, EditField.Box.Height div 2);


    RectForUse.Left:= 0;
    RectForUse.Top:= EditField.Box.Height div 2 ;
    RectForUse.Bottom:= EditField.Box.Height;
    RectForUse.Right:= EditField.Box.Width;
    Font.Size:= 8;
    Brush.Color:= clBoxColor;
    Font.Name:= FontFamily;
    TextRect(RectForUse,EditField.Caption,[tfVerticalCenter,tfCenter,tfSingleLine]);

    RectForUse.Left:= 0;
    RectForUse.Top:= 0;
    RectForUse.Bottom:= EditField.Box.Height div 2;
    RectForUse.Right:= EditField.Box.Width;
    Font.Size:= 12;
    Brush.Color:= clBoxColor;
    TextRect(RectForUse,EditField.Text,[tfVerticalCenter,tfCenter,tfSingleLine]);
  end;
  EditField.Image.Picture.Bitmap:= EditField.Bitmap;
  EditField.Error:= false;
end;

procedure EditFieldInput(var EditField: TEditField; Key: Char);
var
  Input: String;
begin
  Input:= 'error';

  if (ord(key) >= 48) and (ord(key) <= 57) then Input:= key
  else if Key = Char(44) then Input:= ','
  else if Key = Char(46) then Input:= ','
  else if Key = Char(#8) then Input:= '#8'
  else if Key = Char(#$D) then Input:= '#$D';

  if Input = '#8' then EditField.Text:= Copy(EditField.Text, 0, length(EditField.Text)-1)
  else if Input = 'error' then EditField.Error:= true
  else if Input = '#$D' then
  begin
    EditField.Selected:= false;
    DrawEditField(EditField);
      if (EditField.Text = '') or (EditField.Text = '0') then EditField.Text := '20';
  end
  else if (Input <> ' ') then EditField.Text:= EditField.Text + Input;

  DrawEditField(EditField);

end;

end.
