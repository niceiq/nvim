local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

-- For better JSX comments, we use ts-context-commentstring
local context_status_ok, context = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not context_status_ok then
  return
end

comment.setup {
    pre_hook = context.create_pre_hook(),
}
