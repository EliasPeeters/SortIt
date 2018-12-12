unit MainUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects;

var
  SideBarImage, SingleImage, DuoImage, QuadImage, SixImage: TImage;
  CloseImage, MinimizeImage, MaximizeImage: TImage;
  CloseMenuArea, MaximizeArea, MinimzeArea: TClickAbleArea;
  SideBarBitmap, TopBarBitmap: TBitmap;
  SideBarArea, SingleArea, DuoArea, QuadArea, OctaArea: TClickAbleArea;
  MenuHoverBoolean: Boolean;

  procedure CreateMainUI();
  procedure DrawMainUI();
  procedure DrawTopBar();
  procedure MainUIPress();
  procedure MenuHover();
  procedure MenuNormal();

implementation

uses MainUnit, DrawUI, Convert, OpenImage, Single, Duo, Colors, Quad, Octa;



procedure SwitchAllImagesSideBar();
begin
  LoadImage('Single', SingleImage);
  LoadImage('Duo', DuoImage);
  LoadImage('Quad', QuadImage);
  LoadImage('Octa', SixImage);
end;

procedure MenuHover();
begin
  MenuHoverBoolean:= true;
  LoadImage('CloseHover', CloseImage);
  LoadImage('MinimizeHover', MinimizeImage);
  LoadImage('MaximizeHover', MaximizeImage);
end;

procedure MenuNormal();
begin
  MenuHoverBoolean:= false;
  LoadImage('Close', CloseImage);
  LoadImage('Minimize', MinimizeImage);
  LoadImage('Maximize', MaximizeImage);
end;

procedure CreateMenu();
const
  Size: Integer = 14;
begin
  MenuHoverBoolean:= false;
  CreateImage(CloseImage, MainForm, Size, Size, 10, 20, 'Close');
  CreateImage(MinimizeImage, MainForm, Size, Size, 30, 20, 'Minimize');
  CreateImage(MaximizeImage, MainForm, Size, Size, 50, 20, 'Maximize');
  ImageToArea(CloseImage, CloseMenuArea);
  ImageToArea(MaximizeImage, MaximizeArea);
  ImageToArea(MinimizeImage, MinimzeArea);
end;

procedure MainUIPress();
begin
  if (MainForm.CursorIsInArea(SingleArea)) and (SingleOpened = false)  then
  begin
    SwitchAllImagesSideBar();
    LoadImage('SinglePressed', SingleImage);
    if DuoOpened then DestroyDuo;
    if QuadOpened then DestroyQuad;
    if OctaOpened then DestroyOcta;
    CreateSingle;
    DrawSingle;
  end
  else if (MainForm.CursorIsInArea(DuoArea)) and (DuoOpened = false) then
  begin
  SwitchAllImagesSideBar();
    LoadImage('DuoPressed', DuoImage);
    if SingleOpened then DestroySingle;
    if QuadOpened then DestroyQuad;
    if OctaOpened then DestroyOcta;
    SingleOpened:= false;
    CreateDuo;
    DrawDuo;
  end
  else if (MainForm.CursorIsInArea(QuadArea)) and (QuadOpened = false) then
  begin
    SwitchAllImagesSideBar();
    LoadImage('QuadPressed', QuadImage);
    if SingleOpened then DestroySingle;
    if DuoOpened then DestroyDuo;
    if OctaOpened then DestroyOcta;
    CreateQuad;
    DrawQuad;
  end
  else if (MainForm.CursorIsInArea(OctaArea)) and (OCtaOpened = false) then
  begin
  SwitchAllImagesSideBar();
    LoadImage('OctaPressed', SixImage);
    if SingleOpened then DestroySingle;
    if DuoOpened then DestroyDuo;
    if QuadOpened then DestroyQuad;
    CreateOcta;
    DrawOcta;
  end;
end;

procedure CreateSideBar();
begin
  SideBarBitmap:= TBitmap.Create;
  SideBarBitmap.Height:= 800;
  SideBarBitmap.Width:= 70;
  with SidebarArea do
  begin
    x1:= 0;
    y1:= 0;
    x2:= 70;
    y2:= 800;
  end;
  CreateImage(SideBarImage, MainForm, 800, 70, 0, 0, '');
end;

procedure SideBarIcons();
begin
  CreateImage(SingleImage, MainForm, 70, 70, 0, 200, 'Single');
  CreateImage(DuoImage, MainForm, 70, 70, 0, 270, 'Duo');
  CreateImage(QuadImage, MainForm, 70, 70, 0, 340, 'Quad');
  CreateImage(SixImage, MainForm, 70, 70, 0, 410, 'Octa');
  ImageToArea(SingleImage, SingleArea);
  ImageToArea(DuoImage, DuoArea);
  ImageToArea(QuadImage, QuadArea);
  ImageToArea(SixImage, OctaArea);
end;

procedure DrawSideBar();
begin
  TopSideBar(SideBarBitmap);
  SideBarImage.Picture.Bitmap:= SideBarBitmap;
  SideBarIcons;
end;




procedure DrawTopBar();
begin
  TopBarBitmap:= TBitmap.Create;
  with TopBarBitmap do
  begin
    Height:= 50;
    Width:= 1260;
  end;
  TopSideBar(TopBarBitmap);
  MainForm.TitleBar.Picture.Bitmap:= TopBarBitmap;
end;

procedure CreateMainUI();
begin
  //CreateTopBar;
  CreateSideBar;
  CreateMenu;
end;

procedure DrawMainUI();
begin
  DrawTopBar;
  DrawSideBar;
  MainForm.Color:= Grey;
end;

end.
