package questions;

enum THaxeLength
{
	LessOne;
	OneTwo;
	TwoFour;
	FourSix;
	SixEight;
	EightPlus;
	NoAnswer;
}

class HaxeLength
{
	public static function parse(value:String) : THaxeLength
	{
		return switch (value)
		{
			case "< 1 year", "LessOne": LessOne;
			case "1-2 years", "OneTwo": OneTwo;
			case "2-4 years", "TwoFour": TwoFour;
			case "4-6 years", "FourSix": FourSix;
			case "6-8 years", "SixEight": SixEight;
			case "> 8 years", "EightPlus": EightPlus;
			case "": NoAnswer;
			default: throw 'Unknown HaxeLength value "${value}"';
		}
	}

	public static function toString(value:THaxeLength) : String
	{
		return switch (value)
		{
			case LessOne: "LessOne";
			case OneTwo: "OneTwo";
			case TwoFour: "TwoFour";
			case FourSix: "FourSix";
			case SixEight: "SixEight";
			case EightPlus: "EightPlus";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { lessOne: 0, oneTwo: 0, twoFour: 0, fourSix: 0, sixEight: 0, eightPlus: 0 };
		var countExtended = { lessOne: 0, oneTwo: 0, twoFour: 0, fourSix: 0, sixEight: 0, eightPlus: 0 };

		for (answer in data)
		{
			var useHaxe = answer.useType != Dont && answer.useType != NoAnswer;

			switch (answer.haxeLength)
			{
				case LessOne: count.lessOne++; if (useHaxe) countExtended.lessOne++;
				case OneTwo: count.oneTwo++; if (useHaxe) countExtended.oneTwo++;
				case TwoFour: count.twoFour++; if (useHaxe) countExtended.twoFour++;
				case FourSix: count.fourSix++; if (useHaxe) countExtended.fourSix++;
				case SixEight: count.sixEight++; if (useHaxe) countExtended.sixEight++;
				case EightPlus: count.eightPlus++; if (useHaxe) countExtended.eightPlus++;
				case NoAnswer:
			}
		}

		// Data
		var baseData = [
			["LessOne", "< 1 year", '${count.lessOne}'],
			["OneTwo", "1-2 years", '${count.oneTwo}'],
			["TwoFour", "2-4 years", '${count.twoFour}'],
			["FourSix", "4-6 years", '${count.fourSix}'],
			["SixEight", "6-8 years", '${count.sixEight}'],
			["EightPlus", "> 8 years", '${count.eightPlus}'],
		];

		// Extended data only count the people using Haxe
		var extendedData = [
			["LessOne", "< 1 year", '${countExtended.lessOne}'],
			["OneTwo", "1-2 years", '${countExtended.oneTwo}'],
			["TwoFour", "2-4 years", '${countExtended.twoFour}'],
			["FourSix", "4-6 years", '${countExtended.fourSix}'],
			["SixEight", "6-8 years", '${countExtended.sixEight}'],
			["EightPlus", "> 8 years", '${countExtended.eightPlus}'],
		];

		// Export
		Data.export({ title: "HaxeLength", prettyTitle: "How long have you been using Haxe?", baseData: baseData, extendedData: extendedData });
	}
}
