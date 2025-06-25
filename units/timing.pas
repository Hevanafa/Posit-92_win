unit Timing;

interface

uses
  SysUtils;

var
  dt, lastTime, newTime: double; { in seconds }
  { lastTime, newTime: TDateTime; }

procedure Limit(const fps: integer);
procedure initDeltaTime;
procedure updateDeltaTime;


implementation

uses
  SDL2;

function getTimer: double;
begin
  getTimer := frac(Now) * 86400
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

