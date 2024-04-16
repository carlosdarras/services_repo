import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(Artboard artboard,{stateMachine = ""}) {
    StateMachineController? controller = StateMachineController.fromArtboard(artboard, stateMachine);
    print('hteddd sccconteor  ${controller}');
    artboard.addController(controller!);
    return controller;
  }
}
