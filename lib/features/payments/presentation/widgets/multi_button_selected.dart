import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/theme/app_theme.dart';

enum PlanViewType { monthly, yearly }

class MultiButtonSelected extends StatefulWidget {
  const MultiButtonSelected({super.key});

  @override
  State<MultiButtonSelected> createState() => _MultiButtonSelectedState();
}

class _MultiButtonSelectedState extends State<MultiButtonSelected> {
  PlanViewType _selectedView = PlanViewType.monthly;

  void _onViewChanged(PlanViewType viewType) {
    setState(() {
      _selectedView = viewType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SelectOptionButton(
      selectedView: _selectedView,
      onViewChanged: _onViewChanged,
    );
  }
}

class SelectOptionButton extends StatelessWidget {
  final PlanViewType selectedView;
  final Function(PlanViewType) onViewChanged;

  const SelectOptionButton({
    super.key,
    required this.selectedView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppTheme.primaryColor, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => onViewChanged(PlanViewType.monthly),
              splashColor: AppTheme.bgColor,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(50),
                    bottomStart: Radius.circular(50),
                  ),
                  color: selectedView == PlanViewType.monthly
                      ? AppTheme.primaryColor
                      : Colors.white,
                ),
                child: Center(
                  child: Text(
                    'MENSUAL',
                    style: TextStyle(
                      color: selectedView == PlanViewType.monthly
                          ? Colors.white
                          : AppTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onViewChanged(PlanViewType.yearly),
              splashColor: AppTheme.bgColor,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(50),
                    bottomEnd: Radius.circular(50),
                  ),
                  color: selectedView == PlanViewType.yearly
                      ? AppTheme.primaryColor
                      : Colors.white,
                ),
                child: Center(
                  child: Text(
                    'ANUAL',
                    style: TextStyle(
                      color: selectedView == PlanViewType.yearly
                          ? Colors.white
                          : AppTheme.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
