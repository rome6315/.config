# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
from libqtile import bar, layout, widget, qtile  # extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.core.manager import Qtile
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration, PowerLineDecoration, RectDecoration
from libqtile.dgroups import simple_key_binder
from typing import Callable

myFont = "Space Mono Nerd Font"
myTerm = "alacritty"
myBrowser = "librewolf" 
myFM = "pcmanfm"
myPM = "bitwarden-desktop"
rofi = "rofi -show combi -modes combi -combi-modes drun,run -icon-theme Papirus -show-icons"

mod = "mod4"
terminal = guess_terminal(myTerm)

##########AUTOSTARTS#########
import os, subprocess
from libqtile import hook


 #--------COLORS----------#
colors = [["#282c34", "#282c34"], 
          ["#1c1f24", "#1c1f24"], 
          ["#dfdfdf", "#dfdfdf"], 
          ["#ff6c6b", "#ff6c6b"], 
          ["#98be65", "#98be65"], 
          ["#da8548", "#da8548"], 
          ["#51afef", "#51afef"], 
          ["#c678dd", "#c678dd"], 
          ["#46d9ff", "#46d9ff"], 
          ["#a9a1e1", "#a9a1e1"],
          ["#87A5C4", "#87A5C4"],
          ["#D94559", "#D94559"]]

nord = [["#8FBCBB", "#8FBCBB"],
        ["#88C0D0", "#88C0D0"],
        ["#81A1C1", "#81A1C1"],
        ["#5E81AC", "#5E81AC"],
        ["#BF616A", "#BF616A"],
        ["#D08770", "#D08770"],
        ["#EBCB8B", "#EBCB8B"],
        ["#A3BE8C", "#A3BE8C"],
        ["#B48EAD", "#B48EAD"]]

pain = [["#6c3b73"],
        ["#ea0296"],
        ["#0151ca"],
        ["#c6020c"],
        ["#94f4ad"],
        ["#127233"],
        ["#ede0f4"],
        ]


        

#########KEYBINDS##############
keys = [

    # ###SOUND KEYS#####
   # Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 1 sset Master 1- unmute")),
   # Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
   # Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),

    #    #Brightness
    #    Key([], "XF86MonBrightnessUp", lazy.spawn("lux -a 10%")),
    #    Key([], "XF86MonBrightnessDown", lazy.spawn("lux -s 10%")),


        # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),


    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),


    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "l", lazy.layout.grow_left(),
         desc="Grow window to the left"),

    Key([mod, "control"], "h", lazy.layout.grow_right(), 
        desc="Grow window to the right"),

    Key([mod, "control"], "j", lazy.layout.grow_down(), 
        lazy.layout.shrink(), desc="Grow window down"),

    Key([mod, "control"], "k", lazy.layout.grow_up(), 
        lazy.layout.grow(), desc="Grow window up"),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),


    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key([mod], "Return", lazy.spawn(myTerm), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    
    #Launch Browser
    Key([mod], "g", lazy.spawn(myBrowser), desc="Launch chrome"),

    Key([mod], "f", lazy.spawn(myFM), desc="Launch file explorer"),
   
    Key([mod], "b", lazy.spawn(myPM), desc="Launch password manager"),
    #dmenu integration
    Key([mod], "r", lazy.spawn(rofi), desc="Launch rofi"),
    
    # monitor focus
    Key([mod], "Right", lazy.next_screen(), desc="Move focus to next monitor"),
    Key([mod], "Left", lazy.prev_screen(), desc="Move focus to prev monitor"),
    
    # toggle floating mode
    Key([mod], "w", lazy.window.toggle_floating()),
]

groups=[
       Group(name="1", layout='monadtall', label="•"),
       Group(name="2", layout='monadtall', label="•"),
       Group(name="3", layout='monadtall', label="•"),
       Group(name="4", layout='monadtall', label="•"),
       Group(name="5", layout='monadtall', label="•"),
       Group(name="6", layout='monadtall', label="•")
 ]

dgroups_key_binder = simple_key_binder("mod4")


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in '123':
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()

    return _inner

for i in groups:
    keys.append(Key([mod], i.name, lazy.function(go_to_group(i.name))))
#def go_to_group(group):
#    def f(qtile):
#        if group in '123':
#            qtile.cmd_to_screen(0)
#            qtile.groupMap[group].cmd_toscreen()
#        elif group in '456':
#            qtile.cmd_to_screen(1)
#            qtile.groupMap[group].cmd_toscreen()
#    return f

layout_theme = {"border_width": 3,
                "margin": 8,
                "border_focus": "c678dd",
                }

layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2, margin=5),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(
        **layout_theme,
    ),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    #layout.Floating(),
]

widget_defaults = dict(
    font = myFont,
    fontsize = 15,
    #padding = 3,
   # background = colors[1],
)
extension_defaults = widget_defaults.copy()

# Declare the powerline 
powerline = {
    "decorations": [
        PowerLineDecoration(
            path='forward_slash',
            size = 10,
            shift = 1,
        )
    ]
}

decor_systray = {
    "decorations": [
        RectDecoration(
            colour="#ea0296",
            line_width= 10,
            radius=10,
            filled=True,
            padding_y=5,
            padding_x=0,
            group=False,
        )
    ]
}

