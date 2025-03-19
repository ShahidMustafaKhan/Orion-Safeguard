import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  final pageController = PageController(
    initialPage: 0,
  );

  changeNavSelection(int index) {
    var tabs = state.tabs;
    tabs.firstWhere((element) => element.isSelected == true).isSelected = false;
    tabs[index].isSelected = true;
    emit(state.copyWith(tabs: tabs));
  }

  changePage(int index) {
    int selectedIndex = state.tabs.indexOf(
        state.tabs.firstWhere((element) => element.isSelected == true));

    if (index == selectedIndex + 1 || index == selectedIndex - 1) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      pageController.jumpToPage(index);
    }
    changeNavSelection(index);
  }
}
