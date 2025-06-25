unit Events;

interface

uses
  SDL2;

var
  done: boolean;
  sdlEvent: TSDL_Event;

procedure pollEvents;


implementation

uses
  Mouse, Keyboard;

{ TODO: Abstract the implementations for:
  - Keyboard events
  - Window events
  - Mouse events
}
procedure pollEvents;
begin
  { updateKeyboard }

  while SDL_PollEvent(@sdlEvent) <> 0 do begin
    case sdlEvent.type_ of
    SDL_QUITEV:
      done := true;

    { updateMouse }
    SDL_MOUSEMOTION: begin
      setMouseX(sdlEvent.motion.x);
      setMouseY(sdlEvent.motion.y);
    end;

    SDL_MOUSEBUTTONDOWN:
      setMouseButton(sdlEvent.button.button);
    SDL_MOUSEBUTTONUP:
      setMouseButton(sdlEvent.button.button);

    end;
  end;
end;

end.

