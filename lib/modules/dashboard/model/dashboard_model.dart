class BottomNavModel {
  final String title;
  final String selectedIcon;
  final String unSelectedIcon;
  bool isSelected;

  BottomNavModel({
    required this.title,
    required this.isSelected,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}
