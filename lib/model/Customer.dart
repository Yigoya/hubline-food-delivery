class Customer {
  int id;
  String fullname;
  String password;
  String email;
  int phonenumber;

  Customer({
    required this.id,
    required this.fullname,
    required this.password,
    required this.email,
    required this.phonenumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'password': password,
      'email': email,
      'phonenumber': phonenumber,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'],
      fullname: map['fullname'],
      password: map['password'],
      email: map['email'],
      phonenumber: map['phonenumber'],
    );
  }
}
