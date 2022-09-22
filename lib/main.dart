import 'package:flutter/material.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const LedControllerApp());
}

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class LedControllerApp extends StatelessWidget {
  const LedControllerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Led Controller',
      darkTheme: ThemeData.dark(),
      home: const HomeRoute(),
    );
  }
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('IR Led Controller'),
      ),
      body: Center(
        child: FutureBuilder<bool>(
            future: IrSensorPlugin.hasIrEmitter,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final hasIr = snapshot.data!;
                if (hasIr) {
                  IrSensorPlugin.setFrequencies(38000);
                  return const KeyBoard();
                } else {
                  return const Text('Your device have no ir sensor');
                }
              } else if (snapshot.hasError) {
                return const Text('Error occured. Try again');
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

class KeyBoard extends StatelessWidget {
  const KeyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerIconButton(
                  commandByte: LedContollerButtons.brightnessUp,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.brightness_high),
                      Icon(Icons.arrow_upward),
                    ],
                  ),
                ),
                ControllerIconButton(
                  commandByte: LedContollerButtons.brightnessDown,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.brightness_high),
                      Icon(Icons.arrow_downward),
                    ],
                  ),
                ),
                const ControllerIconButton(
                  backgroundColor: Colors.black,
                  commandByte: LedContollerButtons.play,
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                ),
                const ControllerIconButton(
                  backgroundColor: Colors.red,
                  commandByte: LedContollerButtons.turnOnOff,
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerTextButton(
                  backgroundColor: Colors.red,
                  label: 'R',
                  commandByte: LedContollerButtons.red,
                ),
                ControllerTextButton(
                  backgroundColor: Colors.green,
                  label: 'G',
                  commandByte: LedContollerButtons.green,
                ),
                ControllerTextButton(
                  backgroundColor: Colors.blue,
                  label: 'B',
                  commandByte: LedContollerButtons.blue,
                ),
                ControllerTextButton(
                  backgroundColor: Colors.white,
                  label: 'W',
                  commandByte: LedContollerButtons.white,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerFlatButton(
                  commandByte: LedContollerButtons.red1,
                  backgroundColor: Colors.orange[900]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.green1,
                  backgroundColor: Colors.green[400]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.blue1,
                  backgroundColor: Colors.blue[400]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.white1,
                  backgroundColor: Colors.pink[50]!,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerFlatButton(
                  commandByte: LedContollerButtons.red2,
                  backgroundColor: Colors.orange[700]!,
                ),
                const ControllerFlatButton(
                  commandByte: LedContollerButtons.green2,
                  backgroundColor: Colors.cyan,
                ),
                const ControllerFlatButton(
                  commandByte: LedContollerButtons.blue2,
                  backgroundColor: Colors.deepPurple,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.white2,
                  backgroundColor: Colors.pink[50]!,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerFlatButton(
                  commandByte: LedContollerButtons.red3,
                  backgroundColor: Colors.yellow[800]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.green3,
                  backgroundColor: Colors.cyan[800]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.blue3,
                  backgroundColor: Colors.deepPurple[700]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.white3,
                  backgroundColor: Colors.blue[200]!,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ControllerFlatButton(
                  commandByte: LedContollerButtons.red4,
                  backgroundColor: Colors.yellow,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.green4,
                  backgroundColor: Colors.cyan[600]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.blue4,
                  backgroundColor: Colors.deepPurple[300]!,
                ),
                ControllerFlatButton(
                  commandByte: LedContollerButtons.white4,
                  backgroundColor: Colors.blue[200]!,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ControllerIconButton(
                  commandByte: LedContollerButtons.redUp,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
                ),
                const ControllerIconButton(
                  commandByte: LedContollerButtons.greenUp,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.green,
                  ),
                ),
                const ControllerIconButton(
                  commandByte: LedContollerButtons.blueUP,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                  ),
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.quick,
                  label: 'QUICK',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ControllerIconButton(
                  commandByte: LedContollerButtons.redDown,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.red,
                  ),
                ),
                const ControllerIconButton(
                  commandByte: LedContollerButtons.greenDown,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.green,
                  ),
                ),
                const ControllerIconButton(
                  commandByte: LedContollerButtons.blueDown,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Colors.blue,
                  ),
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.slow,
                  label: 'SLOW',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerTextButton(
                  commandByte: LedContollerButtons.diy1,
                  label: 'DIY1',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.diy2,
                  label: 'DIY2',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.diy3,
                  label: 'DIY3',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.auto,
                  label: 'AUTO',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerTextButton(
                  commandByte: LedContollerButtons.diy4,
                  label: 'DIY4',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.diy5,
                  label: 'DIY5',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.diy6,
                  label: 'DIY6',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.flash,
                  label: 'FLASH',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ControllerTextButton(
                  commandByte: LedContollerButtons.jump3,
                  label: 'JUMP3',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.jump7,
                  label: 'JUMP7',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.fade3,
                  label: 'FADE3',
                ),
                ControllerTextButton(
                  commandByte: LedContollerButtons.fade7,
                  label: 'FADE7',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ControllerIconButton extends ControllerButton {
  const ControllerIconButton({
    Key? key,
    required super.commandByte,
    super.backgroundColor,
    required Widget icon,
  }) : super(key: key, child: icon);
}

class ControllerFlatButton extends ControllerButton {
  const ControllerFlatButton({
    Key? key,
    required super.commandByte,
    required super.backgroundColor,
  }) : super(key: key, child: const SizedBox.shrink());
}

class ControllerTextButton extends ControllerButton {
  ControllerTextButton({
    Key? key,
    required String label,
    required super.commandByte,
    super.backgroundColor,
  }) : super(
          key: key,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
}

class ControllerButton extends StatelessWidget {
  const ControllerButton({
    Key? key,
    required this.commandByte,
    this.backgroundColor = Colors.white,
    required this.child,
  }) : super(key: key);

  final size = const Size(70, 54);
  final int commandByte;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        emulateKey(commandByte);
        HapticFeedback.vibrate();
      },
      child: Ink(
        color: backgroundColor,
        width: size.width,
        height: size.height,
        child: Center(
          child: child,
        ),
      ),
    );
  }

  /// TODO: Refactor this code
  List<int> encodeToNec(int byte) {
    const header = [9000, 4500];
    const end = [562];
    const logicalZero = [562, 562];
    const logicalOne = [562, 1687];

    final deviceAddress = [];
    for (int bit = 0; bit < 8; bit++) {
      deviceAddress.addAll(logicalZero);
    }
    for (int bit = 0; bit < 8; bit++) {
      deviceAddress.addAll(logicalOne);
    }

    List<int> encodedByte = [];
    for (int bit = 0; bit < 8; bit++) {
      final shiftedByte = byte >> bit;
      final checkBit = shiftedByte & 1;
      final isCheckBitOne = checkBit == 1;
      // 173 -> 10101101
      if (isCheckBitOne) {
        encodedByte.addAll(logicalOne);
      } else {
        encodedByte.addAll(logicalZero);
      }
    }
    for (int bit = 0; bit < 8; bit++) {
      final shiftedByte = byte >> bit;
      final checkBit = shiftedByte & 1;
      final isCheckBitOne = checkBit == 1;
      // 173 -> 10101101
      if (isCheckBitOne) {
        encodedByte.addAll(logicalZero);
      } else {
        encodedByte.addAll(logicalOne);
      }
    }

    return [...header, ...deviceAddress, ...encodedByte, ...end];
  }

  void emulateKey(int key) {
    IrSensorPlugin.transmitListInt(list: encodeToNec(key));
  }
}

class LedContollerButtons {
  static const brightnessUp = 92;
  static const brightnessDown = 93;

  static const play = 65;
  static const turnOnOff = 64;

  static const red = 88;
  static const redUp = 20;
  static const redDown = 16;
  static const red1 = 84;
  static const red2 = 80;
  static const red3 = 28;
  static const red4 = 24;

  static const green = 89;
  static const greenUp = 21;
  static const greenDown = 17;
  static const green1 = 85;
  static const green2 = 81;
  static const green3 = 29;
  static const green4 = 25;

  static const blue = 69;
  static const blueUP = 22;
  static const blueDown = 18;
  static const blue1 = 73;
  static const blue2 = 77;
  static const blue3 = 30;
  static const blue4 = 26;

  static const white = 68;
  static const white1 = 72;
  static const white2 = 76;
  static const white3 = 31;
  static const white4 = 27;

  static const quick = 23;
  static const slow = 19;

  static const diy1 = 12;
  static const diy2 = 13;
  static const diy3 = 14;
  static const diy4 = 8;
  static const diy5 = 9;
  static const diy6 = 10;

  static const auto = 15;
  static const flash = 11;
  static const jump3 = 4;
  static const jump7 = 5;
  static const fade3 = 6;
  static const fade7 = 7;
}
