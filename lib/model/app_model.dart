class AppModel {
  final String imageeUrl;
  final String fullName;
  final String telephoneNumber;
  final String email;
  final bool darkMode;
  final int indexScreen;

  AppModel({
    required this.indexScreen,
    required this.darkMode,
    required this.imageeUrl,
    required this.fullName,
    required this.telephoneNumber,
    required this.email,
  });

  factory AppModel.fromJson(Map<String, dynamic> user) {
    return AppModel(
      indexScreen: user["indexScreen"],
      darkMode: user["darkMode"],
      imageeUrl: user["imageeUrl"],
      fullName: user["fullName"],
      telephoneNumber: user["telephoneNumber"],
      email: user["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "indexScreen":indexScreen,
      "darkMode": darkMode,
      "imageeUrl": imageeUrl,
      "fullName": fullName,
      "telephoneNumber": telephoneNumber,
      "email": email,
    };
  }

  AppModel copyWith({
    int? indexScreenN,
    bool? darkModeN,
    String? imageeUrlN,
    String? fullNameN,
    String? telephoneNumberN,
    String? emailN,
  }) {
    return AppModel(
      indexScreen: indexScreenN??indexScreen,
      darkMode: darkModeN ?? darkMode,
      imageeUrl: imageeUrlN ?? imageeUrl,
      fullName: fullNameN ?? fullName,
      telephoneNumber: telephoneNumberN ?? telephoneNumber,
      email: emailN ?? email,
    );
  }
}
