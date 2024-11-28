import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teste_betalent/core/shared/constants/app_icons.dart';
import 'package:teste_betalent/core/shared/utils/debouncer.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';

class SearchBarWidget extends StatefulWidget {
  final void Function(String value) onChange;
  const SearchBarWidget(this.onChange, {super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController textController;
  late Debouncer debouncer;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    debouncer = Debouncer(1000);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: TextFormField(
        controller: textController,
        onChanged: (value) {
          debouncer.run(() => widget.onChange(value));
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.5),
          prefixIcon: SvgPicture.asset(
            AppIcons.search,
            fit: BoxFit.scaleDown,
            colorFilter:
                const ColorFilter.mode(ThemeColors.black, BlendMode.srcIn),
          ),
          hintText: 'Pesquisar',
          hintStyle: Theme.of(context).textTheme.displaySmall,
          filled: true,
          fillColor: ThemeColors.gray5,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeColors.gray10),
            borderRadius: BorderRadius.circular(40.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeColors.gray10),
            borderRadius: BorderRadius.circular(40.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ThemeColors.gray10),
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}
