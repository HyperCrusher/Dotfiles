const hyprland = await Service.import("hyprland");
import button from "../components/button.js";
const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);

export const workspaces = (Monitor) => {
	const defaultCount = 4;
	const kanji = [
		["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"],
		["火", "水", "風", "地", "空", "氷", "雷", "光", "影", "雲"],
	];
	const monitors = ["DP-3", "HDMI-A-1"];
	const monitor = hyprland.monitors
		.filter((monitor) => monitor.id === Monitor)
		.map((monitor) => ({
			idx: monitors.indexOf(monitor.name),
		}))[0].idx;
	const offset = 10 * monitor;

	let workspaces = hyprland.workspaces
		.filter((workspace) => workspace.monitorID === Monitor)
		.map((workspace) => workspace.id);
	for (let i = 1 + offset; i <= defaultCount + offset; i++) {
		if (!workspaces.includes(i)) {
			workspaces.push(i);
		}
	}

	const buttons = [];
	for (const workspace of workspaces) {
		buttons.push(
			button({
				setup: (self) =>
					self.hook(hyprland, () => {
						self.toggleClassName(
							"occupied",
							(hyprland.getWorkspace(workspace)?.windows || 0) > 0,
						);
						self.toggleClassName(
							"active",
							(() => {
								let active = hyprland.monitors.filter(
									(monitor) => monitor.id === Monitor,
								)[0] || { activeWorkspace: { id: "null" } };
								return active.activeWorkspace.id === workspace;
							})(),
						);
					}),
				classNames: ["workspace-button"],
				hoverable: true,
				label: kanji[monitor][workspace - 1 - offset],
				onClicked: () => dispatch(`${workspace}`),
			}),
		);
	}
	return Widget.Box({
		classNames: ["workspace-container"],
		children: buttons,
	});
};
