import 'package:flutter/material.dart';

// Form({
//   required Widget child,
//   是否自动校验输入内容；当为true时，每一个子 FormField 内容发生变化时都会自动校验合法性，
//   并直接显示错误信息。否则，需要通过调用FormState.validate()来手动校验
//   bool autovalidate = false,
//   决定Form所在的路由是否可以直接返回（如点击返回按钮），该回调返回一个Future对象，
//   如果 Future 的最终结果是false，则当前路由不会返回；如果为true，则会返回到上一个路由。
//   此属性通常用于拦截返回按钮
//   WillPopCallback onWillPop,
//   Form的任意一个子FormField内容发生变化时会触发此回调。
//   VoidCallback onChanged,
// })

// Form() TextFormField()

class CustomValid extends StatefulWidget {
  const CustomValid({super.key});

  @override
  State<CustomValid> createState() => _FormValid();
}

class _FormValid extends State<CustomValid> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("表单验证"),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: const InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  validator: (v) {
                    return v!.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          //     child: ElevatedButton(
                          //   onPressed: () {
                          //     if ((_formKey.currentState as FormState).validate()) {
                          //       print("yes");
                          //     }
                          //   },
                          //   child: const Padding(
                          //     padding: EdgeInsets.all(16.0),
                          //     child: Text("登录"),
                          //   ),
                          // )
                          // 通过Builder来获取ElevatedButton所在widget树的真正context(Element)
                          child: Builder(builder: (context) {
                        return ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("登录"),
                          ),
                          onPressed: () {
                            //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                            if (Form.of(context).validate()) {
                              //验证通过提交数据
                              // print("123");
                            }
                          },
                        );
                      }))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
