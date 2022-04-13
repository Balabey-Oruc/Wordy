import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wordy/data/bloc/word/word_cubit.dart';
import 'package:wordy/data/models/list_item_model.dart';
import 'package:wordy/presentation/home_page/widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _controller = TextEditingController();

  FocusNode focus = FocusNode();

  List<ListItemModel> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: const Text('Wordy'),
      ),
      body: BlocConsumer<WordCubit, WordState>(
        listener: (context, state) {
          if (state is WordSuccess && _controller.text.isNotEmpty) {
            _list.add(
              ListItemModel(
                  hasData: true,
                  word: _controller.text,
                  wordResModel: state.wordResModel),
            );
            _controller.clear();
          }
          if (state is WordFailure && _controller.text.isNotEmpty) {
            _list.add(
              ListItemModel(
                hasData: false,
                word: _controller.text,
              ),
            );
            _controller.clear();
          }
          if (state is NoInternetConnection && _controller.text.isNotEmpty) {
            Fluttertoast.showToast(msg: 'No Internet Connection');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 280.w,
                        child: TextField(
                          focusNode: focus,
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Ask a word',
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            context
                                .read<WordCubit>()
                                .getMeanings(word: _controller.text);
                            focus.unfocus();
                          },
                          child: const Text('Search'))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 8.0),
                  child: SizedBox(
                    height: 20,
                    child: Text(
                      'History:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 610.h
                        : 100.w,
                    child: _list.isEmpty
                        ? const Center(
                            child: Text(
                            'History is Empty',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ))
                        : ListView.builder(
                            itemBuilder: ((context, index) => ListItem(
                                  listItemModel: _list[index],
                                )),
                            itemCount: _list.length,
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
