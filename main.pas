unit Main;

interface

procedure Posit92;

implementation

uses
  SDL2,
  Bitmap, Keyboard, VGA;

var
  done: boolean;
  DosuEXE: array[0..1] of PImage;
  { More of your game state here }

procedure INIT;
begin
  initVGAMode;
  { loadFont; }
  initKeyHandler;

  randomize;
  loadImage(DosuEXE[0], 'IMG\DOSU_1.BMP');
  loadImage(DosuEXE[1], 'IMG\DOSU_2.BMP');
  { TODO: Load the mascot image }
end;

procedure update;
begin
  SDL_PumpEvents;

  { Your update code here }

  if isKeyDown(SDL_SCANCODE_ESCAPE) then
    done := true;
end;

procedure draw;
begin
  cls($7B);

  { Your drawing code here }
  { TODO: Print hello world with VGA font }

  flush;
end;

procedure Posit92;
begin
  INIT;

  done := false;
  repeat
    update;
    draw;
    SDL_Delay(16);
  until done;

  { Your cleanup code here }
  freeImage(DosuEXE[0]);
  freeImage(DosuEXE[1]);

  SDL_Quit
end;

end.
