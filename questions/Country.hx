package questions;

enum TCountry
{
	Bulgaria;
	Russia;
	Spain;
	Germany;
	Latvia;
	Portugal;
	Belarus;
	France;
	Mexico;
	Ukraine;
	Australia;
	Slovenia;
	Denmark;
	Austria;
	China;
	UnitedKingdom;
	SouthAfrica;
	UnitedStates;
	HongKong;
	Canada;
	Netherlands;
	Italy;
	Belgium;
	BosniaHerzegovina;
	UnitedArabEmirates;
	NewZealand;
	Brazil;
	Luxembourg;
	Japan;
	CzechRepublic;
	Turkey;
	Guatemala;
	Sweden;
	Libya;
	Norway;
	Switzerland;
	Slovakia;
	Argentina;
	Hungary;
	Philippines;
	Aruba;
	Poland;
	Azerbaijan;
	Vietnam;
	India;
	Colombia;
	Georgia;
	Moldova;
	Israel;
	Finland;
	KoreaSouth;
	PuertoRico;
	Bangladesh;
	Indonesia;
	Romania;
	SaudiArabia;
	Iran;
	Egypt;
	Syria;
	Greece;
	Nigeria;
	Ireland;
	FaroeIslands;
	NoAnswer;
}

class Country
{
	public static function parse(value:String) : TCountry
	{
		return switch (value)
		{
			case "Bulgaria": Bulgaria;
			case "Russia": Russia;
			case "Spain": Spain;
			case "Germany": Germany;
			case "Latvia": Latvia;
			case "Portugal": Portugal;
			case "Belarus": Belarus;
			case "France": France;
			case "Mexico": Mexico;
			case "Ukraine": Ukraine;
			case "Australia": Australia;
			case "Slovenia": Slovenia;
			case "Denmark": Denmark;
			case "Austria": Austria;
			case "China": China;
			case "United Kingdom", "UnitedKingdom": UnitedKingdom;
			case "South Africa", "SouthAfrica": SouthAfrica;
			case "United States", "UnitedStates": UnitedStates;
			case "Hong Kong", "HongKong": HongKong;
			case "Canada": Canada;
			case "Netherlands": Netherlands;
			case "Italy": Italy;
			case "Belgium": Belgium;
			case "Bosnia and Herzegovina", "BosniaHerzegovina": BosniaHerzegovina;
			case "United Arab Emirates", "UnitedArabEmirates": UnitedArabEmirates;
			case "New Zealand", "NewZealand": NewZealand;
			case "Brazil": Brazil;
			case "Luxembourg": Luxembourg;
			case "Japan": Japan;
			case "Czech Republic", "CzechRepublic": CzechRepublic;
			case "Turkey": Turkey;
			case "Guatemala": Guatemala;
			case "Sweden": Sweden;
			case "Libya": Libya;
			case "Norway": Norway;
			case "Switzerland": Switzerland;
			case "Slovakia": Slovakia;
			case "Argentina": Argentina;
			case "Hungary": Hungary;
			case "Philippines": Philippines;
			case "Aruba": Aruba;
			case "Poland": Poland;
			case "Azerbaijan": Azerbaijan;
			case "Vietnam": Vietnam;
			case "India": India;
			case "Colombia": Colombia;
			case "Georgia": Georgia;
			case "Moldova": Moldova;
			case "Israel": Israel;
			case "Finland": Finland;
			case "Korea, South", "KoreaSouth": KoreaSouth;
			case "Puerto Rico", "PuertoRico": PuertoRico;
			case "Bangladesh": Bangladesh;
			case "Indonesia": Indonesia;
			case "Romania": Romania;
			case "Saudi Arabia", "SaudiArabia": SaudiArabia;
			case "Iran": Iran;
			case "Egypt": Egypt;
			case "Syria": Syria;
			case "Greece": Greece;
			case "Nigeria": Nigeria;
			case "Ireland": Ireland;
			case "Faroe Islands", "FaroeIslands": FaroeIslands;
			case "": NoAnswer;
			default: throw 'Unknown Country value "${value}"';
		}
	}

