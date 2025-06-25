unit Conv;

interface

function f32str(const value: double): string;


implementation

uses
  SysUtils;

function f32str(const value: double): string;
begin
  f32str := format('%.4f', [value])
end;

end.

