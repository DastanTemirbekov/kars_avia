/* External dependencies */
import 'package:flutter/material.dart';

/* Local dependencies */
import 'package:kars_avia/features/presentation/widgets/custom_appbar.dart';
import 'package:kars_avia/features/presentation/widgets/custom_bottom_navigation.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Сообщения'),
      bottomNavigationBar: const CustomBottomNavigation(currentPage: 2),
    );
  }
}
