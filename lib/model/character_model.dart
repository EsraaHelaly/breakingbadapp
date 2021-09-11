class CharactersModel {
 int charId;
 String name;
 String birthday;
 List<dynamic> jobs;
 String img;
 String status;
 String nickname;
 List<dynamic> appearance;
 String portrayed;
 String category;
 

  CharactersModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    jobs = json['occupation'];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'];
    portrayed = json['portrayed'];
    category = json['category'];

  }
}
