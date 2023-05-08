import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../res/themes.dart';

class MockDict extends StatelessWidget {
  const MockDict({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            //DictionarySearchBar(),
            Container(
              decoration: AppContainerStyle.border,
              child: Text('This is a mocking text'),
            )
          ],
        ),
      ),
    );
  }
}

class DictionarySearchBar extends StatefulWidget {
  final List<Vocabulary> dataList;
  final void Function(Object) onItemSelected;

  const DictionarySearchBar({
    super.key,
    required this.dataList,
    required this.onItemSelected,
  });

  @override
  State<DictionarySearchBar> createState() => _DictionarySearchBarState();
}

class _DictionarySearchBarState extends State<DictionarySearchBar> {
  TextEditingController searchController = TextEditingController();
  List<Vocabulary> filteredList = [];

  @override
  void initState() {
    filteredList = widget.dataList;
    super.initState();
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Vocabulary> tempList = [];
      for (var item in widget.dataList) {
        if (item.toString().toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
        }
      }
      setState(() {
        filteredList = tempList;
      });
    } else {
      setState(() {
        filteredList = widget.dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: TextFormField(
            onChanged: filterSearchResults,
            controller: searchController,
            keyboardType: TextInputType.text,
            autocorrect: false,
            cursorColor: AppColors.black,
            style: AppTextStyle.medium15,
            decoration: InputDecoration(
              prefixIcon: const Icon(CupertinoIcons.search),
              filled: true,
              fillColor: AppColors.white,
              hintText: 'Find some interesting vocabulary',
              hintStyle: AppTextStyle.regular15,
              prefixIconColor: AppColors.black,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
                borderSide: const BorderSide(
                  color: AppColors.black,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
                borderSide: const BorderSide(
                  color: AppColors.black,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredList[index].toString()),
              onTap: () {
                widget.onItemSelected(filteredList[index]);
              },
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
