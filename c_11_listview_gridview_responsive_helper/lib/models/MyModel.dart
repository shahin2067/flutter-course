
class MyModel {

  String? brandId;
  String? brandName;
  String? brandImage;
  String? totalMobile;

  MyModel({
      this.brandId, 
      this.brandName, 
      this.brandImage, 
      this.totalMobile,});

  MyModel.fromJson(dynamic json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandImage = json['brand_image'];
    totalMobile = json['total_mobile'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['brand_id'] = brandId;
    map['brand_name'] = brandName;
    map['brand_image'] = brandImage;
    map['total_mobile'] = totalMobile;
    return map;
  }

}