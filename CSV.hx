import sys.io.File;

class CSV
{
	public static function get(content:String) : Array<Answer>
	{
		var rawData = load(content);
		return parse(rawData);
	}

	public static function getFromFile(filename:String) : Array<Answer>
	{
		var content = File.getContent(filename);
		return get(content);
	}

	public static function export(answers:Array<Answer>) : String
	{
		var buf = new StringBuf();

		for (answer in answers)
		{
			buf.add('"${answer.date}"');
			buf.addChar(','.code);
			buf.add('"${questions.UseType.toString(answer.useType)}"');
			buf.addChar(','.code);
			buf.add('"${questions.ProgLength.toString(answer.progLength)}"');
			buf.addChar(','.code);
			buf.add('"${questions.HaxeLength.toString(answer.haxeLength)}"');
			buf.addChar(','.code);
			buf.add('"${questions.OrgSize.toString(answer.orgSize)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Usages.toString(answer.usages)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Targets.toString(answer.targets)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Country.toString(answer.location)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Install.toString(answer.install)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Publish.toString(answer.publish)}"');
			buf.addChar(','.code);
			buf.add('"${questions.DesktopOS.toString(answer.desktopOS)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Browser.toString(answer.browser)}"');
			buf.addChar(','.code);
			buf.add('"${questions.MobileOS.toString(answer.mobileOS)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Libraries.toString(answer.libraries)}"');
			buf.addChar(','.code);
			buf.add('"${questions.IDE.toString(answer.ide)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Communication.toString(answer.communication)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Salary.toString(answer.salary)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Macros.toString(answer.macros)}"');
			buf.addChar(','.code);
			buf.add('"${questions.KnowPaid.toString(answer.knowPaid)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Partner.toString(answer.partner)}"');
			buf.addChar(','.code);
			buf.add('"${questions.PlanInterest.toString(answer.planInterest)}"');
			buf.addChar(','.code);
			buf.add('"${questions.Support.toString(answer.support)}"');
			buf.add(',""\n'); // Empty email field
		}

		return buf.toString();
	}

	static function load(content:String) : Array<Array<String>>
	{
		var answers = [];
		var buf = new StringBuf();
		var inString = false;
		var currentAnswer = [];

		for (i in 0...content.length)
		{
			var c = content.charCodeAt(i);

			switch (c)
			{
				case '"'.code:
					// Why escape " with "" instead of \" ...
					if (inString && content.charCodeAt(i + 1) == '"'.code && content.charCodeAt(i - 1) != ','.code)
					{
						continue;
					}

					if (inString && content.charCodeAt(i - 1) == '"'.code && !(content.charCodeAt(i + 1) == ','.code || content.charCodeAt(i + 1) == '\n'.code))
					{
						buf.addChar(c);
						continue;
					}

					inString = !inString;

					if (!inString)
					{
						currentAnswer.push(buf.toString());
						buf = new StringBuf();
					}

				case '\n'.code if (!inString):
					//if (currentAnswer.length > 0)
					{
						answers.push(currentAnswer);
						currentAnswer = [];
					}

				case ','.code if (!inString):
					// pass

				default:
					buf.addChar(c);
			}
		}

		return answers;
	}

	static function parse(rawData:Array<Array<String>>) : Array<Answer>
	{
		var answers = [];

		for (i in 0...rawData.length)
		{
			var answer = rawData[i];

			answers.push({
				date: answer[0],
				useType: questions.UseType.parse(answer[1]),
				progLength: questions.ProgLength.parse(answer[2]),
				haxeLength: questions.HaxeLength.parse(answer[3]),
				orgSize: questions.OrgSize.parse(answer[4]),
				usages: questions.Usages.parse(answer[5]),
				targets: questions.Targets.parse(answer[6]),
				location: questions.Country.parse(answer[7]),
				install: questions.Install.parse(answer[8]),
				publish: questions.Publish.parse(answer[9]),
				desktopOS: questions.DesktopOS.parse(answer[10]),
				browser: questions.Browser.parse(answer[11]),
				mobileOS: questions.MobileOS.parse(answer[12]),
				libraries: questions.Libraries.parse(answer[13]),
				ide: questions.IDE.parse(answer[14]),
				communication: questions.Communication.parse(answer[15]),
				salary: questions.Salary.parse(answer[16]),
				macros: questions.Macros.parse(answer[17]),
				knowPaid: questions.KnowPaid.parse(answer[18]),
				partner: questions.Partner.parse(answer[19]),
				planInterest: questions.PlanInterest.parse(answer[20]),
				support: questions.Support.parse(answer[21]),
			});

			if (answer[22] != "")
			{
				throw 'found email in answer ${i + 1}';
			}
		}

		return answers;
	}
}
