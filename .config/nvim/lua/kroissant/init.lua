local variants = require("kroissant.colors")
local cfg = require("kroissant.config").config
local c = variants[cfg.variant]
local utils = require("kroissant.utils")
local M = {}

local set_terminal_colors = function()
  vim.g.terminal_color_0 = c.black
  vim.g.terminal_color_1 = c.red
  vim.g.terminal_color_2 = c.green
  vim.g.terminal_color_3 = c.yellow
  vim.g.terminal_color_4 = c.blue
  vim.g.terminal_color_5 = c.magenta
  vim.g.terminal_color_6 = c.cyan
  vim.g.terminal_color_7 = c.white
  vim.g.terminal_color_8 = c.bright_black
  vim.g.terminal_color_9 = c.bright_red
  vim.g.terminal_color_10 = c.bright_green
  vim.g.terminal_color_11 = c.bright_yellow
  vim.g.terminal_color_12 = c.bright_blue
  vim.g.terminal_color_13 = c.bright_magenta
  vim.g.terminal_color_14 = c.bright_cyan
  vim.g.terminal_color_15 = c.bright_white
  vim.g.terminal_color_background = c.bg
  vim.g.terminal_color_foreground = c.fg
end

local set_groups = function()
  local groups = {
    -- Base
    -- Editor highlight groups
    Normal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg },   -- normal text and background color
    NormalNC = { fg = c.fg, bg = cfg.transparent and c.none or c.bg }, -- normal text in non-current windows
    SignColumn = { fg = c.fg, bg = cfg.transparent and c.none or c.bg }, -- column where signs are displayed
    EndOfBuffer = { fg = c.gray03 },                                   -- ~ lines at the end of a buffer
    NormalFloat = { fg = c.fg, bg = c.gray02 },                        -- normal text and background color for floating windows
    FloatBorder = { fg = c.blue, bg = c.gray02 },
    ColorColumn = { fg = c.none, bg = c.gray01 },                      --  used for the columns set with 'colorcolumn'
    Conceal = { fg = c.gray05 },                                       -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.cyan, bg = c.none, reverse = true },             -- the character under the cursor
    CursorIM = { fg = c.cyan, bg = c.none, reverse = true },           -- like Cursor, but used when in IME mode
    Directory = { fg = c.blue, bg = c.none, bold = true },             -- directory names (and other special names in listings)
    DiffAdd = { fg = c.bright_green, bg = c.none, reverse = true },    -- diff mode: Added line
    DiffChange = { fg = c.bright_blue, bg = c.none, reverse = true },  --  diff mode: Changed line
    DiffDelete = { fg = c.bright_red, bg = c.none, reverse = true },   -- diff mode: Deleted line
    DiffText = { fg = c.fg, bg = c.none, reverse = true },             -- diff mode: Changed text within a changed line
    ErrorMsg = { fg = c.red },                                         -- error messages
    Folded = { fg = c.gray05, bg = c.none, italic = true },
    FoldColumn = { fg = c.blue },
    IncSearch = { reverse = true },
    LineNr = { fg = c.gray05 },
    CursorLineNr = { fg = c.gray07 },
    MatchParen = { fg = c.yellow, bold = true },
    ModeMsg = { fg = c.cyan, bold = true },
    MoreMsg = { fg = c.cyan, bold = true },
    NonText = { fg = c.gray03 },
    Pmenu = { fg = c.gray07, bg = c.gray02 },
    PmenuSel = { fg = c.bg, bg = c.gray06 },
    PmenuSbar = { fg = c.fg, bg = c.gray02 },
    PmenuThumb = { fg = c.fg, bg = c.gray05 },
    Question = { fg = c.green, bold = true },
    QuickFixLine = { fg = c.blue, bg = c.gray01, bold = true, italic = true },
    qfLineNr = { fg = c.blue, bg = c.gray01 },
    Search = { reverse = true },
    SpecialKey = { fg = c.gray03 },
    SpellBad = { fg = c.red, bg = c.none, italic = true, undercurl = true },
    SpellCap = { fg = c.blue, bg = c.none, italic = true, undercurl = true },
    SpellLocal = { fg = c.cyan, bg = c.none, italic = true, undercurl = true },
    SpellRare = { fg = c.cyan, bg = c.none, italic = true, undercurl = true },
    StatusLine = { fg = c.gray07, bg = c.gray01 },
    StatusLineNC = { fg = c.gray06, bg = c.gray01 },
    StatusLineTerm = { fg = c.gray07, bg = c.gray01 },
    StatusLineTermNC = { fg = c.gray07, bg = c.gray01 },
    TabLineFill = { fg = c.gray05, bg = c.gray01 },
    TablineSel = { fg = c.bg, bg = c.gray07 },
    Tabline = { fg = c.gray05 },
    Title = { fg = c.cyan, bg = c.none, bold = true },
    Visual = { fg = c.none, bg = "#403d52" },
    VisualNOS = { fg = c.none, bg = c.gray03 },
    WarningMsg = { fg = c.yellow, bold = true },
    WildMenu = { fg = c.bg, bg = c.blue, bold = true },
    CursorColumn = { fg = c.none, bg = c.gray02 },
    CursorLine = { fg = c.none, bg = c.gray01 },
    ToolbarLine = { fg = c.fg, bg = c.gray01 },
    ToolbarButton = { fg = c.fg, bg = c.none, bold = true },
    NormalMode = { fg = c.cyan, bg = c.none, reverse = true },
    InsertMode = { fg = c.green, bg = c.none, reverse = true },
    VisualMode = { fg = c.cyan, bg = c.none, reverse = true },
    VertSplit = { fg = c.gray06 },
    CommandMode = { fg = c.gray05, bg = c.none, reverse = true },
    Warnings = { fg = c.yellow },
    healthError = { fg = c.red },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.yellow },
    --common
    Comment = { fg = c.gray05, bg = c.none, bold = cfg.comment_style.bold, italic = cfg.comment_style.italic }, -- italic comments
    SpecialComment = { fg = c.blue },                                                                         -- special things inside a comment
    Type = { fg = c.fg },                                                                                     -- int, long, char, etc.
    StorageClass = { fg = c.fg },                                                                             -- static, register, volatile, etc.
    Structure = { fg = c.fg },                                                                                -- struct, union, enum, etc.
    Constant = { fg = c.fg },                                                                                 -- any constant
    Conditional = { fg = c.fg, bg = c.none, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- italic if, then, else, endif, switch, etc.
    Keyword = { fg = c.fg, bg = c.none, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic },   -- italic for, do, while, etc.
    Repeat = { fg = c.fg, bg = c.none, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic },    -- italic any other keyword
    Boolean = { fg = c.fg, bg = c.none, bold = cfg.boolean_style.bold, italic = cfg.boolean_style.italic },   -- true , false
    Function = { fg = c.fg, bg = c.none, bold = cfg.function_style.bold, italic = cfg.function_style.italic },
    Identifier = { fg = c.fg, bg = c.none },                                                                  -- any variable name
    String = { fg = c.fg, bg = c.none },                                                                      -- Any string
    Character = { fg = c.fg },                                                                                -- any character constant: 'c', '\n'
    Number = { fg = c.fg },                                                                                   -- a number constant: 5
    Float = { fg = c.fg },                                                                                    -- a floating point constant: 2.3e10
    Statement = { fg = c.fg },                                                                                -- any statement
    Label = { fg = c.fg },                                                                                    -- case, default, etc.
    Operator = { fg = c.fg },                                                                                 -- sizeof", "+", "*", etc.
    Exception = { fg = c.fg },                                                                                -- try, catch, throw
    PreProc = { fg = c.fg },                                                                                  -- generic Preprocessor
    Include = { fg = c.fg },                                                                                  -- preprocessor #include
    Define = { fg = c.fg },                                                                                   -- preprocessor #define
    Macro = { fg = c.fg },                                                                                    -- same as Define
    Typedef = { fg = c.fg },                                                                                  -- A typedef
    PreCondit = { fg = c.fg },                                                                                -- preprocessor #if, #else, #endif, etc.
    Special = { fg = c.fg, bg = c.none, italic = true },                                                      -- any special symbol
    SpecialChar = { fg = c.fg },                                                                              -- special character in a constant
    Tag = { fg = c.fg },                                                                                      -- you can use CTRL-] on this
    Delimiter = { fg = c.fg },                                                                                -- character that needs attention like , or .
    Debug = { fg = c.fg },                                                                                    -- debugging statements
    Underlined = { fg = c.fg, bg = c.none, underline = true },                                                -- text that stands out, HTML links
    Ignore = { fg = c.fg },                                                                                   -- left blank, hidden
    Error = { fg = c.fg, bg = c.none, bold = true, underline = true },                                        -- any erroneous construct
    Todo = { fg = c.fg, bg = c.none, bold = true, italic = true },                                            -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- HTML
    htmlArg = { fg = c.fg, italic = true },
    htmlBold = { fg = c.fg, bg = c.none, bold = true },
    htmlEndTag = { fg = c.fg },
    htmlStyle = { fg = c.fg, bg = c.none, italic = true },
    htmlLink = { fg = c.fg, underline = true },
    htmlSpecialChar = { fg = c.fg },
    htmlSpecialTagName = { fg = c.fg, bold = true },
    htmlTag = { fg = c.fg },
    htmlTagN = { fg = c.fg },
    htmlTagName = { fg = c.fg },
    htmlTitle = { fg = c.fg },
    htmlH1 = { fg = c.fg, bold = true },
    htmlH2 = { fg = c.fg, bold = true },
    htmlH3 = { fg = c.fg, bold = true },
    htmlH4 = { fg = c.fg, bold = true },
    htmlH5 = { fg = c.fg, bold = true },
    -- Markdown
    markdownH1 = { fg = c.bright_white, bold = true },
    markdownH2 = { fg = c.bright_white, bold = true },
    markdownH3 = { fg = c.bright_white, bold = true },
    markdownH4 = { fg = c.bright_white, bold = true },
    markdownH5 = { fg = c.bright_white, bold = true },
    markdownH6 = { fg = c.bright_white, bold = true },
    markdownHeadingDelimiter = { fg = c.gray05 },
    markdownHeadingRule = { fg = c.gray05 },
    markdownId = { fg = c.cyan },
    markdownIdDeclaration = { fg = c.blue },
    markdownIdDelimiter = { fg = c.cyan },
    markdownLinkDelimiter = { fg = c.gray05 },
    markdownLinkText = { fg = c.bright_white, italic = true },
    markdownListMarker = { fg = c.yellow },
    markdownOrderedListMarker = { fg = c.yellow },
    markdownRule = { fg = c.gray05 },
    markdownUrl = { fg = c.gray06, bg = c.none },
    markdownBlockquote = { fg = c.gray07 },
    markdownBold = { fg = c.fg, bg = c.none, bold = true },
    markdownItalic = { fg = c.fg, bg = c.none, italic = true },
    markdownCode = { fg = c.fg, bg = c.gray02 },
    markdownCodeBlock = { fg = c.fg, bg = c.gray02 },
    markdownCodeDelimiter = { fg = c.fg, bg = c.gray02 },
    -- Dashboard
    DashboardShortCut = { fg = c.red },
    DashboardHeader = { fg = c.magenta },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.green, italic = true },
    -- TreeSitter highlight groups
    TSComment = { fg = c.gray05, bg = c.none, bold = cfg.comment_style.bold, italic = cfg.comment_style.italic }, -- For comment blocks.
    TSAnnotation = { fg = c.fg },                                                                               -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute = { fg = c.fg },                                                                                -- (unstable) TODO: docs
    TSBoolean = { fg = c.fg, bg = c.none, bold = cfg.boolean_style.bold, italic = cfg.boolean_style.italic },   -- true or false
    TSCharacter = { fg = c.fg },                                                                                -- For characters.
    TSConditional = { fg = c.fg, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic },            -- For keywords related to conditionnals.
    TSConstant = { fg = c.fg },                                                                                 -- For constants
    TSConstBuiltin = { fg = c.fg, italic = true },                                                              -- For constants that are built in the language: `nil` in Lua.
    TSConstMacro = { fg = c.fg },                                                                               -- For constants that are defined by macros: `NULL` in C.
    TSConstructor = { fg = c.fg },                                                                              -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSError = { fg = c.fg },                                                                                    -- For syntax/parser errors.
    TSException = { fg = c.fg },                                                                                -- For exception related keywords.
    TSField = { fg = c.fg },                                                                                    -- For fields.
    TSFloat = { fg = c.fg },                                                                                    -- For floats.
    TSFunction = { fg = c.fg, bold = cfg.function_style.bold, italic = cfg.function_style.italic },             -- For fuction (calls and definitions).
    TSFuncBuiltin = { fg = c.fg, bold = cfg.function_style.bold, italic = cfg.function_style.italic },          -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro = { fg = c.fg },                                                                                -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = { fg = c.fg, italic = true },                                                                   -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { fg = c.fg, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic },                -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = c.fg, bold = cfg.function_style.bold, italic = cfg.function_style.italic },      -- For keywords used to define a fuction.
    TSKeywordOperator = { fg = c.fg },                                                                          -- For operators that are English words, e.g. `and`, `as`, `or`.
    TSKeywordReturn = { fg = c.fg, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic },          -- For the `return` and `yield` keywords.
    TSLabel = { fg = c.fg },                                                                                    -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod = { fg = c.fg, bold = cfg.function_style.bold, italic = cfg.function_style.italic },               -- For method calls and definitions.
    TSNamespace = { fg = c.fg },                                                                                -- For identifiers referring to modules and namespaces.
    -- TSNone = {}, -- No highlighting. Don't change the values of this highlight group.
    TSNumber = { fg = c.fg },                                                                                   -- For all numbers
    TSOperator = { fg = c.fg },                                                                                 -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.fg },                                                                                -- For parameters of a function.
    TSParameterReference = { fg = c.fg },                                                                       -- For references to parameters of a function.
    TSProperty = { fg = c.fg },                                                                                 -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.fg },                                                                           -- For delimiters ie: `.`
    TSPunctBracket = { fg = c.fg },                                                                             -- For brackets and parens.
    TSPunctSpecial = { fg = c.fg },                                                                             -- For special punctutation that does not fall in the catagories before.
    TSRepeat = { fg = c.fg, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic },                 -- For keywords related to loops.
    TSString = { fg = c.fg },                                                                                   -- For strings.
    TSStringRegex = { fg = c.fg },                                                                              -- For regexes.
    TSStringEscape = { fg = c.fg },                                                                             -- For escape characters within a string.
    TSStringSpecial = { fg = c.fg },                                                                            -- For strings with special meaning that don't fit into the above categories.
    TSSymbol = { fg = c.fg },                                                                                   -- For identifiers referring to symbols or atoms.
    TSTag = { fg = c.fg },                                                                                      -- Tags like html tag names.
    TSTagAttribute = { fg = c.fg, italic = true },                                                              -- For html tag attributes.
    TSTagDelimiter = { fg = c.fg },                                                                             -- Tag delimiter like `<` `>` `/`
    TSText = { fg = c.fg },                                                                                     -- For strings considered text in a markup language.
    TSStrong = { fg = c.fg, bold = true },                                                                      -- For text to be represented in bold.
    TSEmphasis = { fg = c.fg, bold = true, italic = true },                                                     -- For text to be represented with emphasis.
    TSUnderline = { fg = c.fg, bg = c.none, underline = true },                                                 -- For text to be represented with an underline.
    TSStrike = {},                                                                                              -- For strikethrough text.
    TSTitle = { fg = c.fg, bg = c.none, bold = true },                                                          -- Text that is part of a title.
    TSLiteral = { fg = c.fg },                                                                                  -- Literal text.
    TSURI = { fg = c.fg },                                                                                      -- Any URL like a link or email.
    TSMath = { fg = c.fg },                                                                                     -- For LaTeX-like math environments.
    TSTextReference = { fg = c.fg },                                                                            -- For footnotes, text references, citations.
    TSEnvironment = { fg = c.fg },                                                                              -- For text environments of markup languages.
    TSEnvironmentName = { fg = c.fg },                                                                          -- For the name/the string indicating the type of text environment.
    TSNote = { fg = c.fg, italic = true },                                                                      -- Text representation of an informational note.
    TSWarning = { fg = c.fg, italic = true },                                                                   -- Text representation of a warning note.
    TSDanger = { fg = c.fg, italic = true },                                                                    -- Text representation of a danger note.
    TSType = { fg = c.fg },                                                                                     -- For types.
    TSTypeBuiltin = { fg = c.fg },                                                                              -- For builtin types.
    TSVariable = { fg = c.fg, bold = cfg.variable_style.bold, italic = cfg.variable_style.italic },             -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.fg, bold = cfg.variable_style.bold, italic = cfg.variable_style.italic },      -- Variable names that are defined by the languages, like `this` or `self`.
    -- highlight groups for the native LSP client
    LspReferenceText = { fg = c.bg, bg = c.magenta },                                                           -- used for highlighting "text" references
    LspReferenceRead = { fg = c.bg, bg = c.magenta },                                                           -- used for highlighting "read" references
    LspReferenceWrite = { fg = c.bg, bg = c.magenta },                                                          -- used for highlighting "write" references
    -- Diagnostics
    DiagnosticError = { fg = c.red },                                                                           -- base highlight group for "Error"
    DiagnosticWarn = { fg = c.yellow },                                                                         -- base highlight group for "Warning"
    DiagnosticInfo = { fg = c.blue },                                                                           -- base highlight group from "Information"
    DiagnosticHint = { fg = c.cyan },                                                                           -- base highlight group for "Hint"
    DiagnosticUnderlineError = { fg = c.red, undercurl = true, sp = c.red },                                    -- used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn = { fg = c.yellow, undercurl = true, sp = c.yellow },                               -- used to underline "Warning" diagnostics.
    DiagnosticUnderlineInfo = { fg = c.blue, undercurl = true, sp = c.blue },                                   -- used to underline "Information" diagnostics.
    DiagnosticUnderlineHint = { fg = c.cyan, undercurl = true, sp = c.cyan },                                   -- used to underline "Hint" diagnostics.
    -- Diagnostics (old)
    LspDiagnosticsDefaultError = { fg = c.red },                                                                -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError = { fg = c.red },                                                                   -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError = { fg = c.red, bold = true },                                                  -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError = { fg = c.red, bold = true },                                               -- Virtual text "Error"
    LspDiagnosticsUnderlineError = { fg = c.red, undercurl = true, sp = c.red },                                -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning = { fg = c.yellow },                                                           -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning = { fg = c.yellow },                                                              -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning = { fg = c.yellow, bold = true },                                             -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning = { fg = c.yellow, bold = true },                                          -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning = { fg = c.yellow, undercurl = true, sp = c.yellow },                        -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation = { fg = c.blue },                                                         -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation = { fg = c.blue },                                                            -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation = { fg = c.blue, bold = true },                                           -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = c.blue, bold = true },                                        -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation = { fg = c.blue, undercurl = true, sp = c.blue },                        -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint = { fg = c.cyan },                                                                -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint = { fg = c.cyan },                                                                   -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint = { fg = c.cyan, bold = true },                                                  -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint = { fg = c.cyan, bold = true },                                               -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint = { fg = c.cyan, undercurl = true, sp = c.cyan },                               -- used to underline "Hint" diagnostics.
    -- Plugins highlight groups
    -- LspTrouble
    LspTroubleText = { fg = c.gray04 },
    LspTroubleCount = { fg = c.magenta, bg = c.gray03 },
    LspTroubleNormal = { fg = c.fg, bg = c.bg },
    -- Diff
    diffAdded = { fg = c.bright_green },
    diffRemoved = { fg = c.bright_red },
    diffChanged = { fg = c.bright_blue },
    diffOldFile = { fg = c.gray04 },
    diffNewFile = { fg = c.fg },
    diffFile = { fg = c.gray05 },
    diffLine = { fg = c.cyan },
    diffIndexLine = { fg = c.magenta },
    -- GitSigns
    GitSignsAdd = { fg = c.bright_green },     -- diff mode: Added line |diff.txt|
    GitSignsAddNr = { fg = c.bright_green },   -- diff mode: Added line |diff.txt|
    GitSignsAddLn = { fg = c.bright_green },   -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.bright_yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = { fg = c.bright_yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = { fg = c.bright_yellow }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.bright_red },    -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = { fg = c.bright_red },  -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = { fg = c.bright_red },  -- diff mode: Deleted line |diff.txt|
    -- Telescope
    TelescopeSelectionCaret = { fg = c.blue, bg = c.gray01 },
    TelescopeBorder = { fg = c.gray05 },
    TelescopePromptBorder = { fg = c.blue },
    TelescopeResultsBorder = { fg = c.gray07 },
    TelescopePreviewBorder = { fg = c.gray05 },
    TelescopeMatching = { fg = c.yellow },
    TelescopePromptPrefix = { fg = c.blue },
    -- NvimTree
    NvimTreeRootFolder = { fg = c.cyan, italic = true },
    NvimTreeNormal = { fg = c.fg, bg = cfg.transparent and c.none or c.bg },
    NvimTreeImageFile = { fg = c.magenta },
    NvimTreeExecFile = { fg = c.green },
    NvimTreeSpecialFile = { fg = c.magenta },
    NvimTreeFolderName = { fg = c.blue },
    NvimTreeOpenedFolderName = { fg = c.bright_blue },
    NvimTreeOpenedFile = { fg = c.bright_blue },
    NvimTreeEmptyFolderName = { fg = c.gray05 },
    NvimTreeFolderIcon = { fg = c.gray07 },
    NvimTreeIndentMarker = { fg = c.gray03 },
    NvimTreeGitDirty = { fg = c.gray07 },
    NvimTreeGitStaged = { fg = c.cyan },
    NvimTreeGitRenamed = { fg = c.yellow },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    -- Fern
    FernBranchSymbol = { fg = c.blue },
    FernBranchText = { fg = c.blue },
    -- Ale-vim
    ALEError = { fg = c.red },
    ALEWarning = { fg = c.yellow },
    ALEInfo = { fg = c.blue },
    ALEErrorSign = { fg = c.red },
    ALEWarningSign = { fg = c.yellow },
    ALEInfoSign = { fg = c.blue },
    ALEVirtualTextError = { fg = c.red },
    ALEVirtualTextWarning = { fg = c.yellow },
    ALEVirtualTextInfo = { fg = c.blue },
    -- WhichKey
    WhichKey = { fg = c.bright_cyan },
    WhichKeyGroup = { fg = c.yellow, italic = true },
    WhichKeyDesc = { fg = c.blue },
    WhichKeySeperator = { fg = c.gray05 },
    WhichKeyFloating = { bg = c.gray01 },
    WhichKeyFloat = { bg = c.gray01 },
    -- LspSaga
    LspSagaFinderSelection = { fg = c.magenta },
    LspSagaLspFinderBorder = { fg = c.gray05 },
    LspFloatWinNormal = { bg = c.bg },
    LspFloatWinBorder = { fg = c.gray05 },
    LspSagaBorderTitle = { fg = c.gray07 },
    TargetWord = { fg = c.cyan },
    ReferencesCount = { fg = c.gray07 },
    DefinitionCount = { fg = c.gray07 },
    TargetFileName = { fg = c.bright_blue },
    DefinitionIcon = { fg = c.gray07 },
    ReferencesIcon = { fg = c.gray07 },
    ProviderTruncateLine = { fg = c.gray05 },
    SagaShadow = { fg = c.gray05 },
    DiagnosticTruncateLine = { fg = c.gray05 },
    DiagnosticWarning = { fg = c.yellow },
    DiagnosticInformation = { fg = c.blue },
    DefinitionPreviewTitle = { fg = c.gray07 },
    LspSagaShTruncateLine = { fg = c.gray05 },
    LspSagaDocTruncateLine = { fg = c.gray05 },
    LspSagaCodeActionTitle = { fg = c.gray07 },
    LspSagaCodeActionTruncateLine = { fg = c.gray05 },
    LspSagaCodeActionContent = { fg = c.magenta },
    LspSagaRenamePromptPrefix = { fg = c.green },
    LspSagaRenameBorder = { fg = c.gray05 },
    LspSagaHoverBorder = { fg = c.gray05 },
    LspSagaSignatureHelpBorder = { fg = c.gray05 },
    LspSagaCodeActionBorder = { fg = c.gray05 },
    LspSagaAutoPreview = { fg = c.gray07 },
    LspSagaDefPreviewBorder = { fg = c.gray05 },
    LspLinesDiagBorder = { fg = c.gray05 },
    LspSagaLightBulb = { fg = c.gray07 },
    LspSagaLightBulbSign = { fg = c.gray07 },
    LspSagaDiagnosticBorder = { fg = c.gray05 },
    LspSagaDiagnosticHeader = { fg = c.gray07 },
    LspSagaDiagnosticTruncateLine = { fg = c.gray05 },
    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.green },
    BufferLineFill = { bg = c.gray03 },
    -- Sneak
    Sneak = { fg = c.bg, bg = c.green },
    SneakScope = { bg = c.gray04 },
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.gray03 },
    IndentBlanklineContextChar = { fg = c.gray05 },
    -- nvim-cmp
    CmpItemAbbrDeprecated = { fg = c.gray05, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.yellow },
    CmpItemAbbrMatchFuzzy = { fg = c.yellow },
    CmpItemKindVariable = { fg = c.blue },
    CmpItemKindInterface = { fg = c.blue },
    CmpItemKindText = { fg = c.blue },
    CmpItemKindFunction = { fg = c.magenta },
    CmpItemKindMethod = { fg = c.magenta },
    CmpItemKindKeyword = { fg = c.fg },
    CmpItemKindProperty = { fg = c.fg },
    CmpItemKindUnit = { fg = c.fg },
    -- Custom highlight groups for use in statusline plugins
    StatusLineNormalMode = { fg = c.black, bg = c.gray02 },
    StatusLineInsertMode = { fg = c.black, bg = c.gray03 },
    StatusLineVisualMode = { fg = c.black, bg = c.gray04 },
    StatusLineReplaceMode = { fg = c.black, bg = c.gray05 },
    StatusLineTerminalMode = { fg = c.black, bg = c.gray05 },
    StatusLineHint = { fg = c.cyan, bg = c.gray01 },
    StatusLineInfo = { fg = c.blue, bg = c.gray01 },
    StatusLineWarn = { fg = c.yellow, bg = c.gray01 },
    StatusLineError = { fg = c.red, bg = c.gray01 },
    -- Hydra
    HydraRed = { fg = c.red },
    HydraBlue = { fg = c.blue },
    HydraAmaranth = { fg = c.bright_red },
    HydraTeal = { fg = c.cyan },
    HydraPink = { fg = c.magenta },
    HydraHint = { fg = c.fg, bg = c.gray02 },
    -- JSON
    jsonNumber = { fg = c.yellow },
    jsonNull = { fg = c.bright_black },
    jsonString = { fg = c.green },
    jsonKeyword = { fg = c.blue },
  }

  for group, parameters in pairs(groups) do
    utils.highlight(group, parameters)
  end
end

M.colorscheme = function()
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "kroissant"

  set_terminal_colors()
  set_groups()
end

return M
