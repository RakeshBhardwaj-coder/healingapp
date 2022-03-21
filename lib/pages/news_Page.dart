import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Daily News"),
          backgroundColor: Colors.blue[800],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search related you problem...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  suffixIcon: Icon(
                    Icons.send,
                    color: Colors.blue.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue[100])),
            ),
            Container(
              width: double.infinity,
              height: 270,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
