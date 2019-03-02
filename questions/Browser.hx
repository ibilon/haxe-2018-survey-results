package questions;

import sys.io.Process;
import sys.io.File;

enum TBrowser
{
	Chrome;
	Firefox;
	Edge;
	Safari;
	InternetExplorer;
	Opera;
	Other(value:String);
	NoAnswer;
	// Added
	Vivaldi;
	Multiple;
}

class Browser
{
	public static function parse(value:String) : TBrowser
	{
		return switch (value)
		{
			case "Chrome", "Chrome for now, but thinking seriously about switching to Brave", "Chromium (apologies if the distinction isn't important, you can change this to Chrome if you like)": Chrome;
			case "Firefox": Firefox;
			case "Edge": Edge;
			case "Safari": Safari;
			case "Internet Explorer", "InternetExplorer": InternetExplorer;
			case "Opera": Opera;
			case "Brave", "Pale Moon", "SlimJet", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "Vivaldi (chromium-based)", "Vivaldi", "Vivaldi (Chromium)": Vivaldi;
			case "Firefox, Chrome, SeaMonkey, Opera for different things but equally.", "Multiple": Multiple;
			default: throw 'Unknown Browser value "${value}"';
		}
	}

	public static function toString(value:TBrowser) : String
	{
		return switch (value)
		{
			case Chrome: "Chrome";
			case Firefox: "Firefox";
			case Edge: "Edge";
			case Safari: "Safari";
			case InternetExplorer: "InternetExplorer";
			case Opera: "Opera";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case Vivaldi: "Vivaldi";
			case Multiple: "Multiple";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { chrome: 0, firefox: 0, edge: 0, safari: 0, internetExplorer: 0, opera: 0, other: 0, vivaldi: 0, multiple: 0 };

		for (answer in data)
		{
			switch (answer.browser)
			{
				case Chrome: count.chrome++;
				case Firefox: count.firefox++;
				case Edge: count.edge++;
				case Safari: count.safari++;
				case InternetExplorer: count.internetExplorer++;
				case Opera: count.opera++;
				case Other(_): count.other++;
				case NoAnswer:
				// Added
				case Vivaldi: count.vivaldi++;
				case Multiple: count.multiple++;
			}
		}

		var baseOther = count.other + count.vivaldi + count.multiple;

		// Data
		var baseData = [
			["Chrome", "Chrome", '${count.chrome}'],
			["Firefox", "Firefox", '${count.firefox}'],
			["Edge", "Edge", '${count.edge}'],
			["Safari", "Safari", '${count.safari}'],
			["InternetExplorer", "Internet Explorer", '${count.internetExplorer}'],
			["Opera", "Opera", '${count.opera}'],
		];

		var extendedData = baseData.concat([
			["Vivaldi", "Vivaldi", '${count.vivaldi}'],
			["Multiple", "Multiple", '${count.multiple}'],
			["Other", "Other", '${count.other}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "Browser", prettyTitle: "What is your primary web browser?", baseData: baseData, extendedData: extendedData });
	}
}
