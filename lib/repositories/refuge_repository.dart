import '../models/refuge_category.dart';
import '../models/refuge_point.dart';

class RefugeRepository {
  static const List<RefugePoint> _points = [
    RefugePoint(
      name: 'Praça das Árvores',
      address: 'Rua das Flores, 100 — Bairro Modelo',
      openingHours: 'Todos os dias, das 6h às 20h',
      imagePath: 'assets/images/praca.jpg',
      categories: [
        RefugeCategory.shade,
        RefugeCategory.drinkingWater,
        RefugeCategory.restArea,
      ],
      featured: true,
    ),
    RefugePoint(
      name: 'Biblioteca do Bairro',
      address: 'Avenida Central, 250 — Bairro Modelo',
      openingHours: 'Segunda a sexta, das 8h às 18h',
      imagePath: 'assets/images/biblioteca.jpg',
      categories: [
        RefugeCategory.airConditioning,
        RefugeCategory.drinkingWater,
        RefugeCategory.restArea,
      ],
      featured: true,
    ),
    RefugePoint(
      name: 'UBS Comunidade',
      address: 'Rua da Saúde, 45 — Bairro Modelo',
      openingHours: 'Segunda a sexta, das 7h às 19h',
      imagePath: 'assets/images/unidade_saude.jpg',
      categories: [
        RefugeCategory.healthCare,
        RefugeCategory.drinkingWater,
        RefugeCategory.restArea,
      ],
      featured: true,
    ),
    RefugePoint(
      name: 'Parque do Encontro',
      address: 'Rua dos Ipês, 320 — Bairro Modelo',
      openingHours: 'Todos os dias, das 6h às 18h',
      imagePath: 'assets/images/praca.jpg',
      categories: [RefugeCategory.shade, RefugeCategory.restArea],
    ),
    RefugePoint(
      name: 'Centro Cultural Horizonte',
      address: 'Avenida do Bairro, 700 — Bairro Modelo',
      openingHours: 'Terça a domingo, das 9h às 17h',
      imagePath: 'assets/images/biblioteca.jpg',
      categories: [
        RefugeCategory.airConditioning,
        RefugeCategory.drinkingWater,
        RefugeCategory.restArea,
      ],
    ),
    RefugePoint(
      name: 'Unidade de Saúde Esperança',
      address: 'Rua da União, 80 — Bairro Modelo',
      openingHours: 'Segunda a sexta, das 8h às 17h',
      imagePath: 'assets/images/unidade_saude.jpg',
      categories: [RefugeCategory.healthCare, RefugeCategory.drinkingWater],
    ),
  ];

  List<RefugePoint> getAll() {
    return List<RefugePoint>.unmodifiable(_points);
  }

  List<RefugePoint> getByCategory(RefugeCategory? category) {
    if (category == null) {
      return getAll();
    }

    return _points
        .where((point) => point.categories.contains(category))
        .toList();
  }

  List<RefugePoint> getFeatured() {
    return _points.where((point) => point.featured).toList();
  }
}