screens = [
    Screen(
        wallpaper = "~/Pictures/pain_tongue.jpg",
        wallpaper_mode = "fill",
        top=bar.Bar(
            [
               # widget.Image(
               #     filename = '~/Pictures/sasuke_naruto.jpg',
               #     background = nord[8],
               #     margin = 0,
               #     **powerline,
               # ),ea0296
                #widget.Prompt(),
                widget.Systray(
                    #background = "#00000000", 
                    icon_size = 20,
                    padding=10,
                    **decor_systray
                ),
                #widget.Wlan(
                #    interface = 'wlan0',
                #    format = '{essid}',
                #    fontsize = 14,
                #    **decor_systray
                #),
                #widget.Volume(
                #    fmt = ' {}',
                #    foreground = colors[2],
                #    fontsize = 15,
                #),
                #widget.Battery(
                #    charge_char ='',
                #    discharge_char = '',
                #    format = '  {percent:2.0%}{char}',
                #    low_foreground = colors[3],
                #    low_percentage = 0.15,
                #    foreground = colors[2],
                #    background = nord[7],
                #    padding = 5,
                #    **powerline,
                #),
               # widget.UPowerWidget(
               #     border_charge_colour = colors[7],
               #     background = colors[8],
               #     #foreground = colors[6], 
               #     #fill_normal = colors[6],
               #     **powerline,
               # ),
              #  widget.CurrentLayoutIcon(
              #      scale = .8,
              #      use_mask = True,
              #      background = nord[1],
              #  ),
              #  widget.CurrentLayout(
              #      **powerline,
              #      background = nord[1],
              #  ),
              #  widget.OpenWeather(
              #      location = 'Pittsburgh',
              #      format='{location_city}:{icon}',
              #      background = nord[5],
              #      **powerline,
              #  ),
                widget.Spacer(
                    length = 800,
                ),
                widget.GroupBox(
                    fontsize = 18,
                    highlight_method = 'text',
                    visible_groups=['1', '2', '3'],
                    this_current_screen_border = pain[1],
                    this_screen_border = nord[1],
                    decorations = [
                        RectDecoration(colour=pain[6], radius=7, filled=True, padding_y=3, group=False)
                    ],
                ),
                widget.Spacer(
                   length = bar.STRETCH,
                ),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CheckUpdates(
                    colour_have_updates = pain[6],
                    colour_no_updates = pain[6],
                    padding = 10,
                    distro = 'Arch_paru',
                    no_update_string = 'No updates',
                    decorations = [
                        RectDecoration(colour=pain[3], radius=5, filled=True, padding_y=3, group=False)
                    ],
                ),
                widget.Spacer(length=15),
                #widget.TextBox(
                #    decorations=[
                #        BorderDecoration(
                #            colour = "#7d7d7d",
                #            border_width = [0, 2, 0, 0],
                #            padding_x = 5,
                #            padding_y = 2,
                #        )
                #    ],
                #),
                #widget.CryptoTicker(
                #        format = '{crypto}:${amount:,.2f}',   
                #    foreground = nord[1],    
                #    decorations=[
                #        BorderDecoration(
                #            colour = nord[1],
                #            border_width = [0, 0, 2, 0],
                #            padding_x = 3,
                #            padding_y = 2,
                #        )
                #    ]
                #),
                #widget.TextBox(
                #    decorations=[
                #        BorderDecoration(
                #            colour = "#7d7d7d",
                #            border_width = [0, 2, 0, 0],
                #            padding_x = 5,
                #            padding_y = 2,
                #        )
                #    ],
                #),
                widget.ThermalSensor(
                    foreground = pain[6],    
                    threshold = 90,
                    fmt = 'CPU:{}',
                    padding = 15,
                    decorations = [
                        RectDecoration(colour=pain[5], radius=5, filled=True, padding_y=3, group=False)
                    ],
                    ),
                widget.Spacer(length=15),
                #widget.TextBox(
                #    decorations=[
                #        BorderDecoration(
                #            colour = colors[4],
                #            border_width = [0, 0, 2, 0],
                #            padding_x = 5,
                #            padding_y = 2,
                #        )
                #    ],
                #),
                widget.Clock(
                    format="%I:%M %p",
                    foreground = pain[6],
                    decorations = [
                        RectDecoration(colour=pain[2], radius=5, filled=True, padding_y=3, group=False)
                    ],
                ),
                widget.Spacer(
                    length=10,
                    ),
            ],   
            #bar height
            30,
            margin = [5, 5, 0, 5],
            background = colors[1],
             #border_width=[2, 0, 2, 0],  # Draw top and bottom borders
             #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),

    Screen(
        wallpaper = "~/Pictures/pain_tongue.jpg",
        wallpaper_mode = "fill",
        top=bar.Bar([
                widget.Spacer(
                    length = 960,
                    #background="#000000",
                    ),
                widget.GroupBox(
                    fontsize = 18,
                    highlight_method = 'text',
                    visible_groups=['4', '5', '6'],
                    this_current_screen_border = pain[1],
                    this_screen_border = nord[1],
                    decorations = [
                        RectDecoration(colour="#ede0f4", radius=7, filled=True, padding_y=3, group=False)
                    ],
                ),
                widget.Spacer(
                    length = bar.STRETCH,
                    ),

                ], 30, margin = [5, 5, 0, 5], background="#00000000"),
        )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

#dgroups_key_binder = None
#dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
        border_width=3,
        border_focus="#c678dd",
        border_normal="#000000",
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@hook.subscribe.startup_complete
def start_finished():
    qtile.focus_screen(1)
    qtile.groups_map["4"].cmd_toscreen(toggle=False)
    qtile.focus_screen(0)
    qtile.groups_map["1"].cmd_toscreen(toggle=False)

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])
