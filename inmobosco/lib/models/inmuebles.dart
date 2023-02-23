class InmuebleResponse {
  String?tipo;
  String?descripcion;
  int?precio;
  String?ubicacion;
  int?metrosCuadrados;
  int?numBanios;
  int?numHab;

  InmuebleResponse(
      {this.tipo,
      this.descripcion,
      this.precio,
      this.ubicacion,
      this.metrosCuadrados,
      this.numBanios,
      this.numHab});

  InmuebleResponse.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    ubicacion = json['ubicacion'];
    metrosCuadrados = json['metrosCuadrados'];
    numBanios = json['numBanios'];
    numHab = json['numHab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;
    data['ubicacion'] = this.ubicacion;
    data['metrosCuadrados'] = this.metrosCuadrados;
    data['numBanios'] = this.numBanios;
    data['numHab'] = this.numHab;
    return data;
  }
}