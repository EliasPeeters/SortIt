unit DrawDiagram;

interface
  uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Types, Colors;


 procedure DrawBarChart(DiagramBox: TDiagrambox);


implementation


procedure DrawBarChart(DiagramBox: TDiagrambox);
var
  BarWidth, BarHeight, x1, ExtraDistanz, GreyColor, I: Integer;

begin
  barWidth:= DiagramBox.Diagram.Width div (length(DiagramBox.Content));
  //ExtraDistanz:= BarWidth div length(DiagramBox.Content);
  ExtraDistanz:= 0;
  x1:= DiagramBox.Diagram.x;
  with DiagramBox.Box.Bitmap.Canvas do
  begin
    Brush.Color:= LightBoxColor;
    Pen.Color:= LightBoxColor;
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


    if DiagramBox.SelectedItem < 0 then
    begin
      Pen.Style:= psSolid;
      Pen.Color:= LightBoxColor;
      Brush.Color:= DiagramColor;


      for I := 0 to length(DiagramBox.Content)-1 do
      begin
        BarHeight:= (DiagramBox.Diagram.Height div DiagramBox.MaxNum)*DiagramBox.Content[i];
        Rectangle(x1, DiagramBox.Diagram.Height+DiagramBox.Diagram.y, x1+barWidth, DiagramBox.Diagram.Height-BarHeight+DiagramBox.Diagram.y);
        x1:= x1+BarWidth+ExtraDistanz;
      end;
    end

    else
    begin
      Pen.Style:= psSolid;
      Pen.Color:= LightBoxColor;
      Brush.Color:= DiagramColor;

      for I := 0 to length(DiagramBox.Content)-1 do
      begin
        if I = DiagramBox.SelectedItem then Brush.Color:= rgb(88, 206, 162)
        else Brush.Color:= rgb(233, 233, 233);

        BarHeight:= (DiagramBox.Diagram.Height div DiagramBox.MaxNum)*DiagramBox.Content[i];
        Rectangle(x1, DiagramBox.Diagram.Height, x1+barWidth, DiagramBox.Diagram.Height-BarHeight);
        x1:= x1+BarWidth+ExtraDistanz;
      end;
    end;

  end;

  DiagramBox.Image.Picture.Bitmap:= DiagramBox.Box.Bitmap;
end;

end.
