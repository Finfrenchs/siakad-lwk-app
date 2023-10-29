import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final bool useExtraPadding;
  final double paddingTop;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    this.body,
    this.useExtraPadding = false,
    this.paddingTop = 20.0,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.primary,
      body: useExtraPadding
          ? Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 120.0,
                  margin: const EdgeInsets.only(top: 60.0),
                  padding: const EdgeInsets.only(bottom: 60.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: paddingTop),
                  child: body,
                ),
              ],
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 60.0),
              padding: const EdgeInsets.only(bottom: 60.0),
              decoration: const BoxDecoration(
                color: ColorResource.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.0),
                ),
              ),
              child: body,
            ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
