package questions;

enum TProgLength
{
	OneThree;
	ThreeFive;
	SevenTen;
	TenFifteen;
	FifteenMore;
	NoAnswer;
}

class ProgLength
{
	public static function parse(value:String) : TProgLength
	{
		return switch (value)
		{
			case "1-3 years", "OneThree": OneThree;
			case "3-5 years", "ThreeFive": ThreeFive;
			case "7-10 years", "SevenTen": SevenTen;
			case "10-15 years", "TenFifteen": TenFifteen;
			case "> 15 years", "FifteenMore": FifteenMore;
			case "": NoAnswer;
			default: throw 'Unknown ProgLength value "${value}"';
		}
	}

	public static function toString(value:TProgLength) : String
	{
		return switch (value)
		{
			case OneThree: "OneThree";
			case ThreeFive: "ThreeFive";
			case SevenTen: "SevenTen";
			case TenFifteen: "TenFifteen";
			case FifteenMore: "FifteenMore";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { oneThree: 0, threeFive: 0, sevenTen: 0, tenFifteen: 0, fifteenMore: 0 };
		var countExtended = { oneThree: 0, threeFive: 0, sevenTen: 0, tenFifteen: 0, fifteenMore: 0 };

		for (answer in data)
		{
			var useHaxe = answer.useType != Dont && answer.useType != NoAnswer;

			switch (answer.progLength)
			{
				case OneThree: count.oneThree++; if (useHaxe) countExtended.oneThree++;
				case ThreeFive: count.threeFive++; if (useHaxe) countExtended.threeFive++;
				case SevenTen: count.sevenTen++; if (useHaxe) countExtended.sevenTen++;
				case TenFifteen: count.tenFifteen++; if (useHaxe) countExtended.tenFifteen++;
				case FifteenMore: count.fifteenMore++; if (useHaxe) countExtended.fifteenMore++;
				case NoAnswer:
			}
		}

		// Data
		var baseData = [
			["OneThree", "1-3 years", '${count.oneThree}'],
			["ThreeFive", "3-5 years", '${count.threeFive}'],
			["SevenTen", "7-10 years", '${count.sevenTen}'],
			["TenFifteen", "10-15 years", '${count.tenFifteen}'],
			["FifteenMore", "> 15 years", '${count.fifteenMore}'],
		];

		// Extended data only count the people using Haxe
		var extendedData = [
			["OneThree", "1-3 years", '${countExtended.oneThree}'],
			["ThreeFive", "3-5 years", '${countExtended.threeFive}'],
			["SevenTen", "7-10 years", '${countExtended.sevenTen}'],
			["TenFifteen", "10-15 years", '${countExtended.tenFifteen}'],
			["FifteenMore", "> 15 years", '${countExtended.fifteenMore}'],
		];

		// Export
		Data.export({ title: "ProgLength", prettyTitle: "How long have you been programming?", baseData: baseData, extendedData: extendedData, extendedDataPrettyTitle: "How long have Haxe users been programming?" });
	}
}
