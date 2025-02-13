enum PlaceType { Beach, Church, Waterfall, Restaurant }

class Place {
  final String name;
  final String imagePath;
  final PlaceType type;
  bool isSelected;

  Place({
    required this.name,
    required this.imagePath,
    required this.type,
    this.isSelected = false,
  });
}