unit Timing;

interface

var
  dt, lastTime, newTime: double; { in seconds }

procedure initDeltaTime;
procedure updateDeltaTime;


implementation

uses
  SysUtils, DateUtils;

function getTimer: double;
begin
  getTimer := Now
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

