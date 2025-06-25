unit Events;

interface

uses
  SDL2;

var
  done: boolean;
  sdlEvent: TSDL_Event;

procedure pollEvents;


implementation

procedure pollEvents;
begin
  { updateKeyboard }
  { updateMouse }

  while SDL_PollEvent(@sdlEvent) <> 0 do begin
    if sdlEvent.type_ = SDL_QUITEV then
      done := true;
  end;
end;

end.

