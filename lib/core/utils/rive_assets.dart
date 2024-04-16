import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src, this.artboard, this.stateMachineName, this.title);

  set setInput(SMIBool status) {
    input = status;
  }
}
