void main() {
  // todo 没有返回结果的方法用 Future 声明
  // Future.delayed(Duration(seconds: 2),(){
  //   //return "hi world!";
  //   throw AssertionError("Error");
  // }).then((data){
  //   //执行成功会走到这里
  //   print(data);
  // }).catchError((e){
  //   //执行失败会走到这里
  //   print(e);
  // }).whenComplete((){
  //   //无论成功或失败都会走到这里
  // });

  // Future.wait([
  //   // 2秒后返回结果
  //   Future.delayed(Duration(seconds: 2), () {
  //     return "hello";
  //   }),
  //   // 4秒后返回结果
  //   Future.delayed(Duration(seconds: 4), () {
  //     return " world";
  //   })
  // ]).then((results){
  //   print(results[0]+results[1]);
  // }).catchError((e){
  //   print(e);
  // });
}
