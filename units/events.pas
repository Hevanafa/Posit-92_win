unit Events;

interface

uses
  SDL2;

var
  done: boolean;
  sdlEvent: TSDL_Event;

procedure pollEvents;


implementation

{ TODO: Abstract the implementations for:
  - Keyboard events
  - Window events
  - Mouse events
}
procedure pollEvents;
begin
  { updateKeyboard }
  { updateMouse }

  while SDL_PollEvent(@sdlEvent) <> 0 do begin
    case sdlEvent.type_ of
    SDL_QUITEV:
      done := true;

    end;
  end;
end;

end.

