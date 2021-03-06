// To parse this JSON data, do
//
//     final messagesResponse = messagesResponseFromJson(jsonString);

import 'dart:convert';

MessagesResponse messagesResponseFromJson(String str) => MessagesResponse.fromJson(json.decode(str));

String messagesResponseToJson(MessagesResponse data) => json.encode(data.toJson());

class MessagesResponse {
    MessagesResponse({
        this.messages,
    });

    List<Message>? messages;

    factory MessagesResponse.fromJson(Map<String, dynamic> json) => MessagesResponse(
        messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
    };
}

class Message {
    Message({
        this.from,
        this.to,
        this.message,
        this.createdAt,
        this.updatedAt,
    });

    String? from;
    String? to;
    String? message;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        from: json["from"],
        to: json["to"],
        message: json["message"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "message": message,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
