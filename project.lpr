{
  Project starter code
  Part of Posit-92 game framework
}

var
  window: PSDL_Window;
  renderer: PSDL_Renderer;
  keyboardState: PUInt8;

  done: boolean;
  { More of your game state here }

procedure update;
begin
  SDL_PumpEvents;

  { Your update code here }

  if keyboardState[SDL_SCANCODE_ESCAPE] = 1 then
    done := true;
end;

procedure draw;
begin
  SDL_SetRenderDrawColor(renderer, $64, $95, $ED, SDL_ALPHA_OPAQUE);
  SDL_RenderClear(renderer);

  { Your drawing code here }

  SDL_RenderPresent(renderer);
end;


begin
  if SDL_Init(SDL_INIT_VIDEO) < 0 then halt(1);

  window := SDL_CreateWindow('Hello SDL', 100, 100, 320, 200, SDL_WINDOW_SHOWN);
  if window = nil then halt(1);

  renderer := SDL_CreateRenderer(window, 1, 0);
  if renderer = nil then halt(1);

  SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest');

  keyboardState := SDL_GetKeyboardState(nil);

  done := false;
  repeat
    update;
    draw;
    SDL_Delay(16);
  until done;

  SDL_Quit
end.

