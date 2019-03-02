package questions;

enum TUseType
{
	MainPro;
	OccasionalPro;
	Hobby;
	Dont;
	NoAnswer;
}

class UseType
{
	public static function parse(value:String) : TUseType
	{
		return switch (value)
		{
			case "It is one of the main tools I use professionally", "MainPro": MainPro;
			case "It is a tool I use occasionally for professional work", "OccasionalPro": OccasionalPro;
			case "I use Haxe for hobby projects", "Hobby": Hobby;
			case "I don't use Haxe but would like to", "Dont": Dont;
			case "": NoAnswer;
			default: throw 'Unknown UseType value "${value}"';
		}
	}

	public static function toString(value:TUseType) : String
	{
		return switch (value)
		{
			case MainPro: "MainPro";
			case OccasionalPro: "OccasionalPro";
			case Hobby: "Hobby";
			case Dont: "Dont";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { mainPro: 0, occasionalPro: 0, hobby: 0, dont: 0 };

		for (answer in data)
		{
			switch (answer.useType)
			{
				case MainPro: count.mainPro++;
				case OccasionalPro: count.occasionalPro++;
				case Hobby: count.hobby++;
				case Dont: count.dont++;
				case NoAnswer:
			}
		}

		// Data - remove don't in extended
		var extendedData = [
			["MainPro", "Main professional tool", '${count.mainPro}'],
			["OccasionalPro", "Occasional professional tool", '${count.occasionalPro}'],
			["Hobby", "For hobby projects", '${count.hobby}']
		];

		var baseData = extendedData.concat([
			["Dont", "I don't yet use Haxe", '${count.dont}'],
		]);

		// Export
		Data.export({ title: "UseType", prettyTitle: "What do you use Haxe for?", baseData: baseData, extendedData: extendedData });
	}
}
