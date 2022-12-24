class AccountModel {
  String? feeName;
  String? dateAD;
  String? dateBS;
  String? monthName;
  String? receiptNumber;
  num? amount;
  bool? feeStatus;

  AccountModel(
      {this.feeName,
      this.dateAD,
      this.dateBS,
      this.monthName,
      this.receiptNumber,
      this.amount,
      this.feeStatus});

  AccountModel.fromJson(Map<String, dynamic> json) {
    feeName = json['FeeName'];
    dateAD = json['DateAD'];
    dateBS = json['DateBS'];
    monthName = json['MonthName'];
    receiptNumber = json['ReceiptNumber'];
    amount = json['Amount'];
    feeStatus = json['FeeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FeeName'] = this.feeName;
    data['DateAD'] = this.dateAD;
    data['DateBS'] = this.dateBS;
    data['MonthName'] = this.monthName;
    data['ReceiptNumber'] = this.receiptNumber;
    data['Amount'] = this.amount;
    data['FeeStatus'] = this.feeStatus;
    return data;
  }
}
