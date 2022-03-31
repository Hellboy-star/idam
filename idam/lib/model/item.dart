class Item {
  late String firstname;
  late String lastname;
  late String birthday;
  late String adress;
  late int phone;
  late String mail;
  late String gender;
  late String image;
  late String citation;

  Item(this.firstname, this.lastname, this.birthday, this.adress, this.phone, this.mail, this.gender, this.image, this.citation);

  Item.fromJson(Map<String, dynamic> json)
  :firstname = json['firstname'],
  lastname = json['lastname'],
  birthday = json['birthday'],
  adress = json['adress'],
  phone = json['phone'],
  mail = json['mail'],
  gender = json['gender'],
  image = json['image'],
  citation = json['citation'];

  Map<String, dynamic> toJson([Map<String, dynamic>? map]) => {
    'firstname' : firstname,
    'lastname' : lastname,
    'birthday' : birthday,
    'adress' : adress,
    'phone' : phone,
    'mail' : mail,
    'gender' : gender,
    'image' : image,
    'citation' : citation,

  };

}



