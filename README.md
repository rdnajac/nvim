# nvim config

## Installation

Build from source:

```sh
git clone https://github.com/neovim/neovim.git
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
```

## TODO

- don't do diagnostics on help markdown files

blink:

- make sure we trigger path completion on 'a'
- no snippets in autocomplete
- prioritize path over copilot complete

## Resources

- [Neovim](https://neovim.io/)
- [`lazy.nvim` plugin manager](https://lazy.folke.io/)
- [LazyVim starter](https://www.lazyvim.org/)
- [`lsp-zero`](https://lsp-zero.netlify.app/docs/)

## `checkhealth`

### perl

```console
cpan install Neovim::Ext
```

---

> The computing scientist's main challenge is not to get confused
> by the complexities of his own making.

-- _Edsger W. Dijkstra_
