import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Config/constants/asset_location.dart';
import 'package:school_management_system/Config/constants/constants.dart';
import 'package:school_management_system/Controller/test/test_controller.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../Widgets/text_fields.dart';

class Test extends StatelessWidget {
  Test({
    super.key,
  });

  TestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ListTile(
            leading: Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://via.placeholder.com/150"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.access_time,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
              ],
            ),
            title: Text("Tis is title"),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subject: SubjectName"),
                Text("12.03.2018"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* class Test extends StatelessWidget {
  Test({
    super.key,
  });

  TestController controller = Get.find();
  final String htmlcontent = """
    <h1>Hello </h1>
    <h2 style='color:red'>World</h2>
    <p>This is sample paragraph</p>
    <p> H<sup>2</sup>O </p>
    <p> A<sub>2</sub> </p>
    <i>italic</i> <b>bold</b> <u>underline</u> <s>strike </s>
    <ul>
      <li>Item 1</li>
      <li>Item 2</li>
      <li>Item 3</li>
    </ul>
    <br><br>
    <img src="https://eduworld.eduworlderp.com/uploads/files/154/62e4c5df2d5f2.jpg" width="100">
  """;
// https://eduworld.eduworlderp.com/uploads/files/154/62e4c5df2d5f2.jpg
// https://vrsofttech.com/flutter-tutorials/images/vr.png

  String htmlcontent1 = """
<p><img alt="" src="https://eduworld.eduworlderp.com/uploads/files/154/62e4c5df2d5f2.jpg" style="float:left; margin-left:10px; margin-right:10px; width:50%" /></p>\r\n\r\n<p>ফতেয়াবাদ সিটি কর্পোরেশন ডিগ্রি কলেজ ১৯৭০ সালে প্রতিষ্ঠিত হয়ে চট্রগ্রাম তথা বাংলাদেশের শিক্ষা বিস্তারে এক অনন্য ভূমিকা পালন করে আসছে। উচ্চ মাধ্যমিক স্তরের বিজ্ঞান বিভাগ নিয়ে যাত্রা শুরু করলেও কলেজটিতে বর্তমানে উচ্চ মাধ্যমিক স্তরে বিজ্ঞান, ব্যবসায় শিক্ষা, মানবিক ও কারিগরি বিভাগ বিদ্যমান। তাছাড়া ২০১৫ সাল থেকে ডিগ্রি (পাস) বিবিএস ও বিএসএস কোর্স চালু রয়েছে। বর্তমানে ১৬৩৮ জন শিক্ষার্থীকে পাঠদানের জন্য রয়েছে ৩৩ জন সুদক্ষ শিক্ষক এবং অফিস কার্যক্রম পরিচালনায় রয়েছে ১৩ জন কর্মকর্তা-কর্মচারী। শ্রেণি কার্যক্রম পরিচালনায় রয়েছে তিনটি একাডেমিক ভবন তন্মধ্যে মাল্টিমিডিয়া শ্রেণি কক্ষ, ২৫০০ বই সম্বলিত লাইব্রেরী, ৩০ টি কম্পিউটার ও সার্ভার সম্বলিত আইসিটি ল্যাব, সমৃদ্ধ পদার্থ বিজ্ঞান, রসায়ন বিজ্ঞান ও জীব বিজ্ঞান গবেষণাগার এবং সুবিশাল মিলনায়তন বিদ্যমান। তাছাড়া কলেজ ক্যাম্পাসের মধ্যে একটি মসজিদ রয়েছে। সম্পূর্ণ ক্যাম্পাস সিসি ক্যামেরা দ্বারা নিয়ন্ত্রিত। শিক্ষার্থীদের আগমন ও প্রস্থানের সময় নিজ নিজ স্মার্ট আইডি কার্ড পাঞ্চ করার মাধ্যমে ক্ষুদে বার্তা দ্বারা অভিভাবককে অবহিত করা হয়। ২০১৮ সালে চট্রগ্রাম সিটি কর্পোরেশন কলেজটিকে অধিগ্রহণের মাধ্যমে&nbsp; শিক্ষা কার্যক্রম এবং অবকাঠামোগত উন্নয়নের এক নতুন দ্বার উন্মোচন করে।&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>
""";

  String find = "50%";
  

  @override
  Widget build(BuildContext context) {
    htmlcontent1 = htmlcontent1.replaceAll(find, AppScreenSize.mGetWidth(context, 95).toString());
    print(htmlcontent1);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              child: Html(
                data: htmlcontent1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  
} */
