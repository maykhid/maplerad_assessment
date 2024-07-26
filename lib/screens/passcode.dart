import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';
import 'package:maplerad_assessment/shared/ui/app_icons.dart';
import 'package:maplerad_assessment/shared/ui/sized_context.dart';
import 'package:svg_flutter/svg.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  Map _keyMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   width: context.width,
          //   height: 30,
          // ),
          Text(
            'Create pin',
            style: GoogleFonts.bricolageGrotesque(
              textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            'Pin should be 6 to 12 digits long',
            style: GoogleFonts.bricolageGrotesque(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey),
            ),
          ),
          const Gap(200),
          _PasscodeField(keyMap: _keyMap),
          const Spacer(),
          NumericKeypad(
            onCompleteType: () {
              print('onComplete');
            },
            onChanged: (input, map) {
              print('OnChanged: $input');
              setState(() {
                _keyMap = map ?? {};
              });
            },
            onDoneAction: (input) {},
            onStartType: () {
              print('start typing');
            },
          ),
          const Gap(40),
        ],
      ),
    );
  }
}

class _PasscodeField extends StatelessWidget {
  const _PasscodeField({
    this.keyMap = const {},
  });

  final Map keyMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return _PasscodeDot(
            hasChar: keyMap.containsKey(index),
          );
        }),
      ),
    );
  }
}

class _PasscodeDot extends StatelessWidget {
  const _PasscodeDot({
    required this.hasChar,
  });

  final bool hasChar;

  @override
  Widget build(BuildContext context) {
    return hasChar
        ? Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: UnconstrainedBox(
              child: AnimatedContainer(
                duration: const Duration(seconds: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          )
        : Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: AppColors.pinGrey,
              borderRadius: BorderRadius.circular(7),
            ),
          );
  }
}

class NumericKeypad extends StatefulWidget {
  final void Function()? onCompleteType;
  final void Function()? onStartType;
  final void Function(String)? onDoneAction;
  final void Function(String, Map?)? onChanged;
  final int inputLength;

  const NumericKeypad({
    this.onCompleteType,
    this.onStartType,
    this.onDoneAction,
    this.inputLength = 6,
    this.onChanged,
    super.key,
  });

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  void Function()? _onCompleteType;
  void Function()? _onStartType;
  void Function(String)? _onDoneAction;
  void Function(String, Map?)? _onChanged;
  late int _inputLength;
  // late bool _showActionButtons;

  final inputs = [];
  bool showActionButtons = false;

  @override
  void initState() {
    super.initState();
    _onCompleteType = widget.onCompleteType;
    _onStartType = widget.onStartType;
    _onDoneAction = widget.onDoneAction;
    _inputLength = widget.inputLength;
    _onChanged = widget.onChanged;
    // _controller = widget.controller..addListener(_onSelectionChanged);
    // _selection = _controller.selection;
    // _focusNode = widget.focusNode;
  }

  @override
  void dispose() {
    // _controller.removeListener(_onSelectionChanged);
    super.dispose();
  }

  // void _onSelectionChanged() {
  //   setState(() {
  //     _selection = _controller.selection;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (inputs.length == _inputLength) {
      _onCompleteType?.call();
    }

    if (inputs.isNotEmpty && inputs.length == 1) {
      _onStartType?.call();
    }

    showActionButtons = inputs.isNotEmpty;

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        for (final keyRow in keyValues)
          TableRow(
            children: List.generate(
              keyRow.length,
              (index) {
                final keyCell = keyRow[index];
                if (keyCell == 'right') {
                  return Visibility(
                    visible: showActionButtons,
                    child: _Key(
                      onPressed: () => _onDoneAction,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.blue,
                        child: SvgPicture.asset(AppIcons.arrowRightRound2),
                        // height: 48,
                        // width: 48,
                        // height: 48,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(34),
                        //   color: AppColors.blue,
                        // ),
                      ),
                    ),
                  );
                }

                if (keyCell == 'left') {
                  return Visibility(
                    visible: showActionButtons,
                    child: _Key(
                      onPressed: () => _backspace(),
                      child: SvgPicture.asset(AppIcons.eraser),
                    ),
                  );
                }

                return _Key(
                  onPressed: () => _input(keyCell),
                  child: Center(
                    child: Text(
                      keyCell,
                      style: const TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  List<List<String>> get keyValues {
    return [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['left', '0', 'right'],
    ];
  }

  // _hideKeyboard() => _focusNode.unfocus();

  // return Column(
  //   children: [
  //     Row(
  //       children: [
  //         _buildButton('1'),
  //         _buildButton('2'),
  //         _buildButton('3'),
  //       ],
  //     ),
  //     const Gap(35),
  //     Row(
  //       children: [
  //         _buildButton('4'),
  //         _buildButton('5'),
  //         _buildButton('6'),
  //       ],
  //     ),
  //     const Gap(35),
  //     Row(
  //       children: [
  //         _buildButton('7'),
  //         _buildButton('8'),
  //         _buildButton('9'),
  //       ],
  //     ),
  //     const Gap(35),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         showActionButtons
  //             ? InkWell(
  //                 onTap: _backspace,
  //                 child: SvgPicture.asset(AppIcons.eraser),
  //               )
  //             // _buildButton('⌫', onPressed: _backspace)
  //             : Container(),
  //         _buildButton('0'),
  //         showActionButtons
  //             ? InkWell(
  //                 onTap: _backspace,
  //                 child: SvgPicture.asset(AppIcons.eraser),
  //               )
  //             : Container(),
  //       ],
  //     ),
  //   ],
  // );

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed ?? () => _input(text),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Avenir',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    if (inputs.length != _inputLength) {
      setState(() {
        inputs.add(text);
        print(inputs);
      });
      _onChanged!(inputs.join(), inputs.asMap());
    }

    // int position = _selection.base.offset;

    // var value = _controller.text;
    // if (value.isNotEmpty) {
    //   var suffix = value.substring(position, value.length);
    //   value = value.substring(0, position) + text + suffix;
    //   _controller.text = value;
    //   _controller.selection =
    //       TextSelection.fromPosition(TextPosition(offset: position + 1));
    // } else {
    //   value = _controller.text + text;
    //   _controller.text = value;
    //   _controller.selection =
    //       TextSelection.fromPosition(const TextPosition(offset: 1));
    // }
  }

  void _backspace() {
    if (inputs.isNotEmpty) {
      setState(() {
        inputs.removeLast();
        print(inputs);
      });
      _onChanged!(inputs.join(), inputs.asMap());
    }
  }
}

class _Key extends StatelessWidget {
  const _Key({
    required this.onPressed,
    required this.child,
  });

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: InkWell(
        enableFeedback: false,
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
