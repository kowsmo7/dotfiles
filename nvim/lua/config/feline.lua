local feline = require("feline")
local vifeline = require("feline.providers.vi_mode")
local filefeline = require("feline.providers.file")
local Vi_expand = vim.fn["expand"]

local Theme = {
	blue = "#458588",
}

local Providers = {
	Diagnostics = {}
}

function Providers.ViMode()
	return string.format(" %s ", vifeline.get_vim_mode())
end

function Providers.AdjFilePath()
	return string.format("%s/%s", Vi_expand("%:p:h:t"), Vi_expand("%:p:t"))
end

local function diagnosticCountFor(severity)
	local total = vim.diagnostic.get(0, { severity = vim.diagnostic.severity[severity] }) or {}
	return tostring(#total)
end

function Providers.Diagnostics.ErrCount()
	return diagnosticCountFor("ERROR")
end

function Providers.Diagnostics.WarnCount()
	return diagnosticCountFor("WARN")
end

local KNOWN_FT_MAP = {
	vim = "VimL",
}

function Providers.FileType()
	local ft = string.lower(filefeline.file_type(nil, {}) or "unknown")
	return KNOWN_FT_MAP[ft] or (ft:sub(1, 1):upper() .. ft:sub(2, -1))
end

local function RESETHL()
	return {
		provider = "",
		hl = { bg = "bg", fg = "fg" },
	}
end

local function SEP(n)
	return {
		provider = string.rep(" ", n),
		hl = RESETHL().hl,
	}
end

local components = {
	active = {
		-- LEFT
		{
			{
				provider = Providers.ViMode,
				hl = {
					fg = "bg",
					bg = "blue",
					style = "bold",
				},
			},
			SEP(1),
			{
				provider = Providers.AdjFilePath,
			},
			RESETHL(),
		},
		{},
		-- RIGHT
		{
			RESETHL(),
			SEP(2),
			{
				provider = Providers.FileType,
			},
			RESETHL(),
			SEP(1)
		},
	},
	inactive = {},
}

feline.setup({
	theme = Theme,
	components = components,
})

