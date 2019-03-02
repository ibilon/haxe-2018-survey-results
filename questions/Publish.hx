package questions;

using StringTools;

enum TPublish
{
	Steam;
	IosStore;
	MacStore;
	AndroidStore;
	WindowsStore;
	Ps4;
	PsVita;
	XboxOne;
	Switch;
	Gog;
	AmazonStore;
	Itch;
	Web;
	Other(value:String);
	// Added
	Custom;
	WebPortal;
	Github;
	Facebook;
	Internal;
	Nowhere;
	Haxelib;
}

class Publish
{
	public static function parse(value:String) : Array<TPublish>
	{
		return value.replace(";)", "").split(";").map(parseSingleValue).filter(f -> f != null);
	}

	static function parseSingleValue(value:String) : TPublish
	{
		return switch (value)
		{
			case "Steam": Steam;
			case "iOS App Store", "IosStore": IosStore;
			case "Mac App Store", "MacStore": MacStore;
			case "Google Play", "Android Play", "AndroidStore": AndroidStore;
			case "Microsoft Windows Store", "WindowsStore": WindowsStore;
			case "PlayStation 4", "Ps4": Ps4;
			case "PlayStation Vita", "PsVita": PsVita;
			case "Xbox One", "XboxOne": XboxOne;
			case "Nintendo Switch", "Switch": Switch;
			case "GOG.com", "Gog": Gog;
			case "Amazon App Store", "AmazonStore": AmazonStore;
			case "itch.io", "Itch": Itch;
			case "The Web", "Web": Web;
			case "", "This is all where I will be publishing them": null;
			// Added
			case "Various servers", "own hardware", "Private delivery infrastructure", "custom", "Custom": Custom;
			case "Newgrounds.com", "Newgrounds, Kongregate", "Kongregate, Newground", "GameJolt", "fgl", "newgrounds.com", "gamejolt.com", "Roblox", "WebPortal": WebPortal;
			case "Github", "github", "github.com", "GitHub": Github;
			case "Facebook", "Social networks (e.g. Facebook)", "facebook": Facebook;
			case "Internal use Only", "intranet", "inner organisation networks", "local", "Internal Network", "Internal": Internal;
			case "I create game dev tools, don't publish games myself", "Nothing currently published, check back later.", "Nowhere", "Not published", "I have not published any.", "Haven\"t published anything up to now", "I don’t publish them ", "no published yet", "Haven't published anything ", "i send them to friends via standard upload ", "N/A yet", "-", "I don't", "no where", "NA", "I don't publish them", "own projects", "Inside my robotic projects", "Personal Use", "I don't have any finished yet", "Currently nowhere. The question implies I've actually finished something worth publishing.", "none", "no published apps yet", "Well I haven't really... finished any.", "Planning to do", "Haven't published yet", "nothing yet", "to no one", "None", "Not sure yet. I'm a programmer learning game design.", "Not yet", "I haven't published anything yet.", "Not published yet", "non yet", "N/A", "nowhere", "n/a", "Don't Publish Yet", "want to publish": Nowhere;
			case "haxelib ", "Haxelib": Haxelib;
			default: throw 'Unknown Publish value "${value}"';
		}
	}

	public static function toString(value:Array<TPublish>) : String
	{
		return value.map(valueToString).join(";");
	}

	static function valueToString(value:TPublish) : String
	{
		return switch (value)
		{
			case Steam: "Steam";
			case IosStore: "IosStore";
			case MacStore: "MacStore";
			case AndroidStore: "AndroidStore";
			case WindowsStore: "WindowsStore";
			case Ps4: "Ps4";
			case PsVita: "PsVita";
			case XboxOne: "XboxOne";
			case Switch: "Switch";
			case Gog: "Gog";
			case AmazonStore: "AmazonStore";
			case Itch: "Itch";
			case Web: "Web";
			case Other(_): "Other";
			// Added
			case Custom: "Custom";
			case WebPortal: "WebPortal";
			case Github: "Github";
			case Facebook: "Facebook";
			case Internal: "Internal";
			case Nowhere: "Nowhere";
			case Haxelib: "Haxelib";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { steam: 0, iosstore: 0, macstore: 0, androidstore: 0, windowsstore: 0, ps4: 0, psvita: 0, xboxone: 0, switch_: 0, gog: 0, amazonstore: 0, itch: 0, web: 0, other: 0, custom: 0, webportal: 0, github: 0, facebook: 0, internal: 0, nowhere: 0, haxelib: 0 };

		var histogramCount = new Map<Int, Int>();

		for (answer in data)
		{
			var c = answer.publish.length;

			if (!histogramCount.exists(c))
			{
				histogramCount[c] = 1;
			}
			else
			{
				histogramCount[c]++;
			}

			for (publish in answer.publish)
			{
				switch (publish)
				{
					case Steam: count.steam++;
					case IosStore: count.iosstore++;
					case MacStore: count.macstore++;
					case AndroidStore: count.androidstore++;
					case WindowsStore: count.windowsstore++;
					case Ps4: count.ps4++;
					case PsVita: count.psvita++;
					case XboxOne: count.xboxone++;
					case Switch: count.switch_++;
					case Gog: count.gog++;
					case AmazonStore: count.amazonstore++;
					case Itch: count.itch++;
					case Web: count.web++;
					case Other(_): count.other++;
					// Added
					case Custom: count.custom++;
					case WebPortal: count.webportal++;
					case Github: count.github++;
					case Facebook: count.facebook++;
					case Internal: count.internal++;
					case Nowhere: count.nowhere++;
					case Haxelib: count.haxelib++;
				}
			}
		}

		var baseOther = count.other + count.custom + count.webportal + count.github + count.facebook + count.internal + count.nowhere + count.haxelib;

		// Data
		var baseData = [
			["Steam", "Steam", '${count.steam}'],
			["IosStore", "iOS\nStore", '${count.iosstore}'],
			["MacStore", "Mac\nStore", '${count.macstore}'],
			["AndroidStore", "Android\nStore", '${count.androidstore}'],
			["WindowsStore", "Windows\nStore", '${count.windowsstore}'],
			["Ps4", "PS4", '${count.ps4}'],
			["PsVita", "PSVita", '${count.psvita}'],
			["XboxOne", "Xbox One", '${count.xboxone}'],
			["Switch", "Nintendo\nSwitch", '${count.switch_}'],
			["Gog", "GOG.com", '${count.gog}'],
			["AmazonStore", "Amazon\nStore", '${count.amazonstore}'],
			["Itch", "itch.io", '${count.itch}'],
			["Web", "The Web", '${count.web}'],
		];

		var extendedData = baseData.concat([
			["Custom", "Custom", '${count.custom}'],
			["WebPortal", "Web Portals", '${count.webportal}'],
			["Github", "Github", '${count.github}'],
			["Facebook", "Facebook", '${count.facebook}'],
			["Internal", "Internal", '${count.internal}'],
			["Nowhere", "Nowhere", '${count.nowhere}'],
			["Haxelib", "Haxelib", '${count.haxelib}'],
			["Other", "Other", '${count.other}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "Publish", prettyTitle: "Where do you publish your Haxe applications?", baseData: baseData, extendedData: extendedData, histogram: histogramCount, histogramPrettyTitle: "On how many places do you publish your Haxe applications?" });
	}
}
