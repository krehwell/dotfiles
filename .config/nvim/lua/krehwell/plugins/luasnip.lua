return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node

		-- Load friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Add custom snippets
		ls.add_snippets("javascriptreact", {
			s("mb-", { t('marginBottom: "'), i(1), t('",') }),
			s("mt-", { t('marginTop: "'), i(1), t('",') }),
			s("ml-", { t('marginLeft: "'), i(1), t('",') }),
			s("mr-", { t('marginRight: "'), i(1), t('",') }),
			s("pb-", { t('paddingBottom: "'), i(1), t('",') }),
			s("pt-", { t('paddingTop: "'), i(1), t('",') }),
			s("pl-", { t('paddingLeft: "'), i(1), t('",') }),
			s("pr-", { t('paddingRight: "'), i(1), t('",') }),
			s("bg-", { t('backgroundColor: "'), i(1), t('",') }),
			s("fw-", { t('fontWeight: "'), i(1), t('",') }),
			s("fs-", { t('fontSize: "'), i(1), t('",') }),
			s("br-", { t('borderRadius: "'), i(1), t('",') }),
			s("mi-", { t('marginInline: "'), i(1), t('",') }),
			s("ma-", { t('margin: "'), i(1), t('"') }),
			s("mbl-", { t('marginBlock: "'), i(1), t('",') }),
			s("pi-", { t('paddingInline: "'), i(1), t('",') }),
			s("pa-", { t('padding: "'), i(1), t('",') }),
			s("pbl-", { t('paddingBlock: "'), i(1), t('",') }),
			s("dis-", { t('display: "'), i(1), t('",') }),
			s("wi-", { t('width: "'), i(1), t('",') }),
			s("he-", { t('height: "'), i(1), t('",') }),

			s("dymport", {
				t({ "import dynamic from 'next/dynamic'", "", "" }),
				t("const "),
				f(function(args)
					local path = args[1][1]
					local name = path:match("([^/]+)$") or "Component"
					return name:gsub("^%l", string.upper)
				end, { 1 }),
				t(" = dynamic(() => import('"),
				i(1, "./path/to/component"),
				t("'))"),
			}),

			s("<nextimg", {
				t("<Image "),
				t("src={`${ASSETS_URL}/images/"),
				i(1, "icon"),
				t(".svg`} "),
				t('width="'),
				i(2, "150"),
				t('" height="'),
				i(3, "15"),
				t('" alt="'),
				f(function(args)
					return args[1][1] .. "-icon"
				end, { 1 }),
				t('" '),
				t('style={{ objectFit: "contain" }}'),
				t("/>"),
			}),

			s("dymportnamed", {
				t({ "import dynamic from 'next/dynamic'", "", "" }),
				t("const "),
				f(function(args)
					local path = args[1][1]
					local name = path:match("([^/]+)$") or "Component"
					return name:gsub("^%l", string.upper)
				end, { 1 }),
				t(' = dynamic(() => import("'),
				i(1, "./path/to/component"),
				t("').then((mod) => mod."),
				f(function(args)
					local path = args[1][1]
					local name = path:match("([^/]+)$") or "Component"
					return name:gsub("^%l", string.upper)
				end, { 1 }),
				t("))"),
			}),
		})

		-- If you want these snippets in TypeScript React files as well
		ls.filetype_extend("typescriptreact", { "javascriptreact" })
	end,
}
