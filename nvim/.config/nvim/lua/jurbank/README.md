Debug Adapter Protocol developed by Microsofy for VsCode
originially, similar to LSP.

Code editors used to have to communicate with debuggers on more of a
case by case scenario where they had no standardized way of
communicating between the two


DAP uses `Debug Adapters`. This allows debuggers from different languages to
communicate with the Debug Adapter and keep the interface that end usesr see
the same.

A Go debuggers and a C debugger for example would both communicate with the
Debug Adapter and all the end user to have the same experience regardless of
the current language being debugged.


NeoVim can then use the Debug Adapter and display to use a nice debugger


`Nvim-dap` is a DAP debug client for neovim.
