import 'package:flutter/material.dart';

import '../models/refuge_category.dart';

class CategorySelector extends StatelessWidget {
  final RefugeCategory? selectedCategory;
  final ValueChanged<RefugeCategory?> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = RefugeCategory.values;

    return SizedBox(
      height: 64,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return Center(
              child: ChoiceChip(
                label: const Text('Todas'),
                selected: selectedCategory == null,
                onSelected: (_) {
                  onCategorySelected(null);
                },
              ),
            );
          }

          final category = categories[index - 1];

          return Center(
            child: ChoiceChip(
              label: Text(category.label),
              selected: selectedCategory == category,
              onSelected: (_) {
                onCategorySelected(category);
              },
            ),
          );
        },
      ),
    );
  }
}
