return {
  {
    'XiaoConstantine/mongoose.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('mongoose').setup()
      -- Optional: Add local llm for analysis
      require('mongoose').configure_llm {
        provider = {
          api_url = 'http://localhost:11434/api/generate',
          headers = function(_)
            return {
              ['Content-Type'] = 'application/json',
            }
          end,
          format_request = function(prompt)
            -- First, let's ensure our prompt is properly formatted
            if type(prompt) ~= 'string' then
              error 'Prompt must be a string'
            end

            -- Create the request payload
            local request = {
              prompt = prompt,
              model = 'gemma3:12b-it-q4_K_M',
              stream = false,
              -- n_predict = 2048,
              -- temperature = 0.7,
              -- -- Adding some additional parameters that might help with analysis
              -- stop = { "</s>", "\n\nHuman:", "\n\nAssistant:" }, -- Stop sequences to prevent rambling
              -- top_p = 0.9, -- Nucleus sampling parameter
              -- echo = false, -- Don't echo the prompt in the response
            }

            -- Try to encode the request with error handling
            local ok, encoded = pcall(vim.fn.json_encode, request)
            if not ok then
              error('Failed to encode request: ' .. tostring(encoded))
            end

            return encoded
          end,

          parse_response = function(response)
            local ok, decoded = pcall(vim.fn.json_decode, response)
            if not ok then
              error('Failed to decode JSON response: ' .. tostring(decoded))
            end

            -- If your API returns the content in a specific field, extract it
            -- For example, if the response looks like: {"content": "actual content"}
            if decoded.response then
              return decoded.response
            else
              -- If the response is the content directly
              return decoded
            end
          end,
        },
      }

      -- Optional: Add a keymap to show analytics
      vim.keymap.set('n', '<leader>ma', '<cmd>Mongoose<CR>', {
        silent = true,
        desc = 'Show Mongoose Analytics',
      })

      -- Optional: Add keybinding for LLM analysis
      vim.keymap.set('n', '<leader>ml', '<cmd>MongooseLLMAnalyze<cr>', {
        silent = true,
        desc = 'Analyze Vim usage with LLM',
      })
    end,
  },
}
