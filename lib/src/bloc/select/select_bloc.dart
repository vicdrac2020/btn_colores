import 'dart:async';

import 'package:btn_colores/src/models/item_model_select.dart';
import 'package:btn_colores/src/bloc/select/select_state.dart';
import 'package:btn_colores/src/bloc/select/select_event.dart';
class SelectBloc {
  SelectState _selectState = SelectState();

  StreamController<SelectEvent> _input = StreamController();
  StreamController<List<ItemModel>> _output =
      StreamController<List<ItemModel>>.broadcast();

  StreamSink<SelectEvent> get sendEvent => _input.sink;
  Stream<List<ItemModel>> get selectStream => _output.stream;

  SelectBloc() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(SelectEvent event) {
    if (event is AddSelectItemEvent) {
      _selectState.addToSelect(event.item);
    } else if (event is RemoveSelectItemEvent) {
      _selectState.removeFromSelect(event.item);
    }

    _output.add(_selectState.select);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}