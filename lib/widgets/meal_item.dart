import 'package:again/models/meal.dart';
import 'package:again/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  // initial variables
  final String imageUrl;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String title;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  //عشان يختارالاكله وينتقل للصفحه بتاعتها و يعرف تفاصيلها
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id)
        //بتاخد قيمه ال id بتاع الاكله وانا بعمل pop من صفحه عشان استخدمها زي مسح الاكله
        .then((value) {
      // if (value != null) removeItem(value);
    });
  }

  // عشان اعرف نوع تحضير الوجبه سهل صعب ولا متوسط
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unKnow';
        break;
    }
  }

  // عشان اعرف نوع تحضير الوجبه غالي  ولا رخيص  ولا متوسط

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // تم اختيار الاكله اللي عايز يعرف تفاصيلها
      onTap: () => selectMeal(context),
      //عشان اخلي الاكل ع هيئه كروت تحت بعضها
      child: Card(
        //شكل الكارت يكون دائري
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4, //ارتفاع الكارت
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            // عشان احط العناصر فوق بعضها مثلا صوره وفوقها كلام
            Stack(
              children: [
                //عشان احدد دوران حواف الصوره
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    //عشان تخلي الصوره دائريه من جهه فوق شمال
                    topLeft: Radius.circular(15),
                    //عشان تخلي الصوره دائريه من جهه فوق يمين
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 400,
                    width: double.infinity,
                    // عشان الصوره يتغير حجمها مع تكبير او تصغير الشاشه
                    fit: BoxFit.cover,
                  ),
                ),
                //مكان عرض اسم الاكله
                Positioned(
                  bottom: 20,
                  right: 10,
                  //  اسم الاكله اللي هيتعرض علي الصور بالتنسيقات
                  child: Container(
                    width: 300,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, color: Colors.deepOrange),
                      //عشان يخلي الكلام تحت بعضه
                      softWrap: true,
                      //في اختيارات لطريقه عرض النص
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            //عشان اعمل شريط تحت الصوره فيه الوقت والتكلفه ونوع الوجبه سهل ولا صعب
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                //عشان اخلي المسافه بين الايكون زي بعض
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ايكون الوقت
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min')
                    ],
                  ),
                  //مدي سهوله وصعوبه الاكله
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('$complexityText')
                    ],
                  ),
                  //سعر الاكله
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text('$affordabilityText')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
