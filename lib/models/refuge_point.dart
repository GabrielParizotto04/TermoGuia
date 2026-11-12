import 'refuge_category.dart';

class RefugePoint {
  final String name;
  final String address;
  final String openingHours;
  final String imagePath;
  final List<RefugeCategory> categories;
  final bool featured;

  const RefugePoint({
    required this.name,
    required this.address,
    required this.openingHours,
    required this.imagePath,
    required this.categories,
    this.featured = false,
  });
}
