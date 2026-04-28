/// Scrollable landing sections: hero (0) through contact ([sectionCount] - 1).
class HomeLayout {
  HomeLayout._();

  static const int sectionCount = 7;

  static int clampIndex(int index) {
    if (index < 0) return 0;
    if (index >= sectionCount) return sectionCount - 1;
    return index;
  }
}
