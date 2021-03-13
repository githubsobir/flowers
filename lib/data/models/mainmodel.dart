class MainModel {
  dynamic status;
  List<GetDataMain> data;
  MainModel.fromJson(Map<String, dynamic> json):
      status = json["status"],
      data = List<GetDataMain>.from(json["data"]. map((x) => GetDataMain.fromJson(x)));

}

class GetDataMain {
  dynamic id;
  String name;
  String icons;

  GetDataMain.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        icons = json['icons'];
}