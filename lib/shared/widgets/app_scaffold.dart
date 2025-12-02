import 'package:flutter/material.dart';
import 'package:zuap_mobile_app/shared/widgets/app_drawer.dart';

/// Helper mixin para agregar automáticamente el AppDrawer a cualquier pantalla
/// Uso: class MyScreen extends StatefulWidget with DrawerMixin
mixin DrawerMixin on Widget {
  /// Retorna el drawer que debe ser usado en el Scaffold
  static Widget getDrawer() => const AppDrawer();
}

/// Scaffold personalizado que automáticamente incluye el AppDrawer
/// Uso: Reemplaza Scaffold con AppScaffold en tus pantallas
class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool hasDrawer;

  const AppScaffold({
    super.key,
    this.body,
    this.backgroundColor,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.hasDrawer = true, // Por defecto incluye el drawer
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: hasDrawer ? const AppDrawer() : null,
    );
  }
}
