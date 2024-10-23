

class BookModel {
  final String name, imagePath;
  final int id,type;
  int status = 0;
  final DateTime lastUpdate;

  BookModel({required this.name,required this.imagePath,required this.id,required this.type,required this.lastUpdate,});

}