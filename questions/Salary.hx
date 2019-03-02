package questions;

enum TSalary
{
	USD30k;
	USD50k;
	USD70k;
	USD100k;
	USD150k;
	USD150kPlus;
	NotSay;
	NoAnswer;
}

class Salary
{
	public static function parse(value:String) : TSalary
	{
		return switch (value)
		{
			case "< $30,000", "USD30k": USD30k;
			case "$30,000-$50,000", "USD50k": USD50k;
			case "$50,001-$70,000", "USD70k": USD70k;
			case "$70,001-$100,000", "USD100k": USD100k;
			case "$100,001-$150,000", "USD150k": USD150k;
			case ">$150,000", "USD150kPlus": USD150kPlus;
			case "I'd rather not say", "NotSay": NotSay;
			case "": NoAnswer;
			default: throw 'Unknown Salary value "${value}"';
		}
	}

	public static function toString(value:TSalary) : String
	{
		return switch (value)
		{
			case USD30k: "USD30k";
			case USD50k: "USD50k";
			case USD70k: "USD70k";
			case USD100k: "USD100k";
			case USD150k: "USD150k";
			case USD150kPlus: "USD150kPlus";
			case NotSay: "NotSay";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { usd30k: 0, usd50k: 0, usd70k: 0, usd100k: 0, usd150k: 0, usd150kplus: 0, notsay: 0 };

		for (answer in data)
		{
			switch (answer.salary)
			{
				case USD30k: count.usd30k++;
				case USD50k: count.usd50k++;
				case USD70k: count.usd70k++;
				case USD100k: count.usd100k++;
				case USD150k: count.usd150k++;
				case USD150kPlus: count.usd150kplus++;
				case NotSay: count.notsay++;
				case NoAnswer:
			}
		}

		// Data - extended without NotSay
		var extendedData = [
			["USD30k", "< $30,000", '${count.usd30k}'],
			["USD50k", "$30,000-$50,000", '${count.usd50k}'],
			["USD70k", "$50,001-$70,000", '${count.usd70k}'],
			["USD100k", "$70,001-$100,000", '${count.usd100k}'],
			["USD150k", "$100,001-$150,000", '${count.usd150k}'],
			["USD150kPlus", ">$150,000", '${count.usd150kplus}'],
		];

		var baseData = extendedData.concat([
			["NotSay", "I'd rather not say", '${count.notsay}'],
		]);

		// Export
		Data.export({ title: "Salary", prettyTitle: "What is your annual salary (U.S. Dollars)?", baseData: baseData, extendedData: extendedData });
	}
}
