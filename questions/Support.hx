package questions;

enum TSupport
{
	Nothing;
	Hundred;
	FiveHundred;
	Thousand;
	FiveThousand;
	TwentyThousand;
	HundredThousand;
	HundredThousandPlus;
	NoAnswer;
}

class Support
{
	public static function parse(value:String) : TSupport
	{
		return switch (value)
		{
			case "Nothing": Nothing;
			case "$1-$100", "Hundred": Hundred;
			case "$101-$500", "FiveHundred": FiveHundred;
			case "$501-$1000", "Thousand": Thousand;
			case "$1001-$5000", "FiveThousand": FiveThousand;
			case "$5001-$20,000", "TwentyThousand": TwentyThousand;
			case "$20,001-$100,000", "HundredThousand": HundredThousand;
			case ">$100,000", "HundredThousandPlus": HundredThousandPlus;
			case "": NoAnswer;
			default: throw 'Unknown Support value "${value}"';
		}
	}

	public static function toString(value:TSupport) : String
	{
		return switch (value)
		{
			case Nothing: "Nothing";
			case Hundred: "Hundred";
			case FiveHundred: "FiveHundred";
			case Thousand: "Thousand";
			case FiveThousand: "FiveThousand";
			case TwentyThousand: "TwentyThousand";
			case HundredThousand: "HundredThousand";
			case HundredThousandPlus: "HundredThousandPlus";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { nothing: 0, hundred: 0, fivehundred: 0, thousand: 0, fivethousand: 0, twentythousand: 0, hundredthousand: 0, hundredthousandplus: 0 };

		for (answer in data)
		{
			switch (answer.support)
			{
				case Nothing: count.nothing++;
				case Hundred: count.hundred++;
				case FiveHundred: count.fivehundred++;
				case Thousand: count.thousand++;
				case FiveThousand: count.fivethousand++;
				case TwentyThousand: count.twentythousand++;
				case HundredThousand: count.hundredthousand++;
				case HundredThousandPlus: count.hundredthousandplus++;
				case NoAnswer:
			}
		}

		// Data
		var baseData = [
			["Nothing", "Nothing", '${count.nothing}'],
			["Hundred", "$1-$100", '${count.hundred}'],
			["FiveHundred", "$101-$500", '${count.fivehundred}'],
			["Thousand", "$501-$1000", '${count.thousand}'],
			["FiveThousand", "$1001-$5000", '${count.fivethousand}'],
			["TwentyThousand", "$5001-$20,000", '${count.twentythousand}'],
			["HundredThousand", "$20,001-$100,000", '${count.hundredthousand}'],
			["HundredThousandPlus", ">$100,000", '${count.hundredthousandplus}'],
		];

		// Export
		Data.export({ title: "Support", prettyTitle: "How much would you be willing to give to the Haxe Foundation to support them financially (U.S. Dollars)?", baseData: baseData });
	}
}
