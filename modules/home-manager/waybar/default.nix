{
  config,
  pkgs,
  lib,
  ...
}:
with config.lib.stylix.colors.withHashtag;
with config.stylix.fonts; {
  config.home-manager.sharedModules = [
    {
      home.packages = with pkgs; [waybar];
      xdg.configFile."waybar/config".source =
        pkgs.writeText "config"
        ''
          // waybar configuration
          {
          	// "layer": "top", // Waybar at top layer
          	// "position": "bottom", // Waybar position (top|bottom|left|right)
          	//    "height": 60, // Waybar height (to be removed for auto height)
          	// "width": 1280, // Waybar width
          	"margin-top": 0,
          	"margin-bottom": 0,
          	"margin-left": 0,
          	"margin-right": 0,
          	// Choose the order of the modules
          	"modules-left": [
          		"sway/workspaces",
          		"sway/mode"
          	],
          	"module-center": [],
          	"modules-right": [
          		"battery",
          		"cpu",
          		"temperature",
          		"memory",
          		"disk",
          		"network",
          		"backlight",
          		"pulseaudio",
          		"sway/language",
          		"tray",
          		"clock"
          	],
          	// Modules configuration
          	//    "sway/workspaces": {
          	//        "disable-scroll": true,
          	//        "all-outputs": true,
          	//        "format": "{name}: {icon}",
          	//        "format-icons": {
          	//               "1": "",
          	//               "2": "",
          	//               "3": "",
          	//               "4": "",
          	//               "urgent": "",
          	//               "focused": "",
          	//               "default": ""
          	//         }
          	//     },
          	"sway/mode": {
          		"format": "<span style=\"italic\">{}</span>",
          		"max-length": 50
          	},
          	"sway/window": {
          		"format": "{}",
          		"min-length": 30,
          		"max-length": 60,
          		"rewrite": {
          			"(.*) - Firefox Developer Edition": "A $1",
          			"(.*) - NVIM": "B $1",
          			"(.*) - (.*)": "$0 $1"
          		}
          	},
          	"sway/language": {
          		"format": "{} "
          	},
          	"wlr/taskbar": {
          		"format": "{icon}",
          		"icon-size": 14,
          		"icon-theme": "",
          		"tooltip-format": "{title}",
          		"on-click": "activate",
          		"on-click-middle": "close"
          	},
          	"mpd": {
          		"format": "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ ",
          		"format-disconnected": "Disconnected ",
          		"format-stopped": "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ",
          		"unknown-tag": "N/A",
          		"interval": 2,
          		"consume-icons": {
          			"on": " "
          		},
          		"random-icons": {
          			"off": "<span color=\"#f53c3c\"></span> ",
          			"on": " "
          		},
          		"repeat-icons": {
          			"on": " "
          		},
          		"single-icons": {
          			"on": "1 "
          		},
          		"state-icons": {
          			"paused": "",
          			"playing": ""
          		},
          		"tooltip-format": "MPD (connected)",
          		"tooltip-format-disconnected": "MPD (disconnected)"
          	},
          	"idle_inhibitor": {
          		"format": "{icon}",
          		"format-icons": {
          			"activated": "",
          			"deactivated": ""
          		}
          	},
          	"tray": {
          		"icon-size": 20,
          		"spacing": 10
          	},
          	"clock": {
          		// "timezone": "America/New_York",
          		"interval": 1,
          		"format": "{:%Y-%m-%d %H:%M:%S}"
          	},
          	"cpu": {
          		"interval": 5,
          		"format": "  {usage}%",
          		"tooltip": false
          	},
          	"memory": {
          		"format": "  {}%",
          		"interval": 5
          	},
          	"temperature": {
          		"thermal-zone": 1,
          		"critical-threshold": 75,
          		"interval": 5,
          		"format-critical": "{icon} {temperatureC}°C",
          		"format": "{icon} {temperatureC}°C",
          		"format-icons": [
          			"",
          			"",
          			""
          		]
          	},
          	"disk": {
          		"interval": 30,
          		"format": "  {percentage_used}%",
          		//        "path": "/" //
          		"on-click": "pcmanfm"
          	},
          	//    "backlight": {
          	//        "device": "/dev/i2c-2",
          	//        "format": "{percent}% {icon}",
          	//        "format-icons": ["", ""]
          	//    },
          	"battery": {
          		"interval": 5,
          		"states": [
          			{
          				"name": "good",
          				"value": 95
          			},
          			{
          				"name": "warning",
          				"value": 30
          			},
          			{
          				"name": "critical",
          				"value": 20
          			}
          		],
          		"format": "{icon}  {capacity}%",
          		"format-charging": "  {capacity}%",
          		"format-plugged": "  {capacity}%",
          		"format-alt": "{icon} {time}",
          		"format-good": "", // An empty format will hide the module
          		"format-full": "",
          		"format-icons": [
          			"",
          			"",
          			"",
          			"",
          			""
          		]
          	},
          	//    "battery#bat2": {
          	//        "bat": "BAT2"
          	//    },
          	"network": {
          		// "interface": "wlp2*", // (Optional) To force the use of this interface
          		"format-wifi": "  {signalStrength}%",
          		"format-ethernet": "{ifname}: {ipaddr}/{cidr} ",
          		"format-linked": "{ifname} (No IP) ",
          		"format-disconnected": "Disconnected ⚠",
          		"format-alt": "{bandwidthUpBits}  {bandwidthDownBits} ",
          		"tooltip-format": "{ifname}: {ipaddr}/{cidr}\n{essid}",
          		"interval": 5
          	},
          	"pulseaudio": {
          		// "scroll-step": 1, // %, can be a float
          		"format": "{icon} {volume}% {format_source}",
          		"format-bluetooth": "{volume}% {icon} {format_source}",
          		"format-bluetooth-muted": " {icon} {format_source}",
          		"format-muted": " {format_source}",
          		"format-source": " {volume}%",
          		"format-source-muted": "",
          		"format-icons": {
          			"headphone": "",
          			"hands-free": "",
          			"headset": "",
          			"phone": "",
          			"portable": "",
          			"car": "",
          			"default": [
          				"",
          				"",
          				""
          			]
          		},
          		"on-click": "pavucontrol"
          	},
          	"custom/media": {
          		"format": "{icon} {}",
          		"return-type": "json",
          		"signal": 15,
          		"format-icons": {
          			"Playing": " ",
          			"Paused": " "
          		},
          		"min-length": 30,
          		"max-length": 30,
          		"exec": "playerctl metadata --format '{\"text\": \"{{playerName}} : {{artist}} - {{title}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F",
          		"on-click": "playerctl play-pause"
          	},
          	"custom/brightness": {
          		"format": "{}% ",
          		"exec": "~/.bin.d/getlight.sh",
          		"tooltip-format": "{}"
          	}
          }
        '';

      xdg.configFile."waybar/style.css".source =
        pkgs.writeText "style.css"
        ''
          * {
          	border: none;
          	border-radius: 0;
          }

          #waybar {
          	background: ${base00};
          }

          #window {
          	padding: 0 8px;
          	font-family: "${monospace.name}";
          	font-size: 12px;
          }

          #mode {
          	background-color: ${base01};
          }

          #custom-media {
          	padding: 0 16px;
          	font-family: "${monospace.name}";
          	font-size: 12px;
          	background-color: ${base06};
          	color: ${base03};
          }

          #custom-media.custom-spotify {
          	background-color: @spotify;
          }

          #custom-media.custom-vlc {
          	background-color: @vlc;
          }

          #workspaces {
          	margin: 0 0px;
          }

          #workspaces button {
          	padding: 0 16px;
          	background-color: ${base01};
          	color: ${base04};

          	font-family: "${monospace.name}";
          	font-size: 16px;
          }

          #workspaces button.visible {
          	background-color: ${base03};
          	color: ${base05};
          }

          #workspaces button.focused {
          	background-color: ${base02};
          	color: ${base06};
          }

          #workspaces button:hover {
          	background: ${base03};
          }

          #battery,
          #cpu,
          #memory,
          #disk,
          #temperature,
          #backlight,
          #network,
          #pulseaudio,
          #language,
          #mode,
          #idle_inhibitor {
          	padding: 0 16px;
          	font-family: "${monospace.name}";
          	font-size: 12px;
          }

          #cpu,
          #memory,
          #disk,
          #temperature,
          #battery {
          	background-color: ${base01};
          	color: ${base04};
          }

          #temperature.critical {
          	background-color: @warning;
          }

          @keyframes battery-blink {
          	to {
          		background-color: #f8f8f2;
          		color: #000000;
          	}
          }

          #battery.critical {
          	background-color: ${base01};
          	color: ${base01};
          }

          #network {
          	background-color: ${base02};
          	color: ${base05};
          }

          #network.disconnected {
          	background-color: ${base01};
          }

          #pulseaudio {
          	background-color: ${base03};
          	color: ${base06};
          }

          #pulseaudio.muted {
          	background-color: #90b1b1;
          	color: #2a5c45;
          }

          #language {
          	background-color: ${base01};
          	color: ${base06};
          	padding: 0 8px;
          	min-width: 32px;
          }

          #tray {
          	background-color: ${base09};
          	padding: 0 16px;
          }

          #clock {
          	padding: 0 16px;
          	background-color: ${base06};
          	color: ${base03};
          	font-family: "${monospace.name}";
          	font-size: 16px;
          }
        '';
    }
  ];
}
