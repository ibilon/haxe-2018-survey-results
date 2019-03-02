package questions;

enum TKnowPaid
{
	Yes;
	No;
	NoAnswer;
}

class KnowPaid
{
	public static function parse(value:String) : TKnowPaid
	{
		return switch (value)
		{
			case "Yes": Yes;
			case "No": No;
			case "": NoAnswer;
			default: throw 'Unknown KnowPaid value "${value}"';
		}
	}

	public static function toString(value:TKnowPaid) : String
	{
		return switch (value)
		{
			case Yes: "Yes";
			case No: "No";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { yes: 0, no: 0 };

		for (answer in data)
		{
			switch (answer.knowPaid)
			{
				case Yes: count.yes++;
				case No: count.no++;
				case NoAnswer:
			}
		}

		// Data
		var baseData = [
			["Yes", "Yes", '${count.yes}'],
			["No", "No", '${count.no}'],
		];

		// Export
		Data.export({ title: "KnowPaid", prettyTitle: "Do you know that the Haxe foundation offers paid support plans?", baseData: baseData });
	}
}
