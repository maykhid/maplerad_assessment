import 'package:flutter/material.dart';
import 'package:maplerad_assessment/shared/ui/app_colors.dart';
import 'package:maplerad_assessment/shared/ui/app_icons.dart';
import 'package:maplerad_assessment/shared/ui/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class MapleradKeypad extends StatefulWidget {
  /// [onCompleteAction] A callback function that is invoked when the input is complete
  /// (i.e., when the length of the input reaches inputLength)
  final void Function()? onCompleteAction;

  /// [onDoneAction] A callback function that can be invoked when the input is done.
  /// This function takes the current input as a parameter.
  final void Function(String)? onDoneAction;

  /// [onChanged] A callback that is invoked whenever keypad value changes
  final void Function(String, Map)? onChanged;

  /// An integer that specifies the length of the input (default is 6).
  /// Make sure this always equals the field length
  final int inputLength;

  const MapleradKeypad({
    this.onCompleteAction,
    this.onDoneAction,
    this.inputLength = 6,
    this.onChanged,
    super.key,
  });

  @override
  State<MapleradKeypad> createState() => _MapleradKeypadState();
}

class _MapleradKeypadState extends State<MapleradKeypad> {
  void Function()? _onCompleteAction;

  void Function(String)? _onDoneAction;
  void Function(String, Map)? _onChanged;
  late int _inputLength;

  final inputs = [];
  bool showActionButtons = false;

  @override
  void initState() {
    super.initState();
    _onCompleteAction = widget.onCompleteAction;

    _onDoneAction = widget.onDoneAction;
    _inputLength = widget.inputLength;
    _onChanged = widget.onChanged;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (inputs.length == _inputLength) {
      _onCompleteAction?.call();
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
                      style: AppTextStyles.medium24Avenir,
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

  void _input(String text) {
    if (inputs.length != _inputLength) {
      setState(() {
        inputs.add(text);
      });
      _onChanged!(inputs.join(), inputs.asMap());
    }
  }

  void _backspace() {
    if (inputs.isNotEmpty) {
      setState(() {
        inputs.removeLast();
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
    return InkWell(
      splashColor: AppColors.lightBlue, // Splash color
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30.0),
      customBorder: const CircleBorder(),
      child: SizedBox(
        height: 80,
        width: 80,
        child: UnconstrainedBox(child: child),
      ),
    );
  }
}
