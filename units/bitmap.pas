unit Bitmap;

interface

uses
  SDL2, SDL2_Image;

type
  PImage = ^TImage;
  TImage = record
    width, height: word;
    texture: PSDL_Texture;
  end;

procedure loadImage(var output: PImage; const filename: string);
procedure spr(const image: PImage; const x, y: integer);
procedure freeImage(var image: PImage);


implementation

uses
  SysUtils,
  Renderer;

procedure loadImage(var output: PImage; const filename: string);
begin
  if output = nil then
    getMem(output, sizeof(TImage));

  output^.texture := IMG_LoadTexture(sdlRenderer, PChar(filename));
  if output^.texture = nil then begin
    { TODO: Implement the Panic unit }
    writeLn(format('loadImage: Error when loading %s', [filename]));
    exit
  end;

  SDL_QueryTexture(output^.texture, nil, nil, @output^.width, @output^.height);

  writeLn(format('Loaded "%s"', [filename]))
end;

procedure spr(const image: PImage; const x, y: integer);
var
  dstRect: TSDL_Rect;
begin
  if image = nil then exit;

  dstRect.x := x;
  dstRect.y := y;
  dstRect.w := image^.width;
  dstRect.h := image^.height;

  SDL_RenderCopy(sdlRenderer, image^.texture, nil, @dstRect);
end;

procedure freeImage(var image: PImage);
begin
  if image = nil then exit;

  SDL_DestroyTexture(image^.texture);
  freeMem(image, sizeof(TImage));
  image := nil
end;

end.

