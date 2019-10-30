library after_enter_anim;

import 'package:flutter/widgets.dart';

mixin AfterEnterAnimMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ModalRoute.of(context).animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          afterEnterAnim(context);
        }
      });
    });
  }

  void afterEnterAnim(BuildContext context);
}
