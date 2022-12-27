local present, todo_comments = pcall(require, "todo-comments")
if present then
  return
end

todo_comments.config({
  signs = false,
  highlight = {
    multiline = false, -- enable multine todo comments
  },
})
