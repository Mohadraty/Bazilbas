import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResponsiveApp extends StatelessWidget {
  final Widget mobileDevice;
  final Widget tabletDevice;
  final Widget desktopDevice;

  const ResponsiveApp({
    super.key,
    required this.mobileDevice,
    required this.tabletDevice,
    required this.desktopDevice,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return mobileDevice;
          } else if (constraints.maxWidth < 1100) {
            return tabletDevice;
          } else {
            return desktopDevice;
          }
        },
      ),
    );
  }
}
