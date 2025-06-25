unit VGA;

interface

uses SDL2, Bitmap;

var
  font8x8: PImage;

procedure initVGAMode;
procedure loadFont;
procedure cls(const colour: byte);
procedure print(const text: string; const x, y: integer; const colour: byte);
{ procedure pset(const x, y: integer; const colour: byte); }

procedure flush;


implementation

uses Renderer;


procedure initVGAMode;
begin
  if SDL_Init(SDL_INIT_VIDEO) < 0 then halt(1);

  sdlWindow := SDL_CreateWindow('Hello Posit-92 with SDL!', 100, 100, 320, 200, SDL_WINDOW_SHOWN);
  if sdlWindow = nil then halt(1);

  sdlRenderer := SDL_CreateRenderer(sdlWindow, 1, 0);
  if sdlRenderer = nil then halt(1);

  SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest');
end;

procedure loadFont;
begin
  loadImage(font8x8, 'CP437.PNG')
end;

procedure cls(const colour: byte);
begin
  { TODO: Provide the VGA colour table }
  SDL_SetRenderDrawColor(sdlRenderer, $64, $95, $ED, SDL_ALPHA_OPAQUE);
  SDL_RenderClear(sdlRenderer);
end;

procedure flush;
begin
  SDL_RenderPresent(sdlRenderer);
end;

procedure print(const text: string; const x, y: integer; const colour: byte);
var
  a, charcode: word;
  srcRect, destRect: TSDL_Rect;
begin
  for a:=1 to length(text) do begin
    charcode := ord(text[a]);

    srcRect.x := (charcode mod 16) * 8;
    srcRect.y := (charcode div 16) * 8;
    srcRect.w := 8;
    srcRect.h := 8;

    destRect.x := x + a * 8;
    destRect.y := y;
    destRect.w := 8;
    destRect.h := 8;

    SDL_RenderCopy(sdlRenderer, font8x8^.texture, @srcRect, @destRect)
  end;
end;

end.

