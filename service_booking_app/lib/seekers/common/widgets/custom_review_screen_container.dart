import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_chat_list_tile.dart';

import '../../utils/images.dart';

class CustomReviewScreenContainer extends StatelessWidget {
  const CustomReviewScreenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("uihiuhueyhuhrgiyh9ueg  uheriugiuhuier uhougouhebsfgbhsduigdfkjgbjkhdhghdfujhdfougdfghoudhgikergousdhgjearngfioauhvaioegboiusoaerhgkljwqrhnouheaoigfnwraouifgahwougfhwatouiwhafgosayhfgouihwsfgoyhzfgshdofghsdofuysduofhwsdoufghsaghawrjsaiughuegku"),
        SizedBox(height: 10,),
        Row(
          children: [
            Icon(Icons.star, color: Colors.orange,),
            Icon(Icons.star,color: Colors.orange),
            Icon(Icons.star, color: Colors.orange),
            Icon(Icons.star,color: Colors.orange),
          ],
        ),
        //SizedBox(height: 5,),
        CustomChatListTile(profileImage: Images.serviceShortPhoto , name: "name", msg: "msg", time: ""),
        Divider()

      ],
    );
  }
}
