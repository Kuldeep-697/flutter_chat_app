import 'dart:core';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrtc_chat/model/checkotpNewModel.dart';

String appVersionCode = "";
late SharedPreferences sp;

CheckotpNewModel currentUserData = CheckotpNewModel();

String appplatform = Platform.isAndroid ? "android-app" : "IOS-app";

String mainbaseUrl = "http://15.207.103.215/";

String mainbaseUrlbackup = "http://15.207.103.215/";

String baseUrlbackup =
    "${mainbaseUrl}onedios-integration-api-center/graphql?query=";

String baseUrl = "${mainbaseUrl}onedios-integration-api-center/graphql?query=";

String dashBordHome = 'dealer_home_nova';