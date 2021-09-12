import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:frontend/constant/color.dart';
import 'package:frontend/screens/components/CustomBackButton.dart';
import 'package:frontend/screens/components/WelcomeBackground.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  var chessname = [
    "king",
    "advisor",
    "elephant",
    "chariot",
    "cannon",
    "horse",
    "sodier"
  ];
  var description = [
    "Quân Tướng đi từng ô một, đi ngang hoặc dọc và luôn luôn ở trong phạm vi cung, không được ra ngoài.",
    "Quân Sĩ đi chéo 1 ô mỗi nước và luôn luôn phải ở trong cung. Như vậy, quân Sĩ có 5 giao điểm có thể đứng hợp lệ và là quân cờ yếu nhất.\nSĩ có chức năng trong việc bảo vệ Tướng",
    "Quân Tượng đi chéo 2 ô mỗi nước và không được vượt sang sông. Vì vậy trên bàn cờ, mỗi bên ta có 7 vị trí mà quân Tượng có thể đi được.\nNước đi của Tượng không hợp lệ khi có một quân cờ nằm chặn giữa đường đi.",
    "Quân Xe đi ngang hoặc dọc trên bàn cờ miễn là đừng bị quân khác cản đường từ điểm đi đến điểm đến. Xe được coi là quân cờ mạnh nhất. ",
    "Quân Pháo đi ngang và dọc giống như Xe. Điểm khác biệt là Pháo muốn ăn quân thì nó phải nhảy qua đúng 1 quân nào đó. Khi không ăn quân, tất cả những điểm từ điểm đi đến điểm đến cũng phải không có quân cản.",
    "Quân Mã đi ngang (hay dọc) 1 ô và chéo (theo cùng hướng đi trước đó) 1 ô. Nếu có quân cờ nào đó nằm ngay bên cạnh thì Mã bị cản, không được đi đường đó.\nMã do không đi thẳng, lại có thể bị cản nên mức độ cơ động của quân này kém hơn Xe và Pháo.",
    "Quân Tốt đi 1 ô mỗi nước. Nếu Tốt chưa qua sông, nó chỉ được tiến. Nếu Tốt đã qua sông thì được đi ngang hay tiến, không được đi lùi.",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            alignment: Alignment.center,
            color: bg_transpearent,
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(height: size.width * 0.1),
                Container(
                  width: size.width,
                  height: size.height * 0.05,
                  alignment: Alignment.centerLeft,
                  child: CustomBackButton(
                    onpress: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  height: size.height * 0.85,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/r_" +
                                        chessname[index] +
                                        ".svg",
                                    height: size.width * 0.18,
                                    width: size.width * 0.18,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/b_" +
                                        chessname[index] +
                                        ".svg",
                                    height: size.width * 0.18,
                                    width: size.width * 0.18,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(size.width * 0.05),
                              width: size.width * 0.8,
                              child: Text(
                                description[index],
                                style:
                                    TextStyle(fontSize: 18, color: light_blue),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
