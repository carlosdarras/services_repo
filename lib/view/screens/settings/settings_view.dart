import 'package:flutter/material.dart';
import 'package:services_repo/view/screens/settings/settings_content.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsContent(),
    );
  }
}
