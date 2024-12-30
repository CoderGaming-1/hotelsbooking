class ReservationModel {
  final String room;
  final String user;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final bool isReviewed;
  final String status;
  final DateTime expirationDate;
  final String id;
  final List<dynamic> guests;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReservationModel({
    required this.room,
    required this.user,
    required this.checkInDate,
    required this.checkOutDate,
    required this.isReviewed,
    required this.status,
    required this.expirationDate,
    required this.id,
    required this.guests,
    required this.createdAt,
    required this.updatedAt,
  });

  // Tạo phương thức fromJson để chuyển đổi từ JSON sang đối tượng
  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      room: json['room'],
      user: json['user'],
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
      isReviewed: json['isReviewed'],
      status: json['status'],
      expirationDate: DateTime.parse(json['expirationDate']),
      id: json['_id'],
      guests: List<dynamic>.from(json['guests'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Tạo phương thức toJson để chuyển đổi từ đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'room': room,
      'user': user,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'isReviewed': isReviewed,
      'status': status,
      'expirationDate': expirationDate.toIso8601String(),
      '_id': id,
      'guests': guests,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
