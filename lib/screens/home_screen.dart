import 'package:flutter/material.dart';

import '../models/refuge_category.dart';
import '../models/refuge_point.dart';
import '../repositories/refuge_repository.dart';
import '../widgets/category_selector.dart';
import '../widgets/featured_refuges_section.dart';
import '../widgets/refuge_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefugeRepository _repository = RefugeRepository();

  RefugeCategory? _selectedCategory;

  late List<RefugePoint> _visiblePoints;
  late List<RefugePoint> _featuredPoints;

  @override
  void initState() {
    super.initState();

    _visiblePoints = _repository.getAll();
    _featuredPoints = _repository.getFeatured();
  }

  void _selectCategory(RefugeCategory? category) {
    final filteredPoints = _repository.getByCategory(category);

    setState(() {
      _selectedCategory = category;
      _visiblePoints = filteredPoints;
    });
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.wb_sunny_outlined, size: 32),
                const SizedBox(height: 8),
                Text(
                  'Encontre pontos de refúgio',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Consulte locais com sombra, água, descanso '
                  'e outros recursos.',
                ),
                const SizedBox(height: 8),
                const Text(
                  'Protótipo acadêmico: locais, horários e recursos '
                  'são fictícios. Não há consulta em tempo real.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        FeaturedRefugesSection(points: _featuredPoints),
        const SizedBox(height: 24),
        Text(
          'Filtrar por recurso',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        CategorySelector(
          selectedCategory: _selectedCategory,
          onCategorySelected: _selectCategory,
        ),
        const SizedBox(height: 20),
        Text(
          'Pontos de refúgio (${_visiblePoints.length})',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _visiblePoints.isEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Termoguia')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: isEmpty ? 2 : _visiblePoints.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildHeader(context);
            }

            if (isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text('Nenhum ponto encontrado para esta categoria.'),
                ),
              );
            }

            final point = _visiblePoints[index - 1];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: RefugeListTile(point: point),
            );
          },
        ),
      ),
    );
  }
}
