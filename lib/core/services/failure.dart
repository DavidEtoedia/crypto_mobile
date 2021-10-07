// To parse this JSON data, do
//
//     final failure = failureFromJson(jsonString);

import 'dart:convert';

Failure failureFromJson(String str) => Failure.fromJson(json.decode(str));

String failureToJson(Failure data) => json.encode(data.toJson());

class Failure {
  Failure({
    this.errorMessage,
  });

  String? errorMessage;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        errorMessage:
            json["errorMessage"] == null ? null : json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "errorMessage": errorMessage,
      };
}


























// // To parse this JSON data, do
// //
// //     final failure = failureFromJson(jsonString);

// import 'dart:convert';

// Failure failureFromJson(String str) => Failure.fromJson(json.decode(str));

// String failureToJson(Failure data) => json.encode(data.toJson());

// class Failure {
//   Failure({
//     this.result,
//     this.successful,
//     this.message,
//     this.errors,
//   });

//   final dynamic result;
//   final bool? successful;
//   final String? message;
//   final List<Error>? errors;

//   factory Failure.fromJson(Map<String, dynamic> json) => Failure(
//         result: json["result"],
//         successful: json["successful"] == null ? null : json["successful"],
//         message: json["message"] == null ? null : json["message"],
//         errors: json["errors"] == null
//             ? null
//             : List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "result": result,
//         "successful": successful == null ? null : successful,
//         "message": message == null ? null : message,
//         "errors": errors == null
//             ? null
//             : List<dynamic>.from(errors!.map((x) => x.toJson())),
//       };
// }

// class Error {
//   Error({
//     this.error,
//     this.code,
//   });

//   final String? error;
//   final String? code;

//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//         error: json["error"] == null ? null : json["error"],
//         code: json["code"] == null ? null : json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "error": error == null ? null : error,
//         "code": code == null ? null : code,
//       };
// }
