class UserDob {
  final String date;
  final String age;

  UserDob({required this.date, required this.age});

  factory UserDob.fromMap(Map<String, dynamic> json) {
    return UserDob(
      date: json['date']??'', 
    age: json['age'].toString());
  }
}
