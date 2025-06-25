unit Conv;

interface

function i32str(const value: longint): string;
function f32str(const value: double): string;
function i16HexStr(const value: word): string;
function i8HexStr(const value: byte): string;
function boolStr(const value: boolean): string;
function parseInt(const text: string): integer;


implementation

uses
  SysUtils;

function i32str(const value: longint): string;
begin
  i32str := format('%d', [value])
end;

function f32str(const value: double): string;
begin
  f32str := format('%.4f', [value])
end;

function i16HexStr(const value: word): string;
const
  digits: array[0..15] of char = '0123456789ABCDEF';
var
  a: byte;
begin
  i16HexStr := '';
  for a := 3 downto 0 do
    i16HexStr := i16HexStr + digits[(value shr (a * 4)) and $F];
end;

function i8HexStr(const value: byte): string;
const
  digits: array[0..15] of char = '0123456789ABCDEF';
begin
  i8HexStr := digits[(value shr 4) and $F] + digits[value and $F];
end;

function boolStr(const value: boolean): string;
begin
  if value then
    boolStr := 'true'
  else
    boolStr := 'false'
end;

function parseInt(const text: string): integer;
var
  result_, parseResult: integer;
begin
  val(text, result_, parseResult);
  if parseResult <> 0 then begin
    writeLn('Error parsing to integer:', text);
    parseInt := 0
  end else
    parseInt := result_;
end;

end.

