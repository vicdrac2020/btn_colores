import 'package:btn_colores/src/models/item_model_select.dart';

abstract class SelectEvent {}

class AddSelectItemEvent extends SelectEvent {
  final ItemModel item;

  AddSelectItemEvent(this.item);
}

class RemoveSelectItemEvent extends SelectEvent {
  final ItemModel item;

  RemoveSelectItemEvent(this.item);
}

class GetSelectEvent extends SelectEvent {}
