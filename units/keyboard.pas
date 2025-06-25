unit Keyboard;

interface

procedure initKeyHandler;
function isKeyDown(const scancode: word): boolean;


implementation

uses
  SDL2,
  Events;

var
  keys: PUInt8;
  keyboardInitialised: boolean;

procedure initKeyHandler;
begin
  keys := SDL_GetKeyboardState(nil);
  keyboardInitialised := true;
end;

function isKeyDown(const scancode: word): boolean;
begin
  isKeyDown := (keys[scancode] = 1)
end;

end.

