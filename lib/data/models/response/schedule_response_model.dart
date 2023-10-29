import 'dart:convert';

class ScheduleResponseModel {
  final List<Schedule>? data;

  ScheduleResponseModel({
    this.data,
  });

  factory ScheduleResponseModel.fromJson(String str) =>
      ScheduleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScheduleResponseModel.fromMap(Map<String, dynamic> json) =>
      ScheduleResponseModel(
        data: json["data"] == null
            ? []
            : List<Schedule>.from(
                json["data"]!.map((x) => Schedule.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Schedule {
  final int? id;
  final int? subjectId;
  final int? studentId;
  final String? hari;
  final String? jamMulai;
  final String? jamSelesai;
  final String? ruangan;
  final String? kodeAbsensi;
  final String? tahunAkademik;
  final String? semester;
  final String? createdBy;
  final String? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Subject? subject;
  final Student? student;

  Schedule({
    this.id,
    this.subjectId,
    this.studentId,
    this.hari,
    this.jamMulai,
    this.jamSelesai,
    this.ruangan,
    this.kodeAbsensi,
    this.tahunAkademik,
    this.semester,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.subject,
    this.student,
  });

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        subjectId: json["subject_id"],
        studentId: json["student_id"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        ruangan: json["ruangan"],
        kodeAbsensi: json["kode_absensi"],
        tahunAkademik: json["tahun_akademik"],
        semester: json["semester"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        subject:
            json["subject"] == null ? null : Subject.fromMap(json["subject"]),
        student:
            json["student"] == null ? null : Student.fromMap(json["student"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
        "student_id": studentId,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "ruangan": ruangan,
        "kode_absensi": kodeAbsensi,
        "tahun_akademik": tahunAkademik,
        "semester": semester,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "subject": subject?.toMap(),
        "student": student?.toMap(),
      };
}

class Student {
  final int? id;
  final String? name;
  final String? email;
  final String? roles;
  final dynamic phone;
  final dynamic address;
  final DateTime? emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Student({
    this.id,
    this.name,
    this.email,
    this.roles,
    this.phone,
    this.address,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        phone: json["phone"],
        address: json["address"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
        "phone": phone,
        "address": address,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Subject {
  final int? id;
  final String? title;
  final int? lecturerId;
  final String? semester;
  final String? academicYear;
  final int? sks;
  final String? code;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Student? lecturer;

  Subject({
    this.id,
    this.title,
    this.lecturerId,
    this.semester,
    this.academicYear,
    this.sks,
    this.code,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.lecturer,
  });

  factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        lecturerId: json["lecturer_id"],
        semester: json["semester"],
        academicYear: json["academic_year"],
        sks: json["sks"],
        code: json["code"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lecturer:
            json["lecturer"] == null ? null : Student.fromMap(json["lecturer"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "lecturer_id": lecturerId,
        "semester": semester,
        "academic_year": academicYear,
        "sks": sks,
        "code": code,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "lecturer": lecturer?.toMap(),
      };
}
