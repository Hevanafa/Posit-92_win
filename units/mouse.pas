unit Mouse;

interface

uses
  Bitmap;

var
  cursor: PImage;
  mouseX, mouseY: word;
  mouseButton: byte;

procedure loadCursor;
procedure freeCursor;
procedure initMouse;
procedure updateMouse;
procedure debugMouse;
procedure drawMouse;
procedure resetMouse;


implementation

uses Events;

var
  mouseInitialised: boolean;

procedure loadCursor;
begin
  loadImage(cursor, 'CURSOR.PNG')
end;

procedure initMouse;
begin
  { Originally used to init the mouse driver }
  loadCursor;
  mouseInitialised := true;
end;

procedure updateMouse;
begin
  mouseX := sdlEvent.motion.x;
  mouseY := sdlEvent.motion.y;
  mouseButton := sdlEvent.button.button;
end;

end.

