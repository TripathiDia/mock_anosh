import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/BG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {}),
          elevation: 0,
        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Details")),
            
            const Divider(),

            Container(
    margin: const EdgeInsets.only(top: 12, bottom: 12),
    decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        border: Border.all(color: Theme.of(context).highlightColor)),
    width: double.infinity,
    height: 40,
    child: Center(
      child: TextField(
        style: TextStyle(color: Theme.of(context).highlightColor),
       // onChanged: onchange,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for something',
          hintStyle: TextStyle(color: Theme.of(context).hintColor),
          labelStyle: TextStyle(color: Theme.of(context).highlightColor),
          prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        ),
      ),
    ),
  ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 2)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 1),
                          textData(const Text("data"), 2),
                        ],
                      ),
                      const SizedBox(height: 10),
                       Row(children: [
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                                        ],),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHlZZ1Pv-Qv4XKzCS-yAERGk9ebq7wXa-LtLlWfW5egA&s", fit: BoxFit.fitWidth,)),
                )
              ],
            ),
            const SizedBox(height: 10),

            Row(children: [
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        SizedBox(width: MediaQuery.of(context).size.width/4, child: Container(
        margin: const EdgeInsets.only(left:08,right: 40),
        padding: const EdgeInsets.all(08),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        child: const Text("data"),
      ))
                                        ],),
                                        const SizedBox(height: 10),

                                        Row(children: [
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        SizedBox(width: MediaQuery.of(context).size.width/4, child: Container(
        margin: const EdgeInsets.only(left:08,right: 40),
        padding: const EdgeInsets.all(08),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        child: const Text("data"),
      ))
                                        ],),
                                        const SizedBox(height: 10),

                                        Row(children: [
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        textData(const Text("data"), 1),
                        SizedBox(width: MediaQuery.of(context).size.width/4, child: Container(
        margin: const EdgeInsets.only(left:08,right: 40),
        padding: const EdgeInsets.all(08),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        child: const Text("data"),
      ))
                                        ],),

          ],
        ),
      ),
    );
  }

  Widget textData(Widget widget, flex) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.only(left: 08),
        padding: const EdgeInsets.all(08),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        child: widget,
      ),
    );
  }
}
