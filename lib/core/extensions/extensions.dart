extension StringExtention on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return replaceFirst(this[0], this[0].toUpperCase());
  }
}

extension IdConverter on int {
  String toStr() => toString();
}
