import 'package:flutter/material.dart';

import 'football_fields_section_content.dart';

class FootballFieldsSectionView extends StatelessWidget {
  const FootballFieldsSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: FootballFieldsSectionContent(),
    );
  }
}
