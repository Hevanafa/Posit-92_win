unit Timing;

interface

var
  dt, lastTime, newTime: double; { in seconds }

procedure Limit(const fps: integer);
procedure initDeltaTime;
procedure updateDeltaTime;


implementation

uses
  SDL2,
  SysUtils, DateUtils;

function getTimer: double;
begin
  getTimer := Now
end;

{ Similar to QB64's _LIMIT }
procedure Limit(const fps: integer);
begin
  SDL_Delay(1000 div fps)
end;

procedure initDeltaTime;
begin
  dt := 0;
  lastTime := getTimer;
  newTime := lastTime;
end;

procedure updateDeltaTime;
begin
  newTime := getTimer;
  if newTime - lastTime > 0.0 then begin
    dt := newTime - lastTime;
    lastTime := newTime;
  end;
end;

end.

