local M= {}
local map=require('_utils').map
local U = require'snippets.utils'

local function create_mapping()
  map('i','<c-y>',"<cmd>lua return require'snippets'.expand_or_advance(1)<CR>",{noremap=true})
  map('i','<c-e>',"<cmd>lua return require'snippets'.advance_snippet(-1)<CR>",{noremap=true})
end

M.setup = function ()
  require'snippets'.use_suggested_mappings()
  create_mapping()
  require'snippets'.snippets = {
    _global = {
      todo = "TODO(krishbin): ";

      uname = function() return vim.loop.os_uname().sysname end;

      date = os.date();
      ymd = [[${=os.date("%Y-%m-%d")}]];

      note = [[NOTE(${=io.popen("id -un"):read"*l"}): ]];

    };
    lua = {
      req = [[local ${2:$1} = require '$1']];

      ["for"] = [[
      for ${1:i}, ${2:v} in ipairs(${3:t}) do
      $0
      end]];
    };
    cpp = {
     ["for"] = U.match_indentation [[
for (${1:int i=0} ; ${2:i} ; ${3:++i}){
  $0
};
]];
    ["default"] = U.match_indentation [[
#include <iostream>

using namespace std;

int main()
{
    $0
    return 0;
};
]];
    ["todo"] = [[//TODO(krishbin)-]];
    ["note"] = [[//NOTE(krishbin)-]];
    ["info"] = U.match_indentation[[
/*
      $0
*/
]];
    };
    tex = {
    ["begin"]=U.match_indentation [[
\begin{${1}}
    ${0}
\end{${1}}
      ]];
    ["pac"]=[[\usepackage[${2}]{${1}}${0}]];
    };
  }

end

return M
