from typing import List  

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = guess_terminal()
color = "#8be9fd"
color_light = "#bcc2cd"
color_light2 = "#bcc2cd"
back = "#222222"

keys = [
    #NAVEGACIÓN
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    # Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    # Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    # Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    #MOVER VENTANAS
    Key([mod], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    #CAMBIAR TAMAÑO DE VENTANAS
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
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
    #NAVEGADOR
    Key([mod], "n", lazy.spawn('chromium'), desc="Open chromium browser"),
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
        # mod1 + letter of group = switch to group
        Key([mod], str(get_group_key(i.name)), lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1+shift+letter of group = switch to & move focused window to group
        Key([mod, "shift"], str(get_group_key(i.name)),
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(border_normal='#383a59', border_width=3, margin=4, border_focus='#bd93f9'),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='SF Pro Display',
    fontsize=18,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(foreground='#ffb86c'),
                widget.GroupBox(
                    highlight_color="#2c2b2b",
                    highlight_method="line",
                    spacing=10,
                    inactive=color_light2,
                    active=color,
                    block_highlight_text_color="#ff80bf",
                    borderwidth=0,
                    padding=15,
                    fontsize=24,
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Memory(),
                widget.Net(),
                widget.TextBox("Cristhian Melo", foreground="#ff80bf"),
                widget.Systray(icon_size = 21, padding = 13),
                widget.Clock(format='%a %I:%M %p'),
                widget.QuickExit(default_text='Salir', foreground='#8be9fd', countdown_format="[ {} ]"),
                widget.CheckUpdates(
                    custom_command="checkupdates",
                    background="555555",
                    update_interval=1800,
                    colour_have_updates="00ff00",
                    colour_no_updates="ff5500",
                    display_format='Actualitzacions: {updates}',
                    padding=0,
                    execute="lxterminal -e sudo pacman -Syyu",
                ),
            ],
            30,
            background="#222222",
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
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
