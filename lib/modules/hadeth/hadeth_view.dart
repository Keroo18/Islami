import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_r/modules/hadeth/hadith_detail_view.dart';
class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    if(allHadithData.isEmpty)loudHadithData();
    return Column(
      children: [
        Image.asset(
          "assets/icons/hadith_header.png",
          scale: 3,
        ),
        Divider(),
        Text(
            "الاحاديث",
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),

        Divider(),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) =>
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context,
                      HadithDetailView.routeName,
                      arguments: dataList[index],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    dataList[index].title,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ),
            itemCount: dataList.length,
          ),
        )
      ],
    );
  }
  List<HadithData> dataList=[];
  String allHadithData="";
  List <String> allHadithDataList=[];
  Future<void>loudHadithData()async{
    allHadithData =await rootBundle.loadString("assets/files/ahadeth.txt");
    allHadithDataList=allHadithData.split('#');
    for(int i=0;i<allHadithDataList.length;i++)
      {
        String singleHadith= allHadithDataList[i].trim();
        int titleLenth = singleHadith.indexOf("\n");

        String title=singleHadith.substring(0,titleLenth) ;
        String body=singleHadith.substring(titleLenth+1);
        HadithData hadithData=HadithData(title: title, body: body);
        dataList.add(hadithData);
      }
    setState(() {

    });

  }
}
class HadithData{

  final String title;
  final String body;

HadithData({
  required this.title,
  required this.body,
});
}