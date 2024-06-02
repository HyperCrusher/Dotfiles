import { workspaces } from "./workspaces.js";
import { clock } from "./clock.js";
import { getTray } from "./systemTray.js";
import { favs } from "./favorites.js";

const spacing = 4;

const left = ({ monitor }) => {
	return Widget.Box({
		classNames: ["bar-left"],
		spacing: spacing,
		children: [workspaces(monitor)],
	});
};

const center = () => {
	return Widget.Box({
		classNames: ["bar-center"],
		spacing: spacing,
		children: [clock()],
	});
};

const right = () => {
	return Widget.Box({
		classNames: ["bar-right"],
		hpack: "end",
		spacing: spacing,
		children: [favs(), getTray()],
	});
};

export default (monitor) =>
	Widget.Window({
		monitor,
		classNames: ["bar"],
		exclusivity: "exclusive",
		name: `topBar-${monitor}`,
		anchor: ["top", "left", "right"],
		child: Widget.CenterBox({
			start_widget: left({ monitor }),
			center_widget: center(),
			end_widget: right(),
		}),
	});
