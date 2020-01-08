class PendingList {
  String _debtorName;
  String _amount;
  String _dueDate;
  String _debtorContactNumber;
  String _debtorEmail;

  PendingList(this._debtorName, this._amount, this._dueDate,
      this._debtorContactNumber, this._debtorEmail);

  PendingList.map(dynamic obj) {
    this._debtorName = obj['debtorName'];
    this._amount = obj['amount'];
    this._dueDate = obj['dueDate'];
    this._debtorContactNumber = obj['debtorContactNumber'];
    this._debtorEmail = obj['debtorEmail'];
  }

  String get debtorName => _debtorName;
  String get amount => _amount;
  String get dueDate => _dueDate;
  String get debtorContactNumber => _debtorContactNumber;
  String get debtorEmail => _debtorEmail;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['debtorName'] = _debtorName;
    map['amount'] = _amount;
    map['dueDate'] = _dueDate;
    map['debtorContactNumber'] = _debtorContactNumber;
    map['debtorEmail'] = _debtorEmail;
    return map;
  }

  PendingList.fromMap(Map<String, dynamic> map) {
    this._debtorName = map['debtorName'];
    this._amount = map['amount'];
    this._dueDate = map['dueDate'];
    this._debtorContactNumber = map['debtorContactNumber'];
    this._debtorEmail = map['debtorEmail'];
  }
}
