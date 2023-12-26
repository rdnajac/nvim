return {
  settings = {
    clangd = {
        cmd = { "clangd",
                "--background-index",
                "--clang-tidy",
                "--suggest-missing-includes",
                "--offset-encoding=utf-16",

            },
            filetypes = { "cpp", "hpp" },
            extraArgs = { "-std=c++20" },
        },
    },
}

