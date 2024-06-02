import App from "resource:///com/github/Aylur/ags/app.js";
import topbar from "./widgets/topbar.js";
import date from "./widgets/date.js";

const sass = `${App.configDir}/style.scss`;
const css = "/tmp/style.css";
Utils.exec(`sassc ${sass} ${css}`);

Utils.monitorFile(`${App.configDir}`, () => {
	Utils.exec(`sassc ${sass} ${css}`);
	App.resetCss();
	App.applyCss(css);
});

App.config({
	style: css,
	windows: [
		topbar(0), // can be instantiated for each monitor
		topbar(1),
		date,
	],
});
