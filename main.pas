unit Main;

interface

procedure Posit92;

implementation

uses
  SDL2,
  Keyboard, VGA;

var
  done: boolean;
  { More of your game state here }

procedure INIT;
begin
  initVGAMode;
  initKeyHandler;

  randomize;
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

  SDL_Quit
end;

end.
