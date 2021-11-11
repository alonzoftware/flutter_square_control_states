class Square {
  //Simple Variables -------------------------- Begin
  final double posX;
  final double posY;
  final String dir;
  Square({required this.posX, required this.posY, required this.dir});
  //Simple Variables -------------------------- End

  Square copyWith({
    double? posX,
    double? posY,
    String? dir,
  }) {
    return Square(
      posX: posX ?? this.posX,
      posY: posY ?? this.posY,
      dir: dir ?? this.dir,
    );
  }
}
