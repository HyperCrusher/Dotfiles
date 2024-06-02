import button from "../components/button.js";

const vivaldiMenu = Widget.Menu({
	children: [
		Widget.MenuItem({
			child: Widget.Label("New Window"),
			onActivate: () => Utils.execAsync("vivaldi --new-window"),
		}),
		Widget.MenuItem({
			child: Widget.Label("New Private Window"),
			onActivate: () => Utils.execAsync("vivaldi --incognito"),
		}),
		Widget.MenuItem({
			child: Widget.Label("Open Plex"),
			onActivate: () =>
				Utils.execAsync("vivaldi --new-window http://localhost:32400"),
		}),
		Widget.MenuItem({
			child: Widget.Label("Kill All"),
			onActivate: () => Utils.execAsync("killall vivaldi-bin"),
		}),
	],
});
export const favs = () =>
	Widget.Box({
		spacing: 8,
		classNames: ["favs-container"],
		children: [
			button({
				hoverable: true,
				classNames: ["favs-button"],
				label: "",
				onPrimaryClick: () => Utils.execAsync("kitty tmux"),
			}),
			button({
				hoverable: true,
				classNames: ["favs-button"],
				label: "",
				onPrimaryClick: () => Utils.execAsync("vivaldi"),
				onSecondaryClick: (_, e) => vivaldiMenu.popup_at_pointer(e),
			}),
			button({
				hoverable: true,
				classNames: ["favs-button"],
				label: "󰉍",
				onPrimaryClick: () =>
					Utils.execAsync(
						`kitty tmux new -A -s downloads "zsh -ic 'cd ~/Downloads && ranger; exec zsh'"`,
					),
				onSecondaryClick: () => Utils.execAsync("thunar ./Downloads"),
			}),
			button({
				hoverable: true,
				classNames: ["favs-button"],
				label: "",
				onPrimaryClick: () =>
					Utils.execAsync(
						`kitty tmux new -A -s repos "zsh -ic 'cd ~/Documents/Repos && ranger; exec zsh'"`,
					),
				onSecondaryClick: () => Utils.execAsync("thunar ./Documents/Repos"),
			}),
		],
	});
