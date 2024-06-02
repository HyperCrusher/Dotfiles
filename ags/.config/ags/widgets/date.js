import popup from "../components/popup.js";

const dateWindow = Widget.Box({
	children: [
		Widget.Calendar({
			showDayNames: true,
			showDetails: true,
			showHeading: false,
			showWeekNumbers: false,
			onDaySelected: ({ date: [y, m, d] }) => {
				//TODO: open obsidian note on click
			},
		}),
	],
});

export default popup({
	name: "datemenu",
	layout: "top-center",
	child: Widget.Box({
		children: [dateWindow],
	}),
});
