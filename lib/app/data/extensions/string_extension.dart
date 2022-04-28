extension StringExtension on String {
    String capitalizeOnlyFirst() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}