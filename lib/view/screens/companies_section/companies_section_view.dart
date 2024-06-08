import 'package:flutter/material.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';
import 'package:services_repo/view/screens/companies_section//companies_section_content.dart';

class CompaniesSectionView extends StatelessWidget {
  const CompaniesSectionView({ super.key, required this.serviceName});
  final String serviceName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(text: "Companies",),
      ),
      body: CompaniesSectionContent(serviceName: serviceName,),
    );
  }
}
