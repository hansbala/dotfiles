function OpenGithubUrl()
  -- Define the GitHub URL prefix
  local prefix = 'https://github.com/askscio/scio/blob/master/'
  -- Get the current file path
  local cur_file_path = vim.fn.expand('%:p')
  local software_idx = cur_file_path:find('scio/')
  if not software_idx then
    vim.api.nvim_out_write('Current file doesn\'t seem to be in scio software repo. Cannot open in GitHub\n')
    return
  end
  -- Calculate the relative path within the repository
  local software_offset = #('scio/')
  local suffix = cur_file_path:sub(software_idx + software_offset)
  -- Get the start and end line numbers of the current selection
  local start_line = vim.fn.line('v')
  local end_line = vim.fn.line('.')
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  local linenum_str = string.format('#L%d-L%d', start_line, end_line)
  -- Construct the full GitHub URL
  local url = prefix .. suffix .. linenum_str
  -- Open the URL in the default web browser
  vim.fn.system(string.format('open "%s"', url))
end

function OpenPRFromBlame()
  -- Get the current line number
  local line_number = vim.fn.line('.')
  -- Get the full path of the current file
  local file_path = vim.fn.expand('%:p')
  -- Get the commit hash under the cursor
  local commit_hash = vim.fn.system('git blame -L ' .. line_number .. ',' .. line_number .. ' ' .. file_path)
  commit_hash = string.match(commit_hash, '^[^ ]+')
  -- Get the commit message
  local commit_message = vim.fn.system('git log -1 --pretty=%B ' .. commit_hash)
  -- Extract the PR number (assuming it's in the format "(#123)")
  local pr_number = string.match(commit_message, '%(#%d+%)')
  if not pr_number then
    print("No PR number found in commit message")
    return
  end
  -- Extract the number part
  pr_number = string.match(pr_number, '%d+')
  -- Construct the PR URL (replace with your actual repository URL)
  local pr_url = 'https://github.com/askscio/scio/pull/' .. pr_number
  -- Open the PR URL in the default web browser
  vim.fn.system('open ' .. pr_url)
end

-- Opens Github permalink
vim.api.nvim_set_keymap('n', '<leader>b', ':lua OpenGithubUrl()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>b', ':lua OpenGithubUrl()<CR>', { noremap = true, silent = true })
-- Opens PR from current line
vim.api.nvim_set_keymap('n', '<leader>pr', ':lua OpenPRFromBlame()<CR>', { noremap = true, silent = true })
