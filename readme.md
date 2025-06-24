Posit-92 Windows port

More or less the behaviour is the same, but with some quirks

- Procedures prefixed with `asm` aren't prefixed: e.g. `asmPset` becomes `pset`, `asmPrint` becomes `print`
- Key scancodes follow the scancodes of SDL2


## Getting started

1. Get a copy of SDL unit files from (TODO: insert the link | here),
2. Copy the original SDL2 DLL files into your `Windows\System32` folder,
3. Make sure Lazarus IDE is installed,
4. Open `project.lpi`

Everything should compile (<kbd>Ctrl+F9</kbd>) out of the box

