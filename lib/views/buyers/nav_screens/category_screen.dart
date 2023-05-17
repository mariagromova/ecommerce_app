import 'package:ecommerce_app/views/ui_additional_widgets.dart/colors.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> _categoryLabel = ["food", "vegetable", "egg", "tea","food", "vegetable", "egg", "tea",];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Categories'),
        Container(
          height: 40,
          child: Row(
            children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryLabel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActionChip(
                          backgroundColor: elementsColor,
                          onPressed: () {},
                          label: Center(
                            child: Text(
                              _categoryLabel[index],
                              style: TextStyle(color: basicColor, fontSize: 12,
                              fontWeight: FontWeight.bold),
                            ),
                          )),
                    );
                  }),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
        )
      ]),
    );
  }
}
