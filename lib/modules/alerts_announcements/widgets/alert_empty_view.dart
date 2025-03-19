import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/no_data_found.dart';

import '../../../generated/assets.dart';

class AlertEmptyView extends StatelessWidget {
  const AlertEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoDataFound(
      title: "No alerts found",
      image: Assets.pngMegaphone,
      spacer: 5,
    );
  }
}
