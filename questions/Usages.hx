package questions;

enum TUsages
{
	ConsoleGames;
	DesktopGames;
	MobileGames;
	FrontEndWeb;
	BackEndWeb;
	DesktopApp;
	MobileApp;
	SoftwareLib;
	Cli;
	Art;
	Other(value:String);
	NoAnswer;
	// Added
	WebGames;
	DataProcess;
	Prototyping;
	Education;
	NotApplicable;
}

class Usages
{
	public static function parse(value:String) : Array<TUsages>
	{
		return value.split(";").map(parseSingleValue);
	}

	static function parseSingleValue(value:String) : TUsages
	{
		return switch (value)
		{
			case "Console Games", "ConsoleGames": ConsoleGames;
			case "Desktop Games", "to develop my game engine, to run on raspberry", "DesktopGames": DesktopGames;
			case "Mobile Games", "MobileGames": MobileGames;
			case "Front-end web", "FrontEndWeb": FrontEndWeb;
			case "Back-end web", "Back end server.", "BackEndWeb": BackEndWeb;
			case "Desktop Applications", "Development tools", "want to use for desktop app", "DesktopApp": DesktopApp;
			case "Mobile Applications", "MobileApp": MobileApp;
			case "Sotfware Libraries", "programming games API in Java, C#, Python and JS using Haxe", "Cross-platform libraries", "SoftwareLib": SoftwareLib;
			case "Command Line Utilities", "Cli": Cli;
			case "Art", "3D on the web": Art;
			case "4th Generation Language to allow languages of world to do programming", "Chrome Extensions", "Tests for desktop apps. (IDE)", "Programming", "Flash Community", "Blockchain", "Telegram Bots", "Toy", "Other": Other(value);
			case "": NoAnswer;
			// Added:
			case "Web based games", "Frontend Web Games targeting both Mobile & Desktop", "Web Games", "HTML5 Games", "Browser Games", "Web games mobile/desktop", "Web games", "Browser-based social games", "Browser games", "WebGames": WebGames;
			case "Data processing and analysis", "Data Science / Machine Learning", "DataProcess": DataProcess;
			case "protoyping ideas", "Prototyping": Prototyping;
			case "Medical Simulation software for educational purposes.", "Educational Software online JS from AS3 originals", "Education", "Learning": Education;
			case "I don't yet", "NotApplicable": NotApplicable;
			default: throw 'Unknown Usages value "${value}"';
		}
	}

	public static function toString(value:Array<TUsages>) : String
	{
		return value.map(valueToString).join(";");
	}

	static function valueToString(value:TUsages) : String
	{
		return switch (value)
		{
			case ConsoleGames: "ConsoleGames";
			case DesktopGames: "DesktopGames";
			case MobileGames: "MobileGames";
			case FrontEndWeb: "FrontEndWeb";
			case BackEndWeb: "BackEndWeb";
			case DesktopApp: "DesktopApp";
			case MobileApp: "MobileApp";
			case SoftwareLib: "SoftwareLib";
			case Cli: "Cli";
			case Art: "Art";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case WebGames: "WebGames";
			case DataProcess: "DataProcess";
			case Prototyping: "Prototyping";
			case Education: "Education";
			case NotApplicable: "NotApplicable";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { consolegames: 0, desktopgames: 0, mobilegames: 0, frontendweb: 0, backendweb: 0, desktopapp: 0, mobileapp: 0, softwarelib: 0, cli: 0, art: 0, other: 0, webgames: 0, dataprocess: 0, prototyping: 0, education: 0, notapplicable: 0 };

		var histogramCount = new Map<Int, Int>();

		for (answer in data)
		{
			var c = answer.usages.length;

			if (c == 1 && answer.usages[0].match(NoAnswer))
			{
				c = 0;
			}

			if (!histogramCount.exists(c))
			{
				histogramCount[c] = 1;
			}
			else
			{
				histogramCount[c]++;
			}

			for (usages in answer.usages)
			{
				switch (usages)
				{
					case ConsoleGames: count.consolegames++;
					case DesktopGames: count.desktopgames++;
					case MobileGames: count.mobilegames++;
					case FrontEndWeb: count.frontendweb++;
					case BackEndWeb: count.backendweb++;
					case DesktopApp: count.desktopapp++;
					case MobileApp: count.mobileapp++;
					case SoftwareLib: count.softwarelib++;
					case Cli: count.cli++;
					case Art: count.art++;
					case Other(_): count.other++;
					case NoAnswer:
					// Added
					case WebGames: count.webgames++;
					case DataProcess: count.dataprocess++;
					case Prototyping: count.prototyping++;
					case Education: count.education++;
					case NotApplicable: count.notapplicable++;
				}
			}
		}

		var baseOther = count.other + count.webgames + count.dataprocess + count.prototyping + count.education + count.notapplicable;

		// Data
		var baseData = [
			["ConsoleGames", "Console\nGames", '${count.consolegames}'],
			["DesktopGames", "Desktop\nGames", '${count.desktopgames}'],
			["MobileGames", "Mobile\nGames", '${count.mobilegames}'],
			["FrontEndWeb", "Frontend\nWeb", '${count.frontendweb}'],
			["BackEndWeb", "Backend\nWeb", '${count.backendweb}'],
			["DesktopApp", "Desktop\nApps", '${count.desktopapp}'],
			["MobileApp", "Mobile\nApp", '${count.mobileapp}'],
			["SoftwareLib", "Software\nLibraries", '${count.softwarelib}'],
			["Cli", "CLI", '${count.cli}'],
			["Art", "Art", '${count.art}'],
		];

		var extendedData = baseData.concat([
			["WebGames", "Web Games", '${count.webgames}'],
			["DataProcess", "Data Processing", '${count.dataprocess}'],
			["Prototyping", "Prototyping", '${count.prototyping}'],
			["Education", "Education", '${count.education}'],
			["NotApplicable", "Not Applicable", '${count.notapplicable}'],
			["Other", "Other", '${count.other}'],
		]);

		var groupData = [
			["Games", "Games", '${count.consolegames + count.desktopgames + count.mobilegames + count.webgames}'],
			["Web", "Web", '${count.frontendweb + count.backendweb}'],
			["App", "Applications", '${count.desktopapp + count.mobileapp + count.cli + count.dataprocess}'],
			["SoftwareLib", "Software Libraries", '${count.softwarelib}'],
			["Art", "Art", '${count.art}'],
			["Other", "Other", '${count.prototyping + count.education + count.other}'],
		];

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "Usages", prettyTitle: "What do you use Haxe for?", baseData: baseData, extendedData: extendedData, groupData: groupData, histogram: histogramCount });
	}
}
