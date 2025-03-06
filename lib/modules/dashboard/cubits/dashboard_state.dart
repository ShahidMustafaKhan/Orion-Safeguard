import '../../../generated/assets.dart';
import '../model/dashboard_model.dart';

class DashboardState {
  final List<BottomNavModel> tabs;

  factory DashboardState.initial() {
    return DashboardState(tabs: [
      BottomNavModel(
        title: 'Home',
        selectedIcon: Assets.svgHomeSelected,
        isSelected: true,
        unSelectedIcon: Assets.svgHomeUnselected,
      ),
      BottomNavModel(
        title: 'My Shifts',
        isSelected: false,
        selectedIcon: Assets.svgShiftSelected,
        unSelectedIcon: Assets.svgShiftUnselected,
      ),
      BottomNavModel(
        title: 'Records',
        isSelected: false,
        selectedIcon: Assets.svgCalendarSelected,
        unSelectedIcon: Assets.svgCalendarUnselected,
      ),
      BottomNavModel(
        title: 'Alerts',
        isSelected: false,
        selectedIcon: Assets.svgVolumeSelected,
        unSelectedIcon: Assets.svgVolumeUnselected,
      ),
    ]);
  }

  DashboardState({required this.tabs});

  DashboardState copyWith({List<BottomNavModel>? tabs}) {
    return DashboardState(
      tabs: tabs ?? this.tabs,
    );
  }
}
