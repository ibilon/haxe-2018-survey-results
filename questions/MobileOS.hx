package questions;

enum TMobileOS
{
	Android;
	Ios;
	Blackberry;
	Windows;
	Other(value:String);
	NoAnswer;
	// Added
	NotApplicable;
	Multiple;
	Linux;
}

class MobileOS
{
	public static function parse(value:String) : TMobileOS
	{
		return switch (value)
		{
			case "Android": Android;
			case "iOS", "Ios": Ios;
			case "Blackberry": Blackberry;
			case "Windows Phone", "Windows": Windows;
			case "cheater", "Sailfish", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "None", "none", "I have no phone", "None, I don't own a smartphone", "NotApplicable": NotApplicable;
			case "Both iOS and Android", "Multiple": Multiple;
			case "Ubuntu on Odroid-C2 ( arm64 ) or Raspberry Pi 3", "Linux": Linux;
			default: throw 'Unknown MobileOS value "${value}"';
		}
	}

	public static function toString(value:TMobileOS) : String
	{
		return switch (value)
		{
			case Android: "Android";
			case Ios: "Ios";
			case Blackberry: "Blackberry";
			case Windows: "Windows";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case NotApplicable: "NotApplicable";
			case Multiple: "Multiple";
			case Linux: "Linux";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { android: 0, ios: 0, blackberry: 0, windows: 0, other: 0, noanswer: 0, notapplicable: 0, multiple: 0, linux: 0 };

		for (answer in data)
		{
			switch (answer.mobileOS)
			{
				case Android: count.android++;
				case Ios: count.ios++;
				case Blackberry: count.blackberry++;
				case Windows: count.windows++;
				case Other(_): count.other++;
				case NoAnswer:
				// Added
				case NotApplicable: count.notapplicable++;
				case Multiple: count.multiple++;
				case Linux: count.linux++;
			}
		}

		var baseOther = count.other + count.notapplicable + count.multiple + count.linux;

		// Data
		var baseData = [
			["Android", "Android", '${count.android}'],
			["Ios", "iOS", '${count.ios}'],
			["Blackberry", "Blackberry", '${count.blackberry}'],
			["Windows", "Windows Phone", '${count.windows}'],
		];

		var extendedData = baseData.concat([
			["NotApplicable", "Not Applicable", '${count.notapplicable}'],
			["Multiple", "Multiple", '${count.multiple}'],
			["Linux", "Linux", '${count.linux}'],
			["Other", "Other", '${count.other}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "MobileOS", prettyTitle: "What is your mobile operating system?", baseData: baseData, extendedData: extendedData });
	}
}
