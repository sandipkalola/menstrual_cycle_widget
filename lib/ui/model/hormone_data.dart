class HormoneData {
  final int day;
  final double estrogen;
  final double progesterone;
  final String phase;

  HormoneData(this.day, this.estrogen, this.progesterone, this.phase);

  String get phaseWithDay => " Dat $phase";
}
