package questions;

enum TPlanInterest
{
	Free;
	Professional;
	Enterprise;
	Elite;
	Other(value:String);
	NoAnswer;
	// Added
	Bounty;
	Paid;
	Individual; // "indie" price/patreon
	IfICould;
	Unsure;
}

class PlanInterest
{
	public static function parse(value:String) : TPlanInterest
	{
		return switch (value)
		{
			case "Free", "Haxe is still hobby for me :(", "none", "no", "I'm not interested? Why is that not an option?", "in the current state? free :( so many possibilities, so less outcome... this is the reason i choose \"nothing\" in the next answer. contact me, if you are interested in more detailed reasons...", "I hate to say free / nothing... I'll talk to my partners. But personally, I feel my community contributions are \"doing what I can right now.", "Neither, Discord works fine and the others are too expensive for indivdiduals", "none just give me da haxe pls", "Not interested": Free;
			case "Professional": Professional;
			case "Enterprise": Enterprise;
			case "Elite": Elite;
			case "Not in a position to choose", "I still don't use", "For freelancers with regular training via webinar and open contests", "The use of Haxe is not my choice.", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "I'd much rather put money toward specific goals.", "Help to finance a specific target", "One off bug fix priority", "Individual willing to contribute maybe $500 one time. I expect value in return.", "Bounty": Bounty;
			case "I am actively petitioning management to sign up for a support plan, but we are busy working to deliver a proof of concept product to prove the value.", "Professional or Enterprise, but the first is (IMO) opinion too expensive for what it offers and the second is not something my company has the need for yet ", "Paid": Paid;
			case "Hobbyist / Patreon - Please provide a plan around $10-20 a month", "Not against the idea, but definitely no budget for it at the moment. Too bad there is nothing between 0$ and 6500$ / year plan either ", "Individual": Individual;
			case "I don't make enough to be any of the paid offer but if my upcoming game makes enough I would be happy to become pro or more.", "If I had a viable Haxe-based business I would definitely consider a paid plan.  Currently my Haxe usage is limited to support of a commercial failure of mine; I don't use it at work, but I would if I had the opportunity.", "I have supported Haxe conferences, I am in no position to provide support but would like to when my situation changes.", "IfICould": IfICould;
			case "Not sure", "not sure", "no idea", "I dont know", "not decided", "Unsure": Unsure;
			default: throw 'Unknown PlanInterest value "${value}"';
		}
	}

	public static function toString(value:TPlanInterest) : String
	{
		return switch (value)
		{
			case Free: "Free";
			case Professional: "Professional";
			case Enterprise: "Enterprise";
			case Elite: "Elite";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case Bounty: "Bounty";
			case Paid: "Paid";
			case Individual: "Individual";
			case IfICould: "IfICould";
			case Unsure: "Unsure";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { free: 0, professional: 0, enterprise: 0, elite: 0, other: 0, bounty: 0, paid: 0, individual: 0, ificould: 0, unsure: 0 };

		for (answer in data)
		{
			switch (answer.planInterest)
			{
				case Free: count.free++;
				case Professional: count.professional++;
				case Enterprise: count.enterprise++;
				case Elite: count.elite++;
				case Other(_): count.other++;
				case NoAnswer:
				// Added
				case Bounty: count.bounty++;
				case Paid: count.paid++;
				case Individual: count.individual++;
				case IfICould: count.ificould++;
				case Unsure: count.unsure++;
			}
		}

		var baseOther = count.other + count.bounty + count.paid + count.individual + count.ificould + count.unsure;

		// Data
		var baseData = [
			["Free", "Free", '${count.free}'],
			["Professional", "Professional", '${count.professional}'],
			["Enterprise", "Enterprise", '${count.enterprise}'],
			["Elite", "Elite", '${count.elite}'],
		];

		var extendedData = baseData.concat([
			["Bounty", "Bounty", '${count.bounty}'],
			["Paid", "Paid", '${count.paid}'],
			["Individual", "Individual", '${count.individual}'],
			["IfICould", "If I Could", '${count.ificould}'],
			//["Unsure", "Unsure", '${count.unsure}'],
			//["Other", "Other", '${count.other}'],
		]);
		extendedData.shift(); // Remove free from extended data

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "PlanInterest", prettyTitle: "Which of the following support plans would you be interested in?", baseData: baseData, extendedData: extendedData });
	}
}
