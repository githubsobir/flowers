import 'dart:convert';

class ProductModelOne {
  dynamic status;
  List<ProductModel> data;

  ProductModelOne.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        data = List<ProductModel>.from(
            json["data"].map((x) => ProductModel.fromJson(x)));
}
// MainModel.fromJson(Map<String, dynamic> json):
//       status = json["status"],
//       data = List<GetDataMain>.from(json["data"]. map((x) => GetDataMain.fromJson(x)));
//
// }

class ProductModel {
  bool likeButton = false;
  dynamic id;
  dynamic favorite;
  dynamic name;
  dynamic structure;
  dynamic heigth;
  dynamic descriptions;
  dynamic productStatusId;
  dynamic sellersId;
  dynamic prices;
  dynamic viewCount;
  dynamic soldCount;
  dynamic categoriesId;

  dynamic subCategory;
  dynamic reytingBall;
  dynamic reytingCount;
  dynamic image;
  dynamic size;
  dynamic countFlower;
  dynamic recommendation;
  dynamic countriesId;
  List<ProductModelImages> images;

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        favorite = json["favorite"],
        structure = json["structure"],
        heigth = json["height"],
        name = json["name"],
        descriptions = json["descriptions"],
        sellersId = json["sellers_id"],
        productStatusId = json["product_statuses_id"],
        prices = json["prices"],
        viewCount = json["views_cnt"],
        soldCount = json["sold_cnt"],
        categoriesId = json["categories_id"],
        subCategory = json["subcategories_id"],
        reytingBall = json["reyting_balls"],
        reytingCount = json["reyting_cnt"],
        image = json["image_url"],
        size = json["size"],
        countFlower = json["cnt_flora"],
        recommendation = json["recommendation"],
        countriesId = json["countries_id"],
        // data = List<GetDataMain>.from(json["data"]. map((x) =>
        // GetDataMain.fromJson(x)));
        images = List<ProductModelImages>.from(
            json["images"].map((x) => ProductModelImages.fromJson(x)));
}

class ProductModelImages {
  dynamic id;
  dynamic productId;
  String image;
  dynamic sortId;

  ProductModelImages.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        productId = json["products_id"],
        image = json["url"],
        sortId = json["sort_id"];
}
