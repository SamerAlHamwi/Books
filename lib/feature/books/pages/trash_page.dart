
import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';
import '../widgets/book_widget.dart';


class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trash',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            color: Colors.pink
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        leading: const SizedBox(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(9, (index) {
              return const BookWidget();
            }),
          ),
        ),
      ),
    );
  }
}
