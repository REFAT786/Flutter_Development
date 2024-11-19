class Images {
  const Images._();
  static String get onBoarding1 => 'onboarding1'.png;
  static String get onBoarding2 => 'onboarding2'.png;
  static String get onBoarding3 => 'onboarding3'.png;

  static String get burger1 => 'burger1'.jpg;
  static String get burger2 => 'burger2'.png;
  static String get burger3 => 'burger3'.jpg;
  static String get burger4 => 'burger4'.png;

  static String get pizza1 => 'pizza1'.png;
  static String get pizza2 => 'pizza2'.jpg;
  static String get pizza3 => 'pizza3'.png;
  static String get pizza4 => 'pizza4'.jpg;
  static String get pizza5 => 'pizza5'.png;

  static String get rice1 => 'rice1'.jpeg;
  static String get rice2 => 'rice2'.png;
  static String get rice3 => 'rice3'.jpeg;
  static String get rice4 => 'rice4'.jpeg;

  static String get sub1 => 'sub1'.png;
  static String get sub2 => 'sub2'.png;
  static String get sub3 => 'sub3'.jpeg;
  static String get sub4 => 'sub4'.png;
  static String get sub5 => 'sub5'.png;
  static String get congratulation => 'congratulation'.png;

  static String get cover1 => 'cover1'.jpeg;
  static String get cover2 => 'cover2'.png;
  static String get cover3 => 'cover3'.png;
  static String get cover4 => 'cover4'.jpeg;

  static String get appLogo => 'applogo'.jpg;
}

extension on String {
  String get svg => 'assets/images/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
}
