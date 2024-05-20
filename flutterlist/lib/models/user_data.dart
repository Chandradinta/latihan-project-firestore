class UserData {
  String nama;
  int umur;
  String email;

  UserData(this.nama, this.umur, this.email);

  Map<String, dynamic> toJson() {
    return {"nama": nama, "umur": umur, "email": email};
  }
}
