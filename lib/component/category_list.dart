import 'package:flutter/material.dart';
import 'package:line_today_clone/generated/l10n.dart';
import 'package:line_today_clone/model/news_category.dart';
import 'package:line_today_clone/util/constant.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key? key,
    required this.onCategoryChanged,
  }) : super(key: key);

  final void Function(NewsCategory) onCategoryChanged;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  NewsCategory _selectedCategory = NewsCategory.values[0];
  final categoryStr = [
    S.current.business,
    S.current.entertainment,
    S.current.general,
    S.current.health,
    S.current.science,
    S.current.sports,
    S.current.technology
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: NewsCategory.values.map((c) {
          return TextButton(
            onPressed: () {
              setState(() => _selectedCategory = c);
              widget.onCategoryChanged(c);
            },
            child: Text(
              toBeginningOfSentenceCase(categoryStr[c.index])!,
              style: TextStyle(
                color:
                    c == _selectedCategory ? MColor.PRIMARY_COLOR : Colors.grey,
                fontWeight: c == _selectedCategory
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
