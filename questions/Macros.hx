package questions;

enum TMacros
{
	Yes;
	No;
	DontKnow;
	NoAnswer;
}

class Macros
{
	public static function parse(value:String) : TMacros
	{
		return switch (value)
		{
			case "Yes": Yes;
			case "No": No;
			case "What's a macro?", "DontKnow": DontKnow;
			case "": NoAnswer;
			default: throw 'Unknown Macros value "${value}"';
		}
	}

	public static function toString(value:TMacros) : String
	{
		return switch (value)
		{
			case Yes: "Yes";
			case No: "No";
			case DontKnow: "DontKnow";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		var count = { yes: 0, no: 0, dontKnow: 0 };

		for (answer in data)
		{
			switch (answer.macros)
			{
				case Yes: count.yes++;
				case No: count.no++;
				case DontKnow: count.dontKnow++;
				case NoAnswer:
			}
		}

		// Data
		var baseData = [
			["Yes", "Yes", '${count.yes}'],
			["No", "No", '${count.no}'],
			["DontKnow", "What's a macro?", '${count.dontKnow}'],
		];

		// Export
		Data.export({ title: "Macros", prettyTitle: "Do you use macros?", baseData: baseData });
	}
}
