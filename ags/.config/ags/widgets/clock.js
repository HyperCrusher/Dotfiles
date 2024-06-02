import button from "../components/button.js";
export const clock = () => {
	const currentDate = () =>
		new Date()
			.toLocaleString("en-us", {
				month: "short",
				day: "numeric",
				hour: "numeric",
				minute: "numeric",
				hour12: true,
			})
			.replace("PM", "pm")
			.replace(",", ", ");
	return Widget.Box({
		classNames: ["clock-container"],
		children: [
			button({
				classNames: ["clock-button"],
				hoverable: true,
				onPrimaryClick: () => App.toggleWindow("datemenu"),
			}).poll(5000, (self) => {
				self.label = currentDate();
			}),
		],
	});
};
