class ItemModel {
  String _item;
  bool _status;
  
  ItemModel(this._item, this._status);

  String get item => _item;
  bool get status => _status;
  set addItem(String item){this._item = item;}
  set addStatus(bool status){this._status = status;}
}