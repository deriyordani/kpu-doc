class Employee {
  Employee({
    this.position,
    this.id_number,
    this.full_name,
    // this.gender,
    // this.birth_place,
    // this.birth_date,
    // this.no_phone,
    // this.username,
    // this.password,
    // this.email,
    //this.category,
    // this.level
  });

  String? position;
  String? id_number;
  String? full_name;
  // String? gender;
  // String? birth_place;
  // String? birth_date;
  // String? no_phone;
  // String? username;
  // String? password;
  // String? email;
  // String? level;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        position: json["position"],
        id_number: json["id_number"],
        full_name: json["full_name"],
        // gender: json["gender"],
        // birth_place: json["birth_place"],
        // birth_date: json["birth_date"],
        // no_phone: json["no_phone"],
        // username: json["username"],
        // password: json["password"],
        // email: json["email"],
        // level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "id_number": id_number,
        "full_name": full_name,
        // "gender": gender,
        // "birth_place": birth_place,
        // "birth_date": birth_date,
        // "no_phone": no_phone,
        // "username": username,
        // "password": password,
        // "email": email,
        // "level": level,
      };
}
