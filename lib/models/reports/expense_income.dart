class ExpenseIcome {
  String? type;
  int? income;
  int? expense;

  ExpenseIcome({this.type, this.income, this.expense});

  ExpenseIcome.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    income = json['income'];
    expense = json['expenses'];
  }
}
