class DataCollection {
  final String name;
  final String email;
  final String mobile;
  final String pass;
  final String referralCode;
  final String points;
  final String earnMoney;

  DataCollection(this.name, this.email, this.mobile, this.pass, this.points,
      this.referralCode, this.earnMoney);

  Map<String, dynamic> toMap() {
    return {
      'Name': name,

      'Email': email,
      'Mobile': mobile,
      'Pass': pass,
      'Referral Code': referralCode,
      'Points': points,
      'EarnMoney': earnMoney,
    };
  }
}
