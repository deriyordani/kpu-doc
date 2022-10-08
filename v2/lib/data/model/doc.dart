class DocFile {
  DocFile({
    this.unid,
    this.unid_author_employee,
    this.label,
    this.file,
    this.type,
  });

  String? unid;
  String? unid_author_employee;
  String? label;
  String? file;
  String? type;

  factory DocFile.fromJson(Map<String, dynamic> json) => DocFile(
        unid: json["unid"],
        unid_author_employee: json["unid_author_employee"],
        label: json["label"],
        file: json["file"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "unid": unid,
        "unid_author_employee": unid_author_employee,
        "label": label,
        "file": file,
        "type": type
      };
}
