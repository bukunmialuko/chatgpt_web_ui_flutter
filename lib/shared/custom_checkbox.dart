import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color? checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;
  final String? text;
  final double? fontSize;
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.white,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor,
    this.borderRadius,
    this.splashRadius,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
    this.text,
    this.fontSize,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;
  late Color _filledColor;

  @override
  void initState() {
    _filledColor = widget.checkedFillColor ?? AppColors.accentGreen;
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = _filledColor;
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = widget.uncheckedFillColor;
        iconColor = widget.uncheckedIconColor;
        iconData = widget.uncheckedIcon;
        break;
    }

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius:
            BorderRadius.all(Radius.circular(widget.borderRadius ?? 2)),
        border: Border.all(
          color: widget.shouldShowBorder
              ? (widget.borderColor ?? const Color(0xffC1C1C1))
              : (!widget.value
                  ? (widget.borderColor ?? AppColors.greyIcons.withOpacity(0.8))
                  : Colors.transparent),
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: _buildIcon(),
          onPressed: () => widget.onChanged(!_checked),
          tooltip: widget.tooltip,
          mouseCursor: widget.mouseCursors ?? SystemMouseCursors.click,
        ),
        Text(
          widget.text ?? "",
          style: TextStyle(
            fontSize: widget.fontSize ?? 14,
            color: AppColors.greyIcons,
          ),
        )
      ],
    );
  }
}

enum CheckStatus {
  checked,
  unchecked,
}
