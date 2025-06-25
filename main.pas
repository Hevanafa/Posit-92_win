unit Main;

interface

procedure Posit92;

implementation

uses
  SDL2,
  Bitmap, Keyboard, Timing, VGA;

var
  done: boolean;
  t: double;
  DosuEXE: array[0..1] of PImage;
  { More of your game state here }

procedure INIT;
begin
  initVGAMode;
  loadFont;
  initDeltaTime;
  initKeyHandler;
  { initMouse }

  randomize;
  loadImage(DosuEXE[0], 'IMG\DOSU_1.PNG');
  loadImage(DosuEXE[1], 'IMG\DOSU_2.PNG');
end;

procedure update;
begin
  updateDeltaTime;
  { updateKeyboard }
  { updateMouse }
  
  SDL_PumpEvents;

  { TODO: Your update code here }

  if isKeyDown(SDL_SCANCODE_ESCAPE) then
    done := true;

  t:=t+dt
end;

procedure draw;
begin
  cls($7B);

  { TODO: Your drawing code here }

  if (trunc(t * 1.5) and 1) = 0 then
    spr(DosuEXE[0], 148, 76)
  else
    spr(DosuEXE[1], 148, 76);

  print('Hello world!', 160-48, 120, 15);
  { drawMouse; }

  flush;
end;

procedure Posit92;
begin
  INIT;
  t:=0;

  done := false;
  repeat
    update;
    draw;
    limit(60);
  until done;

  { TODO: Your cleanup code here }
  freeImage(DosuEXE[0]);
  freeImage(DosuEXE[1]);
  freeFont;

  SDL_Quit
end;

end.
