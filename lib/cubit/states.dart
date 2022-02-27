abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

// ignore: camel_case_types
class modechangeapp extends NewsStates {}

// ignore: camel_case_types
class bootomnavState extends NewsStates {}

// ignore: camel_case_types
//class bottomcolors extends NewsStates {}

// ignore: camel_case_types
class newsGetSucessStates extends NewsStates {}

// ignore: camel_case_types
class newslodingStests extends NewsStates {}

// ignore: camel_case_types
class newserrorgetstates extends NewsStates {
  late final String error;
  newserrorgetstates(this.error);
}

// ignore: camel_case_types
class newsGetsportSucessStates extends NewsStates {}

// ignore: camel_case_types
class newslodingsportStests extends NewsStates {}

// ignore: camel_case_types
class newserrorsportgetstates extends NewsStates {
  late final String error;
  newserrorsportgetstates(this.error);
}

// ignore: camel_case_types
class newsGetscienssSucessStates extends NewsStates {}

// ignore: camel_case_types
class newslodingsscinessStests extends NewsStates {}

// ignore: camel_case_types
class newserrorscienssgetstates extends NewsStates {
  late final String error;
  newserrorscienssgetstates(this.error);
}

//ignore: camel_case_types
class newsGetsearchSucessStates extends NewsStates {}

// ignore: camel_case_types
class newslodingsearchStests extends NewsStates {}

// ignore: camel_case_types
class newserrorsearchgetstates extends NewsStates {
  late final String error;
  newserrorsearchgetstates(this.error);
}
