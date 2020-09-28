class User
{
  final String id;
  final String name;
  final String email;
  final String phone;
  final String status;
  final String picture;

  User(this.id, this.name, this.email, this.phone, this.status, this.picture);

  User.fromJson(Map<String, dynamic> json) :
  id = json['id_user'].toString(),
  name = json['name'],
  email = json['email'],
  phone = json['phone'],
  status = json['status'],
  picture = json['picture'];

  Map<String, dynamic> toJson() =>
    {
      'id_user': id,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
      'picture': picture
    };

  static User getEmpty() => User('', '', '', '', '', '');
}