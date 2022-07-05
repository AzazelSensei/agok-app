import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color_constant.dart';
import 'package:agok_app/core/extensions/ui_extension.dart';
import 'package:agok_app/core/extensions/theme_kit.dart';
import 'package:agok_app/core/extensions/padding_kit.dart';

import '../../../core/utils/debouncer.dart';

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final Function()? onChangedDebouncer;
  const SearchField({Key? key, this.controller, this.onChangedDebouncer})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final Debouncer _debouncer = Debouncer(milliseconds: 600);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingVeryLowCARD,
      padding: context.paddingVeryLow,
      decoration: BoxDecoration(
        color: ColorConstant.lightGrey.withOpacity(0.8),
        borderRadius: context.lowBorderRadius,
      ),
      child: Row(
        children: [
          const Icon(FeatherIcons.search, color: ColorConstant.headline),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              key: const ValueKey('searchField'),
              controller: widget.controller,
              cursorColor: ColorConstant.headline,
              onChanged: widget.onChangedDebouncer == null
                  ? null
                  : (e) => _debouncer.run(widget.onChangedDebouncer!),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Search Recipes',
                hintStyle:
                    context.headline5.copyWith(color: ColorConstant.headline),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
