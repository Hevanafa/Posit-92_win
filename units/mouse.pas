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
{ Mouse updates are handled in Events unit }
{ procedure updateMouse; }
procedure debugMouse;
procedure drawMouse;
procedure resetMouse;

procedure setMouseX(const x: word);
procedure setMouseY(const y: word);
procedure setMouseButton(const button: byte);


implementation

uses
  SDL2,
  Conv, VGA;

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
  SDL_ShowCursor(SDL_DISABLE);
  mouseInitialised := true;
end;

{
procedure updateMouse;
begin
  mouseX := sdlEvent.motion.x;
  mouseY := sdlEvent.motion.y;
  mouseButton := sdlEvent.button.button;
end;
}

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
  SDL_ShowCursor(SDL_ENABLE);
  mouseInitialised := false;
end;

procedure setMouseX(const x: word);
begin
  if not mouseInitialised then exit;
  mouseX := x
end;

procedure setMouseY(const y: word);
begin
  if not mouseInitialised then exit;
  mouseY := y
end;

procedure setMouseButton(const button: byte);
begin
  if not mouseInitialised then exit;
  mouseButton := button
end;

end.

