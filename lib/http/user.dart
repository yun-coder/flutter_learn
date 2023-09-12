import 'package:json_annotation/json_annotation.dart';

// --------------------------------
// flutter pub run build_runner build --delete-conflicting-outputs
// --------------------------------

// 下面文件[user.g.dart]是自动生成出来的
// explicitToJson: true 用于嵌套数据
part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
