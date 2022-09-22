class ProfileInfo {
  static String? studentName;
  static String? studentGender;
  static String? stageNsme;
  static int? stageId;

  static void fromjason(Map json) {
    studentName = json['name'];
    studentGender = json['gender'];
    stageId = json['stage_id'];
    stageNsme = json['stage_name'];
  }
}
