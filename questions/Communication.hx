package questions;

import sys.io.File;
using StringTools;

enum TCommunication
{
	Forum;
	Twitter;
	Gitter;
	Facebook;
	Irc;
	Other(value:String);
	NoAnswer;
	// Added
	Telegram;
	Slack;
	Github;
	Discord;
	Reddit;
	Email;
	Skype;
	OpenflForum;
	StackOverflow;
	Youtube;
	Nothing;
	GoogleGroup;
	Qq;
	OtherForum;
}

class Communication
{
	public static function parse(value:String) : Array<TCommunication>
	{
		return value.replace(", ", ";").split(";").map(parseSingleValue);
	}

	static function parseSingleValue(value:String) : TCommunication
	{
		return switch (value)
		{
			case "Forums - http://community.haxe.org", "Forum": Forum;
			case "Twitter": Twitter;
			case "Gitter.im", "Gitter": Gitter;
			case "Facebook": Facebook;
			case "#haxe on irc", "Irc": Irc;
			case "I don't speak enough English and don't know a French-Forum (?)", "Instagram", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "Telegram", "telegram", "https://t.me/haxe_ru", "Russian haxe_ru chat on Telegram", "Telegramm group": Telegram;
			case "Slack", "slack", "slack for English", "haxe.slack.com", " haxe-dev.slack.com": Slack;
			case "Github", "Github Issues", "GitHub Issues", "github": Github;
			case "Haxeflixel Discord", "HaxeFlixel Discord", "Discord", "discord", "OpemFL and HaxeFlixel discord", "HaxeFlixel discord", "OpenFL and HaxeFlixel Discords", "Discord Servers", "Discoord", "Haxeflixel discord": Discord;
			case "Reddit", "/r/haxe": Reddit;
			case "Email", "Email /pm": Email;
			case "Skype", "Skype chat for Russian speaking community", "skype": Skype;
			case "Forums - http://community.openfl.org",  "OpenFL forums too", "community.openfl.org", "http://community.openfl.org/", "openfl.org forums", "openfl.org", "openfl forums", "OpenflForum": OpenflForum;
			case "StackOverflow", "stackoverflow", "Stackoverflow": StackOverflow;
			case "youtube", "Youtube": Youtube;
			case "Don't", "don't communicate", "I don’t ", "I didn't know about the community ", "i don't", "I don't", "Not", "in person", "I kinda don't...", "null", "none", "not", "not yet", "No", "i dont.", "Nothing": Nothing;
			case "Google Groups", "GoogleGroup": GoogleGroup;
			case "QQ", "Qq": Qq;
			case "forums", "haxeflixel.com", "OtherForum": OtherForum;
			default: throw 'Unknown Communication value "${value}"';
		}
	}

	public static function toString(value:Array<TCommunication>) : String
	{
		return value.map(valueToString).join(";");
	}

	static function valueToString(value:TCommunication) : String
	{
		return switch (value)
		{
			case Forum: "Forum";
			case Twitter: "Twitter";
			case Gitter: "Gitter";
			case Facebook: "Facebook";
			case Irc: "Irc";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case Telegram: "Telegram";
			case Slack: "Slack";
			case Github: "Github";
			case Discord: "Discord";
			case Reddit: "Reddit";
			case Email: "Email";
			case Skype: "Skype";
			case OpenflForum: "OpenflForum";
			case StackOverflow: "StackOverflow";
			case Youtube: "Youtube";
			case Nothing: "Nothing";
			case GoogleGroup: "GoogleGroup";
			case Qq: "Qq";
			case OtherForum: "OtherForum";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { forum: 0, twitter: 0, gitter: 0, facebook: 0, irc: 0, other: 0, telegram: 0, slack: 0, github: 0, discord: 0, reddit: 0, email: 0, skype: 0, openflForum: 0, stackOverflow: 0, youtube: 0, nothing: 0, googleGroup: 0, qq: 0, otherForum: 0 };

		var histogramCount = new Map<Int, Int>();

		for (answer in data)
		{
			var c = answer.communication.length;

			if (c == 1 && answer.communication[0].match(NoAnswer))
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

			for (communication in answer.communication)
			{
				switch (communication)
				{
					case Forum: count.forum++;
					case Twitter: count.twitter++;
					case Gitter: count.gitter++;
					case Facebook: count.facebook++;
					case Irc: count.irc++;
					case Other(_): count.other++;
					case NoAnswer:
					// Added
					case Telegram: count.telegram++;
					case Slack: count.slack++;
					case Github: count.github++;
					case Discord: count.discord++;
					case Reddit: count.reddit++;
					case Email: count.email++;
					case Skype: count.skype++;
					case OpenflForum: count.openflForum++;
					case StackOverflow: count.stackOverflow++;
					case Youtube: count.youtube++;
					case Nothing: count.nothing++;
					case GoogleGroup: count.googleGroup++;
					case Qq: count.qq++;
					case OtherForum: count.otherForum++;
				}
			}
		}

		var baseOther = count.other + count.telegram + count.slack + count.github + count.discord + count.reddit + count.email + count.skype + count.openflForum + count.stackOverflow + count.youtube + count.nothing + count.googleGroup + count.qq + count.otherForum;

		// Data
		var baseData = [
			["Forum", "Official\nForum", '${count.forum}'],
			["Twitter", "Twitter", '${count.twitter}'],
			["Gitter", "Gitter.im", '${count.gitter}'],
			["Facebook", "Facebook", '${count.facebook}'],
			["IRC", "#haxe on irc", '${count.irc}'],
		];

		var extendedData = baseData.concat([
			["Telegram", "Telegram", '${count.telegram}'],
			["Slack", "Slack", '${count.slack}'],
			["Github", "Github", '${count.github}'],
			["Discord", "Discord", '${count.discord}'],
			["Reddit", "Reddit", '${count.reddit}'],
			["Email", "Email", '${count.email}'],
			["Skype", "Skype", '${count.skype}'],
			["OpenflForum", "Openfl's Forum", '${count.openflForum}'],
			["StackOverflow", "StackOverflow", '${count.stackOverflow}'],
			["Youtube", "Youtube", '${count.youtube}'],
			["Nothing", "None", '${count.nothing}'],
			["GoogleGroup", "Google Groups", '${count.googleGroup}'],
			["QQ", "QQ", '${count.qq}'],
			["OtherForum", "Other Forum", '${count.otherForum}'],
			["Other", "Other", '${count.other}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "Communication", prettyTitle: "How do you communicate with other Haxe users?", baseData: baseData, extendedData: extendedData, histogram: histogramCount });
	}
}
