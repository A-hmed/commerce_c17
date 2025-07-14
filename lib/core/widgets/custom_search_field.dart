import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextField(
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(AppSvgs.searchIcon, fit: BoxFit.scaleDown),
        hintText: AppLocalizations.of(context)!.searchHintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
    );
  }
}
