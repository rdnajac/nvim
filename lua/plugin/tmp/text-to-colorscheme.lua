local M = {
  "svermeulen/text-to-colorscheme",
}

function M.config()
  -- Set up 'text-to-colorscheme' with OpenAI API key
  require('text-to-colorscheme').setup {
    ai = {
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      --gpt_model = "gpt-3.5-turbo-0613",
      gpt_model = "gpt-4-1106-preview",
    },
    --print(os.getenv("OPENAI_API_KEY"))
  }
end

return M
