import Gdk from "gi://Gdk";

// The cursor property is bad and doesnt work correctly
// we we're going to do it manually

export default ({ hoverable, ...props } = {}) => {
	return Widget.Button({
		...props,
		...(hoverable && {
			setup: (self) => {
				if (typeof props.setup === "function") {
					props.setup(self);
				}
				self.on("enter-notify-event", () => {
					self
						.get_window()
						?.set_cursor(
							Gdk.Cursor.new_from_name(Gdk.Display.get_default(), "pointer"),
						);
				});
				self.on("leave-notify-event", () => {
					self
						.get_window()
						?.set_cursor(
							Gdk.Cursor.new_from_name(Gdk.Display.get_default(), "default"),
						);
				});
			},
		}),
	});
};
