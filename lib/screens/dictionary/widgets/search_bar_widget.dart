import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../../res/themes.dart';

class DictionarySearchBar extends StatefulWidget {
  final List<Vocabulary> dataList;

  final void Function(Vocabulary) onItemSelected;

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

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Vocabulary> tempList = [];
      for (var item in widget.dataList) {
        if (item.word!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
        }
      }
      setState(() {
        filteredList = tempList;
      });
    } else {
      setState(() {
        filteredList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
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
        Card(
          color: AppColors.white,
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  filteredList[index].word!,
                  style: AppTextStyle.bold15,
                ),
                subtitle: Text(
                  filteredList[index].type!,
                  style: AppTextStyle.regular10,
                ),
                onTap: () {
                  widget.onItemSelected(filteredList[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
