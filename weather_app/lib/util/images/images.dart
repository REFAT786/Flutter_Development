class Images {
  const Images._();
  static String get profileImage => 'profile'.jpg;
  static String get splashImage => 'splash'.png;
}

extension on String {
  String get svg => 'assets/images/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
}