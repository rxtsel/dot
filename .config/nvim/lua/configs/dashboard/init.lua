-- Variable para llamar la api de vim
require "variables"
-- Seleccionar telescope por defecto
g.dashboard_default_executive = 'telescope'

-- Opciones personalizadas
g.dashboard_custom_section = {
    a = {
        description = {"  Find Files                  leader f  "},
        command = "Telescope find_files"
    },
    b = {
        description = {"  Find Word                   press f4  "},
        command = "Telescope live_grep"
    },
    c = {
        description = {"  Exit                        leader q  "},
        command = "exit"
    }
}
-- Comandos sólo en el dashboard
vim.cmd [[
augroup dashboard_au
     autocmd! * <buffer>
     autocmd User dashboardReady let &l:stl = 'Dashboard'
     autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
augroup END
]]

-- Footer personalizado
g.dashboard_custom_footer = {'Cristhian Melo'}

-- Logo personalizado
g.dashboard_custom_header = {
   [[                             ]],
   [[           ░░░░░░░           ]],
   [[      ░░░░░░░░░░░░░░░░░      ]],
   [[    │░░░░░░░░░░░░░░░░░░░│    ]],
   [[    │░░░░░░░░░░░░░░░░░░░│    ]],
   [[   ░└┐░░░░░░░░░░░░░░░░░┌┘░   ]],
   [[   ░░└┐░░░░░░░░░░░░░░░┌┘░░   ]],
   [[   ░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░   ]],
   [[    ░│██████▌░░░▐██████│░    ]],
   [[    ░│▐███▀▀░░▄░░▀▀███▌│░    ]],
   [[    ─┘░░░░░░░▐█▌░░░░░░░└─    ]],
   [[    ░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░    ]],
   [[      ─┘██▌░░░░░░░▐██└─      ]],
   [[      ░░▐█─┬┬┬┬┬┬┬─█▌░░      ]],
   [[      ░░░▀┬┼┼┼┼┼┼┼┬▀░░░      ]],
   [[       ░░░└┴┴┴┴┴┴┴┘░░░       ]],
   [[         ░░░░░░░░░░░         ]],
   [[                             ]],
   [[ ¸.-•~¹°”ˆ˜ rxtsel ˜ˆ”°¹~•-.¸]],}
