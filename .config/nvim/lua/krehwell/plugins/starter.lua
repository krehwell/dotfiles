return {
	"echasnovski/mini.starter",
	version = false,
	opts = {
		autoopen = true,

		evaluate_single = true,

		-- Items to be displayed. Should be an array with the following elements:
		-- - Item: table with <action>, <name>, and <section> keys.
		-- - Function: should return one of these three categories.
		-- - Array: elements of these three types (i.e. item, array, function).
		-- If `nil` (default), default items will be used (see |mini.starter|).
		items = nil,

		-- Header to be displayed before items. Converted to single string via
		-- `tostring` (use `\n` to display several lines). If function, it is
		-- evaluated first. If `nil` (default), polite greeting will be used.
		header = nil,

		-- Footer to be displayed after items. Converted to single string via
		-- `tostring` (use `\n` to display several lines). If function, it is
		-- evaluated first. If `nil` (default), default usage help will be shown.
		footer = nil,

		-- Whether to disable showing non-error feedback
		silent = false,
	},
}
