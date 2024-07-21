class PlantsModel {
  List<Plant>? plants;
  Links? links;

  PlantsModel({
    this.plants,
    this.links,
  });

  PlantsModel.fromJson(Map<String, dynamic> json) {
    plants = (json['data'] as List?)?.map((dynamic e) => Plant.fromJson(e as Map<String,dynamic>)).toList();
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
  }

}

class Plant {
  int? id;
  String? commonName;
  String? scientificName;
  int? year;
  String? bibliography;
  String? author;
  String? status;
  String? familyCommonName;
  String? imageUrl;
  String? family;
  Links? links;

  Plant({
    this.id,
    this.commonName,
    this.scientificName,
    this.year,
    this.bibliography,
    this.author,
    this.status,
    this.familyCommonName,
    this.imageUrl,
    this.family,
    this.links,
  });

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name']??'NA';
    scientificName = json['scientific_name']??"NA";
    year = json['year']?? -1;
    bibliography = json['bibliography']??"NA";
    author = json['author']??"NA";
    status = json['status']??"NA";
    familyCommonName = json['family_common_name']??"NA";
    imageUrl = json['image_url'];
    family = json['family'];
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
  }

}

class Links {
  String? self;
  String? first;
  String? next;
  String? last;

  Links({
    this.self,
    this.first,
    this.next,
    this.last,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    first = json['first'];
    next = json['next'];
    last = json['last'];
  }
}

