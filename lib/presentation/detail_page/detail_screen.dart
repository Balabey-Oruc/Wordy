import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wordy/data/models/list_item_model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.listItemModel}) : super(key: key);
  final ListItemModel listItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: const Text('Details'),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250.h,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      listItemModel.word,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Parts of Speech:',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            height: 10.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                listItemModel
                                    .wordResModel!.meanings[index].partOfSpeech,
                                style: TextStyle(
                                    color: Colors.grey[300], fontSize: 12.sp),
                              ),
                            ),
                          ),
                          itemCount:
                              listItemModel.wordResModel!.meanings.length,
                        ),
                      ),
                    ],
                  ),
                )),
                Container(
                  height: 350.h,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Definitions:',
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[300]),
                    ),
                    SizedBox(
                      height: 292.h,
                      width: double.infinity,
                      child: listItemModel.hasData
                          ? ListView.builder(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  ' - ' +
                                      listItemModel.wordResModel!.meanings[0]
                                          .definitions[index].definition,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                ),
                              ),
                              itemCount: listItemModel
                                  .wordResModel!.meanings[0].definitions.length,
                            )
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'For this word there is not available definition',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                    ),
                  ]),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 0.35.sw,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Center(
                    child: Text(
                      listItemModel.word,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Parts of Speech:',
                          style: TextStyle(
                              fontSize: 0.047.sh,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 0.6.sh,
                        child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            height: 0.08.sh,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                listItemModel
                                    .wordResModel!.meanings[index].partOfSpeech,
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 0.036.sh),
                              ),
                            ),
                          ),
                          itemCount:
                              listItemModel.wordResModel!.meanings.length,
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  width: 0.45.sw,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Definitions:",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[300]),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 0.58.sh,
                        child: listItemModel.hasData
                            ? ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' - ' +
                                        listItemModel.wordResModel!.meanings[0]
                                            .definitions[index].definition,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                itemCount: listItemModel.wordResModel!
                                    .meanings[0].definitions.length,
                              )
                            : const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'For this word there is not available definition',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
