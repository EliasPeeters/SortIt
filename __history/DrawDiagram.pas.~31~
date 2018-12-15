unit DrawDiagram;

interface
  uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Types, Colors;


  procedure DrawDiagramProcedure(Diagrambox: TDiagrambox);


implementation


uses DrawUI, Convert;





procedure DrawBarChart(DiagramBox: TDiagrambox);
var
  BarWidth, BarHeight, x1, ExtraDistanz, GreyColor, I: Integer;

begin
  DrawBox(DiagramBox.Box.Bitmap);
  barWidth:= DiagramBox.Diagram.Width div (length(DiagramBox.Content));
  //ExtraDistanz:= BarWidth div length(DiagramBox.Content);
  ExtraDistanz:= 0;
  x1:= DiagramBox.Diagram.x;
    with DiagramBox.Box.Bitmap.Canvas do
    begin
      Brush.Color:= clBoxColor;
      Pen.Color:= clBoxColor;
      Rectangle(DiagramBox.Diagram.x,DiagramBox.Diagram.y, DiagramBox.Diagram.Width, DiagramBox.Diagram.Height);

      MoveTo(DiagramBox.Diagram.x, DiagramBox.Diagram.Height+DiagramBox.Diagram.y);
      GreyColor:= 140;
      Pen.Style:= psSolid;
      Pen.Color:= rgb(GreyColor, GreyColor, GreyColor);
      LineTo(DiagramBox.Diagram.Width+DiagramBox.Diagram.x, DiagramBox.Diagram.Height+DiagramBox.Diagram.y);

      GreyColor:= 190;
      Pen.Style:= psDot;
      Pen.Color:= rgb(GreyColor, GreyColor, GreyColor);

      MoveTo(DiagramBox.Diagram.x, Round(DiagramBox.Diagram.Height * 1/4)+DiagramBox.Diagram.y);
      LineTo(DiagramBox.Diagram.Width+DiagramBox.Diagram.x, Round(DiagramBox.Diagram.Height * 1/4)+DiagramBox.Diagram.y);

      MoveTo(DiagramBox.Diagram.x, Round(DiagramBox.Diagram.Height * 2/4)+DiagramBox.Diagram.y);
      LineTo(DiagramBox.Diagram.Width+DiagramBox.Diagram.x, Round(DiagramBox.Diagram.Height * 2/4)+DiagramBox.Diagram.y);

      MoveTo(DiagramBox.Diagram.x, Round(DiagramBox.Diagram.Height * 3/4)+DiagramBox.Diagram.y);
      LineTo(DiagramBox.Diagram.Width+DiagramBox.Diagram.x, Round(DiagramBox.Diagram.Height * 3/4)+DiagramBox.Diagram.y);



        Pen.Style:= psSolid;
        Pen.Color:= clBoxColor;
        //Brush.Color:= DiagramColor;

        for I := 0 to length(DiagramBox.Content)-1 do
        begin
          if Diagrambox.Diagram.ColorMode = false then
          begin
            if I = DiagramBox.SelectedItem then Brush.Color:= rgb(88, 206, 162)
            else Brush.Color:= DiagramColor;
          end
          else
          begin
            Brush.Color:= GiveColorBack(DiagramBox.MaxNum, Diagrambox.Content[i]);
          end;

          BarHeight:= (DiagramBox.Diagram.Height div DiagramBox.MaxNum)*DiagramBox.Content[i];
          if DiagramBox.Diagram.HeightMode = false then BarHeight:= DiagramBox.Diagram.Height;

          Rectangle(x1, DiagramBox.Diagram.Height+DiagramBox.Diagram.y, x1+barWidth, DiagramBox.Diagram.Height-BarHeight+DiagramBox.Diagram.y);
          x1:= x1+BarWidth+ExtraDistanz;
        end;


    end;


  DiagramBox.Image.Picture.Bitmap:= DiagramBox.Box.Bitmap;
end;


procedure DrawPie(Canvas: TCanvas; x1, y1, Height, Width: Integer; Anfangswinkel, Endwinkel: Extended);
var
  Anfangswinkelx, Anfangswinkely: Integer;
  Endwinkelx, Endwinkely: Integer;
  Radius: Integer;
begin
  Radius:= Width div 2;
  Anfangswinkely:= Round(sin(Anfangswinkel-pi /2) * Radius + Radius+y1);
  Anfangswinkelx:= Round(cos(Anfangswinkel-pi /2) * Radius + Radius+x1);

  Endwinkely:= Round(sin(Endwinkel-pi /2) *Radius+Radius+y1);
  Endwinkelx:= Round(cos(Endwinkel-pi /2)*Radius+Radius+x1);

  Canvas.Pie(x1, y1, x1+Height, y1+Width, Anfangswinkelx, Anfangswinkely, Endwinkelx, Endwinkely);

  //test
end;

procedure DrawCirleChart(DiagramBox: TDiagrambox);
var
I: Integer;
HelperForColor: Boolean;
Winkel, LengthInt: Extended;
test: TColor;
begin
  DrawBox(DiagramBox.Box.Bitmap);
  with DiagramBox.Box.Bitmap.Canvas do
  begin
    Winkel:= 2 * pi / Length(Diagrambox.Content);
    for I := 1 to Length(DiagramBox.Content) do
    begin
      if Diagrambox.Diagram.ColorMode = false then
      begin
        if I = DiagramBox.SelectedItem then Brush.Color:= rgb(88, 206, 162)
        else
        begin
          if HelperForColor then
          begin
            Brush.Color:= DiagramColor;
            HelperForColor:= false;
          end
          else
          begin
            Brush.Color:= DiagramColorSecond;
            HelperForColor:= true;
          end;
        end;
      end
      else
      begin
        Brush.Color:= GiveColorBack(DiagramBox.MaxNum, Diagrambox.Content[i]);
      end;

      Pen.Color:= Brush.Color;
      DrawPie(Diagrambox.Box.Bitmap.Canvas, Diagrambox.Diagram.x, Diagrambox.Diagram.y, Diagrambox.Diagram.height, Diagrambox.Diagram.Width, Winkel*(i), Winkel*(i-1));
    end;
  end;
  DiagramBox.Image.Picture.Bitmap:= DiagramBox.Box.Bitmap;
end;

procedure DrawDiagramProcedure(Diagrambox: TDiagrambox);
begin
  if Diagrambox.Diagram.DiagramTyp = 0 then DrawCirleChart(Diagrambox)
  else if Diagrambox.Diagram.DiagramTyp = 1 then DrawBarChart(Diagrambox);


end;


end.

