######################################
######################################
# CONFIG BY RXTSEL. ##################
# https://github.com/rxtsel/Dotfiles/#
######################################
######################################

import os
from typing import List  
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()

keys = [
        #NAVEGACIÓN
        Key([mod], "space", lazy.layout.next(), desc="Mover el foco de ventana"),
        #CAMBIAR DE GRUPO
        Key([mod], "period",lazy.screen.next_group(), desc='Mover al suiente grupo'),
        Key([mod], "comma", lazy.screen.prev_group(), desc='Mover al anterior grupo'),
        #MOVER VENTANAS
        Key([mod, "control"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
        Key([mod, "control"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
        Key([mod, "control"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "control"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        #CAMBIAR TAMAÑO DE VENTANAS
        Key([mod], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
        Key([mod], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
        Key([mod], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

        #MINIMIZAR VENTANA (toggle)
        Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
        #ABRIR TERMINAL
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        #MAX O COLUMN
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        #CERRA VENTANA
        Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
        #RESTART QTYLE
        Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
        #CERRAR SESION
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        #BUSCADOR
        Key([mod], "s", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

        #ROFI
        Key([mod], "m", lazy.spawn('rofi -show drun'), desc="rofi menu"),

        #SCREENSHOT
        Key([mod], "a", lazy.spawn('flameshot full'), desc="Toma captura"),

        #NAVEGADOR
        Key([mod], "b", lazy.spawn('chromium'), desc="Open chromium browser"),
        #EXPLORADOR
        Key([mod], "e", lazy.spawn('thunar'), desc="Open thunar"),

        #VOLUMEN
        Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
        Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
        Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        #BRILLO
        Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
        Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
        #FLOTANTE
        Key([mod], "f", lazy.window.toggle_floating()),
]

groups = [Group(i) for i in "12345"]

__groups = {
        1: Group(""),
        2: Group(""),
        3: Group(""),
        4: Group(""),
        5: Group(""),
}

groups = [__groups[i] for i in __groups]

def get_group_key(name):
    return [k for k, g in __groups.items() if g.name == name][0]

for i in groups:
    keys.extend([
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),
        Key([mod, "shift"], str(get_group_key(i.name)), lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        ])

layouts = [
        layout.MonadTall(borderwidth=1, margin=5, border_normal='#383a59',  border_focus='#bd93f9'),
        layout.Max(border_normal='#383a59',  border_focus='#bd93f9'),
        # layout.Matrix(),
        # layout.Floating(border_normal='#383a59',  border_focus='#bd93f9'),
        ]

widget_defaults = dict(
        font='SF Pro Display',
        fontsize=18,
        )

screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.CurrentLayoutIcon(padding = 0, scale = 0.5, custom_icon_paths=[os.path.expanduser( "~/.config/qtile/icons" )]),
                    widget.GroupBox(
                        spacing=10,
                        inactive="#bcc2cd",
                        active="#8be9fd",
                        block_highlight_text_color="#ff80bf",
                        borderwidth=0,
                        padding=15,
                        fontsize=25,
                        ),
                    widget.WindowName(),
                    widget.Memory(),
                    widget.Net(format ='{down} ↓↑ {up}'),
                    widget.TextBox("Cristhian Melo", foreground="#ff80bf"),
                    widget.Systray(icon_size = 19),
                    widget.Clock(format='%a, %d | %I:%M %p',  foreground='#8be9fd'),
                    ],
                40,
                background="#18111100",
                opacity=1,
                ),
            ),
        ]

mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(),
            start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(),
            start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front())
        ]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),
    Match(title='Qalculate!'),
    Match(wm_class='kdenlive'),
    Match(wm_class='pinentry-gtk-2'),
])   
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
