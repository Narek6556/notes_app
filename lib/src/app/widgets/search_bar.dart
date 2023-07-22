import 'package:flutter/material.dart';
import 'package:notes_app/src/app/widgets/svg_icons.dart';
import 'package:provider/provider.dart';

import '../../themes/color_utils.dart';
import '../viewModels/home_view_model.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final HomeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _viewModel = Provider.of<HomeViewModel>(context);
    super.didChangeDependencies();
  }

  final TextStyle textStyle = TextStyle(
    color: ColorUtils.hexToColor('#CCCCCC'),
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorUtils.rgbToColor(59, 59, 59, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 240,
              child: TextField(
                onChanged: (value) => _viewModel.searchTitle = value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search by the keyword...',
                  hintStyle: textStyle,
                ),
                style: textStyle,
              ),
            ),
            GestureDetector(
              child: closeIcon,
              onTap: () {
                _viewModel.setSearchMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
