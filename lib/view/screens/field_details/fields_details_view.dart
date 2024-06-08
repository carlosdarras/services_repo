import 'package:flutter/material.dart';
import 'package:services_repo/data/models/footballFieldModel.dart';
import 'package:services_repo/view/common_widgets/text_widget.dart';
import 'package:services_repo/view/screens/field_details/fields_details_content.dart';

class FieldsDetailsView extends StatelessWidget {
  const FieldsDetailsView({Key? key, required this.footballFieldModel}) : super(key: key);
  final FootballFieldModel footballFieldModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: footballFieldModel.name!,
        ),
      ),
      body: FieldsDetailsContent(footballFieldModel: footballFieldModel,),
    );
  }
}
