unit VGA;

interface

uses SDL2;

var
  window: PSDL_Window;
  renderer: PSDL_Renderer;

procedure initVGAMode;
procedure cls(const colour: byte);
procedure flush;


implementation

procedure initVGAMode;
begin
  if SDL_Init(SDL_INIT_VIDEO) < 0 then halt(1);

  window := SDL_CreateWindow('Hello SDL', 100, 100, 320, 200, SDL_WINDOW_SHOWN);
  if window = nil then halt(1);

  renderer := SDL_CreateRenderer(window, 1, 0);
  if renderer = nil then halt(1);

  SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest');
end;

procedure cls(const colour: byte);
begin
  { TODO: Provide the VGA colour table }
  SDL_SetRenderDrawColor(renderer, $64, $95, $ED, SDL_ALPHA_OPAQUE);
  SDL_RenderClear(renderer);
end;

procedure flush;
begin
  SDL_RenderPresent(renderer);
end;

end.

