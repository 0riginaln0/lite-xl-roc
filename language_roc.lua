-- mod-version:3

local syntax = require "core.syntax"

--[[
    normal
    symbol
    comment
    keyword
    keyword2
    number
    literal
    string
    operator
    function
]]


syntax.add {
  name = "Roc",
  files = "%.roc$",
  comment = "#",
  patterns = {
    { pattern = "#.*\n",                 type = "comment" },
    { pattern = "%f[%a]%u%w*",           type = "literal" }, -- Roc Tags, Module imports
    { 
      pattern = { '"', '"', '\\' },
      type = "string",
      syntax = {
      	patterns = {
          { pattern = { "${", "}", "\\" }, type = "keyword", syntax = ".roc" },
          { pattern = "[^$\"]+",           type = "string"},
          { pattern = "[$\"]",             type = "string"},
        },
        symbols = {}
      }
    },

    { pattern = ":",                     type = "operator" },
    { pattern = "->",                    type = "operator" },
    { pattern = "=>",                    type = "operator" },
    { pattern = "|>",                    type = "operator" },
    { pattern = ",",                     type = "operator" },
    { pattern = "%.",                    type = "operator" },
    { pattern = "=",                     type = "operator" },
    { pattern = "==",                    type = "operator" },
    { pattern = "!=",                    type = "operator" },
    { pattern = "|",                     type = "operator" },
    { pattern = "&&",                    type = "operator" },
    { pattern = "+",                     type = "operator" },
    { pattern = "-",                     type = "operator" },
    { pattern = "*",                     type = "operator" },
    { pattern = "/",                     type = "operator" },
    { pattern = ">",                     type = "operator" },
    { pattern = "<",                     type = "operator" },
    { pattern = "@",                     type = "operator" },

    { pattern = "%(",                    type = "function" },
    { pattern = "%)",                    type = "function" },
    { pattern = "%[",                    type = "function" },
    { pattern = "%]",                    type = "function" },
    { pattern = "%{",                    type = "function" },
    { pattern = "%}",                    type = "function" },

    { pattern = "%l[%a_%d]*",            type = "normal" }, -- Just names
    { pattern = "%d[xb%_acdef%.%d]*%d*", type = "number" }, -- Numbers

    { pattern = "!",                     type = "keyword2" },
    { pattern = "?",                     type = "keyword2" },
  },
  symbols = {
    ["if"] = "keyword",
    ["then"] = "keyword",
    ["else"] = "keyword",
    ["when"] = "keyword",
    ["as"] = "keyword",
    ["is"] = "keyword",
    ["dbg"] = "keyword",
    ["import"] = "keyword",
    ["expect"] = "keyword",
    ["return"] = "keyword",
    ["crash"] = "keyword",
    ["and"] = "keyword",
    ["or"] = "keyword",
    ["exposing"] = "keyword",
    ["implements"] = "keyword",
    ["where"] = "keyword",
    ["platform"] = "keyword",
    ["module"] = "keyword",
    ["app"] = "keyword",
  },
}
