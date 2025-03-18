class Stipend {
  final int id;
  final int candidateId;
  final int centerId;
  final double amount;
  final int absentDays;
  final int level;
  final int presentDays;
  final String startDate;
  final String endDate;
  final int stipendMonth;
  final int monthNumber;
  final String aicteId;
  final String candidateName;
  final String email;
  final int gender;
  final int category;
  final String dateOfJoining;
  final int level2;

  Stipend({
    required this.id,
    required this.candidateId,
    required this.centerId,
    required this.amount,
    required this.absentDays,
    required this.level,
    required this.presentDays,
    required this.startDate,
    required this.endDate,
    required this.stipendMonth,
    required this.monthNumber,
    required this.aicteId,
    required this.candidateName,
    required this.email,
    required this.gender,
    required this.category,
    required this.dateOfJoining,
    required this.level2,
  });

  // Factory method to parse the JSON response
  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      id: json['id'],
      candidateId: json['candidateId'],
      centerId: json['centerId'],
      amount: json['amount'].toDouble(),
      absentDays: json['absentDays'],
      level: json['level'],
      presentDays: json['presentDays'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      stipendMonth: json['stipendMonth'],
      monthNumber: json['monthNumber'],
      aicteId: json['aicteId'],
      candidateName: json['candidateName'],
      email: json['email'],
      gender: json['gender'],
      category: json['cetegory'],
      dateOfJoining: json['dateOfJoining'],
      level2: json['level2'],
    );
  }
}
