class DiaDanh {
  int? id;
  String? tenDiaDanh;
  String? viTri;
  String? moTa;

  DiaDanh({
    this.id,
    this.tenDiaDanh,
    this.viTri,
    this.moTa,
  });

  DiaDanh.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenDiaDanh = json['TenDiaDanh'];
    viTri = json['ViTri'];
    moTa = json['MoTa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TenDiaDanh'] = this.tenDiaDanh;
    data['ViTri'] = this.viTri;
    data['MoTa'] = this.moTa;
    return data;
  }
}
