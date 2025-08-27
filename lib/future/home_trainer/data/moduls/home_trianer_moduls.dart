

class CourseModel {
  String? name;
  String? title;
  int? phone;
  num? price;
  CourseModel({this.name, this.title, this.phone, this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'title': title,
      'phone': phone,
      'price': price,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      name: map['name'] ,
      title: map['title'],
      phone: map['phone'] ,
      price: map['price'] ,
    );
  }

}
