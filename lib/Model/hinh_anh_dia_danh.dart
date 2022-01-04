class HinhAnhDiaDanh {
  int? id;
  String? diaDanhId;
  String? duongDan;

  HinhAnhDiaDanh(
      {this.id,
      this.diaDanhId,
      this.duongDan,});

  HinhAnhDiaDanh.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    diaDanhId = json['DiaDanhId'];
    duongDan = json['DuongDan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['DiaDanhId'] = this.diaDanhId;
    data['DuongDan'] = this.duongDan;
    return data;
  }
}