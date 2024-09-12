import 'dart:convert';
import 'package:webrtc_chat/model/CurrentUserNovMax.dart';

CheckotpNewModel checkotpNewModelFromJson(String str) =>
    CheckotpNewModel.fromJson(json.decode(str));

String checkotpNewModelToJson(CheckotpNewModel data) =>
    json.encode(data.toJson());

class CheckotpNewModel {
  CurrentUserNovMax? checkotpNew;

  CheckotpNewModel({
    this.checkotpNew,
  });

  factory CheckotpNewModel.fromJson(Map<String, dynamic> json) =>
      CheckotpNewModel(
        checkotpNew: json["checkotp_new"] == null
            ? null
            : CurrentUserNovMax.fromJson(json["checkotp_new"]),
      );

  Map<String, dynamic> toJson() => {
        "checkotp_new": checkotpNew?.toJson(),
      };
}
