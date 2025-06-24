unit Bitmap;

interface

uses
  SDL2, SDL2_Image,
  VGA;

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
  SDL_QueryTexture(output^.texture, nil, nil, output^.width, output^.height);
end;

{ procedure spr(const image: PImage; const x, y: integer);
procedure freeImage(var image: PImage);
}


end.

