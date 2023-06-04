import 'package:flutter/material.dart';
import 'package:storybook_flutter/src/knobs/knobs.dart';

/// {@template function_knob_value}
/// A knob value calls function.
///
/// See also:
/// * [FunctionKnobWidget], which is the widget that displays the knob.
/// {@endtemplate}
class FunctionKnobValue extends KnobValue<VoidCallback> {
  FunctionKnobValue({
    required VoidCallback? value,
  }) : super(value: value ?? () => {});

  @override
  Widget build({
    required String label,
    required String? description,
    required bool enabled,
    required bool nullable,
  }) =>
      FunctionKnobWidget(
        label: label,
        description: description,
        value: value,
        enabled: enabled,
        nullable: nullable,
      );
}

/// {@template function_knob_widget}
/// A knob widget that allows the user to call function.
///
/// The knob is displayed as a button.
///
/// See also:
/// * [FunctionKnobValue], which is the knob that this widget represents.
/// {@endtemplate}
class FunctionKnobWidget extends StatelessWidget {
  /// {@macro function_knob_widget}
  const FunctionKnobWidget({
    Key? key,
    required this.label,
    required this.description,
    required this.value,
    required this.enabled,
    required this.nullable,
  }) : super(key: key);

  final String label;
  final String? description;
  final VoidCallback? value;
  final bool enabled;
  final bool nullable;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ElevatedButton(
          onPressed: value,
          child: Text(label),
        ),
        if (description != null)
          Text(
            description!,
            style: textTheme.bodyMedium?.copyWith(
              color: textTheme.bodySmall?.color,
            ),
          )
      ],
    );
  }
}
