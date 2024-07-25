final accountInfo = AccountInfo.fromJson(AccountInfo.data);

class AccountInfo {
  AccountInfo({
    required this.infos,
  });

  final List<Info> infos;

  factory AccountInfo.fromJson(List<Map<String, dynamic>> json) {
    return AccountInfo(infos: json.map((e) => Info.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    return {'infos': infos};
  }

  static const data = [
    {
      "info": "1 USD = 1,560.00 NGN",
      "infoMessage":
          "These amounts don’t include fees. Last updated:\nWednesday, July 3, 2024 at 12:15 PM",
      "prompt": "View rates",
    },
    {
      "info": "\$0.00 left of 10,000",
      "infoMessage": "Daily limit",
      "prompt": "View all limits",
    },
  ];
}

class Info {
  final String info;
  final String infoMessage;
  final String prompt;

  Info({
    required this.info,
    required this.infoMessage,
    required this.prompt,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      info: json['info'],
      infoMessage: json['infoMessage'],
      prompt: json['prompt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'info': info,
      'infoMessage': infoMessage,
      'prompt': prompt,
    };
  }
}
