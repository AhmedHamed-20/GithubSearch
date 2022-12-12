import 'package:flutter/material.dart';
import 'package:gethubsearch/core/const/const.dart';
import 'package:gethubsearch/core/widget/defaults.dart';

import '../../../../core/const/text_editing_controllers.dart';
import '../widgets/search_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GitHub Search',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context) * 0.3,
                child: Center(
                  child: Text(
                    'Search About User',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: AppFontSize.s36,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: AppHeight.h10),
              Defaults.defaultTextField(
                prefixIcon: Icon(
                  Icons.text_fields,
                  color: Theme.of(context).iconTheme.color,
                ),
                context: context,
                controller: TextEditingControllers.userNameController,
                title: 'Username',
              ),
              const SizedBox(height: AppHeight.h20),
              const SearchButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