	public static function toString(value:TCountry) : String
	{
		return switch (value)
		{
			case Bulgaria: "Bulgaria";
			case Russia: "Russia";
			case Spain: "Spain";
			case Germany: "Germany";
			case Latvia: "Latvia";
			case Portugal: "Portugal";
			case Belarus: "Belarus";
			case France: "France";
			case Mexico: "Mexico";
			case Ukraine: "Ukraine";
			case Australia: "Australia";
			case Slovenia: "Slovenia";
			case Denmark: "Denmark";
			case Austria: "Austria";
			case China: "China";
			case UnitedKingdom: "UnitedKingdom";
			case SouthAfrica: "SouthAfrica";
			case UnitedStates: "UnitedStates";
			case HongKong: "HongKong";
			case Canada: "Canada";
			case Netherlands: "Netherlands";
			case Italy: "Italy";
			case Belgium: "Belgium";
			case BosniaHerzegovina: "BosniaHerzegovina";
			case UnitedArabEmirates: "UnitedArabEmirates";
			case NewZealand: "NewZealand";
			case Brazil: "Brazil";
			case Luxembourg: "Luxembourg";
			case Japan: "Japan";
			case CzechRepublic: "CzechRepublic";
			case Turkey: "Turkey";
			case Guatemala: "Guatemala";
			case Sweden: "Sweden";
			case Libya: "Libya";
			case Norway: "Norway";
			case Switzerland: "Switzerland";
			case Slovakia: "Slovakia";
			case Argentina: "Argentina";
			case Hungary: "Hungary";
			case Philippines: "Philippines";
			case Aruba: "Aruba";
			case Poland: "Poland";
			case Azerbaijan: "Azerbaijan";
			case Vietnam: "Vietnam";
			case India: "India";
			case Colombia: "Colombia";
			case Georgia: "Georgia";
			case Moldova: "Moldova";
			case Israel: "Israel";
			case Finland: "Finland";
			case KoreaSouth: "KoreaSouth";
			case PuertoRico: "PuertoRico";
			case Bangladesh: "Bangladesh";
			case Indonesia: "Indonesia";
			case Romania: "Romania";
			case SaudiArabia: "SaudiArabia";
			case Iran: "Iran";
			case Egypt: "Egypt";
			case Syria: "Syria";
			case Greece: "Greece";
			case Nigeria: "Nigeria";
			case Ireland: "Ireland";
			case FaroeIslands: "FaroeIslands";
			case NoAnswer: "";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { bulgaria: 0, russia: 0, spain: 0, germany: 0, latvia: 0, portugal: 0, belarus: 0, france: 0, mexico: 0, ukraine: 0, australia: 0, slovenia: 0, denmark: 0, austria: 0, china: 0, unitedkingdom: 0, southafrica: 0, unitedstates: 0, hongkong: 0, canada: 0, netherlands: 0, italy: 0, belgium: 0, bosniaherzegovina: 0, unitedarabemirates: 0, newzealand: 0, brazil: 0, luxembourg: 0, japan: 0, czechrepublic: 0, turkey: 0, guatemala: 0, sweden: 0, libya: 0, norway: 0, switzerland: 0, slovakia: 0, argentina: 0, hungary: 0, philippines: 0, aruba: 0, poland: 0, azerbaijan: 0, vietnam: 0, india: 0, colombia: 0, georgia: 0, moldova: 0, israel: 0, finland: 0, koreasouth: 0, puertorico: 0, bangladesh: 0, indonesia: 0, romania: 0, saudiarabia: 0, iran: 0, egypt: 0, syria: 0, greece: 0, nigeria: 0, ireland: 0, faroeislands: 0 };

		for (answer in data)
		{
			switch (answer.location)
			{
				case Bulgaria: count.bulgaria++;
				case Russia: count.russia++;
				case Spain: count.spain++;
				case Germany: count.germany++;
				case Latvia: count.latvia++;
				case Portugal: count.portugal++;
				case Belarus: count.belarus++;
				case France: count.france++;
				case Mexico: count.mexico++;
				case Ukraine: count.ukraine++;
				case Australia: count.australia++;
				case Slovenia: count.slovenia++;
				case Denmark: count.denmark++;
				case Austria: count.austria++;
				case China: count.china++;
				case UnitedKingdom: count.unitedkingdom++;
				case SouthAfrica: count.southafrica++;
				case UnitedStates: count.unitedstates++;
				case HongKong: count.hongkong++;
				case Canada: count.canada++;
				case Netherlands: count.netherlands++;
				case Italy: count.italy++;
				case Belgium: count.belgium++;
				case BosniaHerzegovina: count.bosniaherzegovina++;
				case UnitedArabEmirates: count.unitedarabemirates++;
				case NewZealand: count.newzealand++;
				case Brazil: count.brazil++;
				case Luxembourg: count.luxembourg++;
				case Japan: count.japan++;
				case CzechRepublic: count.czechrepublic++;
				case Turkey: count.turkey++;
				case Guatemala: count.guatemala++;
				case Sweden: count.sweden++;
				case Libya: count.libya++;
				case Norway: count.norway++;
				case Switzerland: count.switzerland++;
				case Slovakia: count.slovakia++;
				case Argentina: count.argentina++;
				case Hungary: count.hungary++;
				case Philippines: count.philippines++;
				case Aruba: count.aruba++;
				case Poland: count.poland++;
				case Azerbaijan: count.azerbaijan++;
				case Vietnam: count.vietnam++;
				case India: count.india++;
				case Colombia: count.colombia++;
				case Georgia: count.georgia++;
				case Moldova: count.moldova++;
				case Israel: count.israel++;
				case Finland: count.finland++;
				case KoreaSouth: count.koreasouth++;
				case PuertoRico: count.puertorico++;
				case Bangladesh: count.bangladesh++;
				case Indonesia: count.indonesia++;
				case Romania: count.romania++;
				case SaudiArabia: count.saudiarabia++;
				case Iran: count.iran++;
				case Egypt: count.egypt++;
				case Syria: count.syria++;
				case Greece: count.greece++;
				case Nigeria: count.nigeria++;
				case Ireland: count.ireland++;
				case FaroeIslands: count.faroeislands++;
				case NoAnswer:
			}
		}

		// Data
		var baseData = [
			["Bulgaria", "Bulgaria", '${count.bulgaria}'],
			["Russia", "Russia", '${count.russia}'],
			["Spain", "Spain", '${count.spain}'],
			["Germany", "Germany", '${count.germany}'],
			["Latvia", "Latvia", '${count.latvia}'],
			["Portugal", "Portugal", '${count.portugal}'],
			["Belarus", "Belarus", '${count.belarus}'],
			["France", "France", '${count.france}'],
			["Mexico", "Mexico", '${count.mexico}'],
			["Ukraine", "Ukraine", '${count.ukraine}'],
			["Australia", "Australia", '${count.australia}'],
			["Slovenia", "Slovenia", '${count.slovenia}'],
			["Denmark", "Denmark", '${count.denmark}'],
			["Austria", "Austria", '${count.austria}'],
			["China", "China", '${count.china}'],
			["UnitedKingdom", "United Kingdom", '${count.unitedkingdom}'],
			["SouthAfrica", "South Africa", '${count.southafrica}'],
			["UnitedStates", "United States", '${count.unitedstates}'],
			["HongKong", "Hong Kong", '${count.hongkong}'],
			["Canada", "Canada", '${count.canada}'],
			["Netherlands", "Netherlands", '${count.netherlands}'],
			["Italy", "Italy", '${count.italy}'],
			["Belgium", "Belgium", '${count.belgium}'],
			["BosniaHerzegovina", "Bosnia and Herzegovina", '${count.bosniaherzegovina}'],
			["UnitedArabEmirates", "United Arab Emirates", '${count.unitedarabemirates}'],
			["NewZealand", "New Zealand", '${count.newzealand}'],
			["Brazil", "Brazil", '${count.brazil}'],
			["Luxembourg", "Luxembourg", '${count.luxembourg}'],
			["Japan", "Japan", '${count.japan}'],
			["CzechRepublic", "Czech Republic", '${count.czechrepublic}'],
			["Turkey", "Turkey", '${count.turkey}'],
			["Guatemala", "Guatemala", '${count.guatemala}'],
			["Sweden", "Sweden", '${count.sweden}'],
			["Libya", "Libya", '${count.libya}'],
			["Norway", "Norway", '${count.norway}'],
			["Switzerland", "Switzerland", '${count.switzerland}'],
			["Slovakia", "Slovakia", '${count.slovakia}'],
			["Argentina", "Argentina", '${count.argentina}'],
			["Hungary", "Hungary", '${count.hungary}'],
			["Philippines", "Philippines", '${count.philippines}'],
			["Aruba", "Aruba", '${count.aruba}'],
			["Poland", "Poland", '${count.poland}'],
			["Azerbaijan", "Azerbaijan", '${count.azerbaijan}'],
			["Vietnam", "Vietnam", '${count.vietnam}'],
			["India", "India", '${count.india}'],
			["Colombia", "Colombia", '${count.colombia}'],
			["Georgia", "Georgia", '${count.georgia}'],
			["Moldova", "Moldova", '${count.moldova}'],
			["Israel", "Israel", '${count.israel}'],
			["Finland", "Finland", '${count.finland}'],
			["KoreaSouth", "South Korea", '${count.koreasouth}'],
			["PuertoRico", "Puerto Rico", '${count.puertorico}'],
			["Bangladesh", "Bangladesh", '${count.bangladesh}'],
			["Indonesia", "Indonesia", '${count.indonesia}'],
			["Romania", "Romania", '${count.romania}'],
			["SaudiArabia", "Saudi Arabia", '${count.saudiarabia}'],
			["Iran", "Iran", '${count.iran}'],
			["Egypt", "Egypt", '${count.egypt}'],
			["Syria", "Syria", '${count.syria}'],
			["Greece", "Greece", '${count.greece}'],
			["Nigeria", "Nigeria", '${count.nigeria}'],
			["Ireland", "Ireland", '${count.ireland}'],
			["FaroeIslands", "Faroe Islands", '${count.faroeislands}'],
		];

		// Export
		Data.export({ title: "country", prettyTitle: "Where are you geographically located?", baseData: baseData });
	}
}
