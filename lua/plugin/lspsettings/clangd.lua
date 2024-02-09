--- clangd.lua
return {
    settings = {
        clangd = {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--suggest-missing-includes",
                "--offset-encoding=utf-8",

            },
            filetypes = { "cpp", "hpp" },
            extraArgs = { "-std=c++20" },
        },
    },
}

