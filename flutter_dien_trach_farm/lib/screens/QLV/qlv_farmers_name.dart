
class Farmer{
  int id;
  String name;

  Farmer(this.id, this.name);
  @override
  String toString() => name;
 factory Farmer.fromJson(Map<String, dynamic> json){
    return new Farmer(json['id'], json['name']);
  }
}

final lsFarmerSuggestion = <Farmer>[
  Farmer(1, 'Nguyễn Văn An'),
  Farmer(2, 'Lê Văn Bình'),
  Farmer(3, 'Bùi Văn Cường'),
  Farmer(4, 'Đào Văn Dương'),
  Farmer(5, 'Phạm Văn Đức'),
  Farmer(6, 'Trần Thị Giang'),
  Farmer(7, 'Nguyễn Văn Hà'),
  Farmer(8, 'Ngô Quyền Linh'),
  Farmer(9, 'Phan Thị Khánh'),
  Farmer(10, 'Vũ Văn Minh'),
];
