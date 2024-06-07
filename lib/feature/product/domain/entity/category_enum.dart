enum CategoryList implements Category{
  rybnitsa(_mens,'assets/png/man.png'),
  tiraspol(_jewelery,'assets/png/uv.png'),
  dubosary(_electronics,'assets/png/el.png'),
  grigariopol(_women,'assets/png/woman.png');

  const CategoryList(this.name, this.path);

  final String Function() name;
  final String path;
}

String _mens() => 'mens';
String _jewelery() => 'jewelery';
String _electronics() => 'electronics';
String _women() => 'womens';


abstract class Category {
  final String Function() name;
  final String path;
  const Category(this.name, this.path);
}