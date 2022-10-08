class User {
  User({
    //this.id,
    this.unid,
    this.unid_employee,
    this.username,
    this.email,
    this.full_name,
    this.id_number,
    this.position,
    this.photo,
    this.level,
  });

  //int? id;
  String? unid;
  String? unid_employee;
  String? username;
  String? email;
  String? full_name;
  String? id_number;
  String? position;
  String? photo;
  String? level;

  factory User.fromJson(Map<String, dynamic> json) => User(
      // id: json["id"] != null ? int.parse(json["id"].toString()) : null,
      unid: json["unid"],
      unid_employee: json["unid_employee"],
      username: json["username"],
      email: json["email"],
      full_name: json["full_name"],
      id_number: json["id_number"],
      position: json["postion"],
      photo: json["photo"],
      level: json["level"]);

  Map<String, dynamic> toJson() => {
        //  "id": id,
        "unid": unid,
        "unid_employee": unid_employee,
        "email": email,
        "full_name": full_name,
        "id_number": id_number,
        "position": position,
        "photo": photo,
        "level": level
      };
}
