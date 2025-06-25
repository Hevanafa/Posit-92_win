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

procedure loadImage(var output: PImage; const filename: string);
begin
  if output = nil then
    getMem(output, sizeof(TImage));

  output^.texture := IMG_LoadTexture(renderer, PChar(filename));
  SDL_QueryTexture(output^.texture, nil, nil, @output^.width, @output^.height);
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

  SDL_RenderCopy(renderer, image^.texture, nil, @dstRect);
end;

procedure freeImage(var image: PImage);
begin
  if image = nil then exit;

  SDL_DestroyTexture(image^.texture);
  freeMem(image, sizeof(TImage));
  image := nil
end;

end.

