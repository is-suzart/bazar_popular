
class CreateProductFormModel {
   final String title;
   final String subtitle;
   final String name;
   final String value;
   final String isPromo;
   final String quantidadePromo;
   final String valuePromo;
   final String storage;
   final String? place;

  CreateProductFormModel( {required this.title, required this.subtitle, required this.name, required this.value, required this.isPromo, required this.quantidadePromo, required this.valuePromo, required this.storage, this.place});

}