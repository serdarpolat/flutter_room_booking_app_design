const double minWidth = 0.0;
const double avatarStartSize = 44;
const double avatarEndSize = 120;
const double avatarStartMarginTop = 36;
const double avatarEndMarginTop = 80;
const double avatarVerticalSpacing = 24;
const double avatarHorizontalSpacing = -24;

class Payment {
  final String title;
  final String logo;
  final bool selected;

  Payment(this.title, this.logo, this.selected);
}

List<Payment> payments = [
  Payment('**** 3187', 'assets/icons/mastercard.png', true),
  Payment('jennifermartin', 'assets/icons/visa.png', false),
];

class User {
  final String name;
  final String email;
  final String image;

  User(this.name, this.email, this.image);
}

final List<User> users = [
  User('Laura Robinson', 'laura@example.net',
      'assets/images/pexels-photo-1065084.jpeg'),
  User('John Carter', 'john@example.net',
      'assets/images/pexels-photo-614810.jpeg'),
  User('Jennifer Martin', 'jennifer@example.net', 'assets/images/photo.jpeg'),
];
