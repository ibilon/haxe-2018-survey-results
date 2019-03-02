package questions;

enum TOrgSize
{
	LessEqOne;
	TwoTen;
	TenTwentyFive;
	TwentySixHundred;
	HundredOneFiveHundred;
	FiveHundredOneFifteenHundred;
	FifteenHundredOneTenThousand;
	TenThousandPlus;
	NotApplicable;
	NoAnswer;
}

class OrgSize
{
	public static function parse(value:String) : TOrgSize
	{
		return switch (value)
		{
			case "<= 1", "LessEqOne": LessEqOne;
			case "2-10", "TwoTen": TwoTen;
			case "10-25", "TenTwentyFive": TenTwentyFive;
			case "26-100", "TwentySixHundred": TwentySixHundred;
			case "101-500", "HundredOneFiveHundred": HundredOneFiveHundred;
			case "501-1500", "FiveHundredOneFifteenHundred": FiveHundredOneFifteenHundred;
			case "1501-10000", "FifteenHundredOneTenThousand": FifteenHundredOneTenThousand;
			case "> 10000", "TenThousandPlus": TenThousandPlus;
			case "N/A", "NotApplicable": NotApplicable;
			case "": NoAnswer;
			default: throw 'Unknown OrgSize value "${value}"';
		}
	}

	public static function toString(value:TOrgSize) : String
	{
		return switch (value)
		{
			case LessEqOne: "LessEqOne";
			case TwoTen: "TwoTen";
			case TenTwentyFive: "TenTwentyFive";
			case TwentySixHundred: "TwentySixHundred";
			case HundredOneFiveHundred: "HundredOneFiveHundred";
			case FiveHundredOneFifteenHundred: "FiveHundredOneFifteenHundred";
			case FifteenHundredOneTenThousand: "FifteenHundredOneTenThousand";
			case TenThousandPlus: "TenThousandPlus";
			case NotApplicable: "NotApplicable";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { lesseqone: 0, twoten: 0, tentwentyfive: 0, twentysixhundred: 0, hundredonefivehundred: 0, fivehundredonefifteenhundred: 0, fifteenhundredonetenthousand: 0, tenthousandplus: 0, notapplicable: 0, noanswer: 0 };
		var countPro = { lesseqone: 0, twoten: 0, tentwentyfive: 0, twentysixhundred: 0, hundredonefivehundred: 0, fivehundredonefifteenhundred: 0, fifteenhundredonetenthousand: 0, tenthousandplus: 0, notapplicable: 0, noanswer: 0 };

		for (answer in data)
		{
			var pro = answer.useType == MainPro || answer.useType == OccasionalPro;

			switch (answer.orgSize)
			{
				case LessEqOne: count.lesseqone++; if (pro) { countPro.lesseqone++; }
				case TwoTen: count.twoten++; if (pro) { countPro.twoten++; }
				case TenTwentyFive: count.tentwentyfive++; if (pro) { countPro.tentwentyfive++; }
				case TwentySixHundred: count.twentysixhundred++; if (pro) { countPro.twentysixhundred++; }
				case HundredOneFiveHundred: count.hundredonefivehundred++; if (pro) { countPro.hundredonefivehundred++; }
				case FiveHundredOneFifteenHundred: count.fivehundredonefifteenhundred++; if (pro) { countPro.fivehundredonefifteenhundred++; }
				case FifteenHundredOneTenThousand: count.fifteenhundredonetenthousand++; if (pro) { countPro.fifteenhundredonetenthousand++; }
				case TenThousandPlus: count.tenthousandplus++; if (pro) { countPro.tenthousandplus++; }
				case NotApplicable: count.notapplicable++; if (pro) { countPro.notapplicable++; }
				case NoAnswer:
			}
		}

		// Data - extended is minus N/A
		var extendedData = [
			["LessEqOne", "<= 1", '${count.lesseqone}'],
			["TwoTen", "2-10", '${count.twoten}'],
			["TenTwentyFive", "10-25", '${count.tentwentyfive}'],
			["TwentySixHundred", "26-100", '${count.twentysixhundred}'],
			["HundredOneFiveHundred", "101-500", '${count.hundredonefivehundred}'],
			["FiveHundredOneFifteenHundred", "501-1500", '${count.fivehundredonefifteenhundred}'],
			["FifteenHundredOneTenThousand", "1501-10000", '${count.fifteenhundredonetenthousand}'],
			["TenThousandPlus", "> 10000", '${count.tenthousandplus}'],
		];

		var baseData = extendedData.concat([
			["NotApplicable", "Not Applicable", '${count.notapplicable}'],
		]);

		// Only pro users
		var proData = [
			["LessEqOne", "<= 1", '${countPro.lesseqone}'],
			["TwoTen", "2-10", '${countPro.twoten}'],
			["TenTwentyFive", "10-25", '${countPro.tentwentyfive}'],
			["TwentySixHundred", "26-100", '${countPro.twentysixhundred}'],
			["HundredOneFiveHundred", "101-500", '${countPro.hundredonefivehundred}'],
			["FiveHundredOneFifteenHundred", "501-1500", '${countPro.fivehundredonefifteenhundred}'],
			["FifteenHundredOneTenThousand", "1501-10000", '${countPro.fifteenhundredonetenthousand}'],
			["TenThousandPlus", "> 10000", '${countPro.tenthousandplus}'],
		];

		// Export
		Data.export({ title: "OrgSize", prettyTitle: "How big is your organization?", baseData: baseData, extendedData: extendedData });
		Data.export({ title: "OrgSizePro", prettyTitle: "How big is your organization?", baseData: proData });
	}
}
