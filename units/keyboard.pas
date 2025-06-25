unit Keyboard;

interface

procedure initKeyHandler;
procedure resetKeyHandler;
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
  if not keyboardInitialised then exit;
  isKeyDown := (keys[scancode] = 1)
end;

procedure resetKeyHandler;
begin
  keyboardInitialised := false
end;

end.

