import 'package:meta/meta.dart';

class CardModel {
  CardModel({
    this.isFaceUp = false,
    this.isMatched = false,
    this.isSelectable = false,
    this.isSelected = false,
    @required this.cardFaceAssetPath,
  });

  final bool isFaceUp;
  final bool isMatched;
  final bool isSelectable;
  final bool isSelected;
  final String cardFaceAssetPath;

  CardModel copyWith({
    bool isFaceUp,
    bool isMatched,
    bool isSelectable,
    bool isSelected,
    String cardFace,
  }) =>
      CardModel(
        isFaceUp: isFaceUp ?? this.isFaceUp,
        isMatched: isMatched ?? this.isMatched,
        isSelectable: isSelectable ?? this.isSelectable,
        isSelected: isSelected ?? this.isSelected,
        cardFaceAssetPath: cardFace ?? this.cardFaceAssetPath,
      );
}
