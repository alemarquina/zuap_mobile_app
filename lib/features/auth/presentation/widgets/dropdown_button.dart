import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

class DropdownButton extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final String? value;
  final ValueChanged<String?> onChanged;

  const DropdownButton({
    super.key,
    required this.labelText,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  @override
  State<DropdownButton> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButton> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return PopupMenuButton<String>(
          offset: const Offset(0, 72),
          constraints: BoxConstraints.tightFor(width: constraints.maxWidth),
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onOpened: () => setState(() => _isMenuOpen = true),
          onCanceled: () => setState(() => _isMenuOpen = false),
          onSelected: (val) {
            setState(() => _isMenuOpen = false);
            widget.onChanged(val);
          },
          itemBuilder: (context) => widget.options
              .map((opt) => PopupMenuItem(value: opt, child: Text(opt)))
              .toList(),
          child: InputDecorator(
            isFocused: _isMenuOpen,
            isEmpty: widget.value == null,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                color: AppTheme.darkGrayColor,
                letterSpacing: 0,
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppTheme.primaryColor,
                  width: 2.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.value ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0,
                    color: AppTheme.darkColor,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 32,
                  color: _isMenuOpen
                      ? AppTheme.primaryColor
                      : AppTheme.darkGrayColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
