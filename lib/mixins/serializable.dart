library ui_mixins;

typedef JSON = Map<String, dynamic>;

abstract class Serializable {

  //

  Serializable.fromMap(JSON data);

  //

  JSON toMap();

}