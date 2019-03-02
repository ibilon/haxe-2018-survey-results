package questions;

enum TPartner
{
	Yes;
	No;
	NoAnswer;
}

class Partner
{
	public static function parse(value:String) : TPartner
	{
		return switch (value)
		{
			case "Yes": Yes;
			case "No": No;
			case "": NoAnswer;
			default: throw 'Unknown Partner value "${value}"';
		}
	}

	public static function toString(value:TPartner) : String
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
			switch (answer.partner)
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
		Data.export({ title: "Partner", prettyTitle: "Are you currently a Haxe Foundation support partner?", baseData: baseData });
	}
}
