package questions;

enum TDesktopOS
{
	Windows;
	Mac;
	Linux;
	Other(value:String);
	NoAnswer;
	// Added
	Multiple;
}

class DesktopOS
{
	public static function parse(value:String) : TDesktopOS
	{
		return switch (value)
		{
			case "Windows": Windows;
			case "OSX", "Mac": Mac;
			case "Linux", "Ubuntu on Odroid-C2 ( arm64 ) since 2 years": Linux;
			case "windows 10 mobile ", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "Windows + OSX", "Linux, Windows", "Both Windows and Linux", "Linux (Debian) and Windows7", "Windows+Linux", "Multiple": Multiple;
			default: throw 'Unknown DesktopOS value "${value}"';
		}
	}

	public static function toString(value:TDesktopOS) : String
	{
		return switch (value)
		{
			case Windows: "Windows";
			case Mac: "Mac";
			case Linux: "Linux";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case Multiple: "Multiple";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { windows: 0, mac: 0, linux: 0, other: 0, multiple: 0 };

		for (answer in data)
		{
			switch (answer.desktopOS)
			{
				case Windows: count.windows++;
				case Mac: count.mac++;
				case Linux: count.linux++;
				case Other(_): count.other++;
				case NoAnswer:
				// Added
				case Multiple: count.multiple++;
			}
		}

		var baseOther = count.other + count.multiple;

		// Data
		var baseData = [
			["Windows", "Windows", '${count.windows}'],
			["Mac", "OSX", '${count.mac}'],
			["Linux", "Linux", '${count.linux}'],
		];

		var extendedData = baseData.concat([
			["Multiple", "Multiple", '${count.multiple}'],
			["Other", "Other", '${count.other}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "DesktopOS", prettyTitle: "What is your primary desktop operating system?", baseData: baseData, extendedData: extendedData });
	}
}
