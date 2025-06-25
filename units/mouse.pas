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

uses
  Conv, Events, VGA;

var
  mouseInitialised: boolean;

procedure loadCursor;
begin
  loadImage(cursor, 'CURSOR.PNG')
end;

procedure freeCursor;
begin
  freeImage(cursor)
end;

procedure initMouse;
begin
  { Originally used to init the mouse driver in DOS }
  loadCursor;
  mouseInitialised := true;
end;

procedure updateMouse;
begin
  mouseX := sdlEvent.motion.x;
  mouseY := sdlEvent.motion.y;
  mouseButton := sdlEvent.button.button;
end;

procedure debugMouse;
begin
  if not mouseInitialised then begin
    print('Mouse has not been initialised!', 0, 0, 15);
    exit
  end;

  print('Mouse: {x:' + i32str(mouseX) + ', y:' + i32str(mouseY) + '}', 0, 0, 15);
  print('Buttons: ' + i32str(mouseButton), 0, 8, 15);
end;

procedure drawMouse;
begin
  if not mouseInitialised then exit;

  spr(cursor, mouseX, mouseY)
end;

procedure resetMouse;
begin
  { Originally used to reset the mouse driver in DOS }
end;

end.

