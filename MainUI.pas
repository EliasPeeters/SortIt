unit MainUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Types, CreateObjects;

var
  SideBarImage, TopBarImage: TImage;
  SideBarBitmap, TopBarBitmap: TBitmap;

  procedure CreateMainUI();
  procedure DrawMainUI();

implementation

uses MainUnit, DrawUI;

procedure CreateSideBar();
begin
  SideBarBitmap:= TBitmap.Create;
  SideBarBitmap.Height:= 800;
  SideBarBitmap.Width:= 70;
  CreateImage(SideBarImage, MainForm, 800, 70, 0, 0, '');
end;

procedure DrawSideBar();
begin
  TopSideBar(SideBarBitmap);
  SideBarImage.Picture.Bitmap:= SideBarBitmap;
end;

procedure CreateTopBar();
begin
  TopBarBitmap:= TBitmap.Create;
  TopBarBitmap.Height:= 50;
  TopBarBitmap.Width:= 1260;
  CreateImage(TopBarImage, MainForm, 50, 1260, 0, 0, '');
end;

procedure DrawTopBar();
begin
  TopSideBar(TopBarBitmap);
  TopBarImage.Picture.Bitmap:= TopBarBitmap;
end;

procedure CreateMainUI();
begin
  CreateTopBar;
  CreateSideBar;
end;

procedure DrawMainUI();
begin
  DrawTopBar;
  DrawSideBar;
end;

end.
