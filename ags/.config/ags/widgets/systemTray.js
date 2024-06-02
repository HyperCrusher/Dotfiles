// Systray is unique
// It has one hidden tray that is registered by the config.js like a 'server'
// All trays are updated as "clients"

import button from "../components/button.js";
const SystemTray = await Service.import("systemtray");

const trayItem = (item) => ({
	icon: item.icon,
	tooltip: item.tooltipMarkup,
	click: (event) => {
		item.activate(event);
	},
	rightClick: (event) => item.openMenu(event),
});

const systemTray = {
	items: [],
	clients: [],

	update(items) {
		systemTray.items = [];
		for (const [_, item] of items) {
			systemTray.items.push(trayItem(item));
		}
		systemTray.updateClients();
	},

	updateClients() {
		for (const client of systemTray.clients) {
			client();
		}
	},

	added: SystemTray.connect("added", (val) => {
		systemTray.update([...val._items]);
	}),

	removed: SystemTray.connect("removed", (val) => {
		systemTray.update([...val._items]);
	}),

	subscribe(listener) {
		systemTray.clients.push(listener);
	},
};

const createTrayItem = (item) =>
	button({
		classNames: ["systray-button"],
		hoverable: true,
		child: Widget.Icon({ icon: item.icon }),
		tooltipMarkup: item.tooltip,
		onPrimaryClick: (_, e) => item.click(e),
		onSecondaryClick: (_, e) => item.rightClick(e),
	});

export const getTray = () => {
	const tray = Widget.Box({
		classNames: ["systray-container"],
		children: systemTray.items.map(createTrayItem),
	});

	systemTray.subscribe(() => {
		tray.children = systemTray.items.map(createTrayItem);
	});

	return tray;
};
