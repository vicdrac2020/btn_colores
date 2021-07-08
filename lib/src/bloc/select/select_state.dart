import 'package:btn_colores/src/models/item_model_select.dart';

class SelectState {
  List<ItemModel> _select = [];

  SelectState._();
  static SelectState _instance = SelectState._();
  factory SelectState() => _instance;

  List<ItemModel> get select => _select;

  void addToSelect(ItemModel itemModel) {
    _select.add(itemModel);
  }

  void removeFromSelect(ItemModel itemModel) {
    _select.remove(itemModel);
  }
}