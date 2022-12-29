local present, todo_comments = pcall(require, "todo-comments")
if not present then
  return
end

todo_comments.setup({
  signs = false,
  highlight = {
    multiline = false, -- enable multine todo comments
  },
})
