import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:nex_live_chat/common/commons.dart';
import 'package:nex_live_chat/common/widget/extensions/nex_card.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';
import 'package:nex_live_chat/theme/app_colors.dart';

class NexInput extends StatefulWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final TextInputType? textInputType;
  final String? hintText;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final String? svgIconLeft;
  final String? pngIconLeft;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final VoidCallback? reCheckCall;
  final bool enabled;

  /// Cho biết icon đang dùng có màu sắc
  final bool hasColorIcon;

  const NexInput({
    super.key,
    this.textEditingController,
    this.onChanged,
    this.onSubmit,
    this.textInputType,
    this.hintText,
    this.autofocus,
    this.inputFormatters,
    this.obscureText,
    this.svgIconLeft,
    this.pngIconLeft,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.hasColorIcon = false,
    this.reCheckCall,
    this.enabled = true,
  });

  @override
  State<NexInput> createState() => _NexInputState();
}

class _NexInputState extends State<NexInput> {
  var hasChangeTextFiled = false;
  bool _isShowPassword = true;

  void togglePassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _isShowPassword = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          hasChangeTextFiled = !hasFocus;
        });
        if (hasFocus && widget.reCheckCall != null) widget.reCheckCall!();
      },
      child:
          Row(
            children: [
              SizedBox(
                width: 24,
                child: widget.svgIconLeft != null
                    ? SvgPictureImageCustom(
                        svgPath: widget.svgIconLeft!,
                        color: widget.hasColorIcon
                            ? null
                            : hasChangeTextFiled
                            ? AppColors.primary
                            : AppColors.colorGreyB4BBC9,
                      )
                    : Image.asset(widget.pngIconLeft!.assetIconsPath),
              ),
              Container(
                height: 21,
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: hasChangeTextFiled ? AppColors.primary : AppColors.colorGreyB4BBC9,
              ),
              Expanded(
                child: TextFormField(
                  cursorWidth: 1,
                  controller: widget.textEditingController,
                  style: textTheme.bodyMedium!.size(14).textColor(widget.enabled ? AppColors.black : AppColors.colorGreyB4BBC9),
                  obscureText: _isShowPassword,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  enabled: widget.enabled,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintStyle: textTheme.bodyMedium!.size(14).textColor(AppColors.colorGreyB4BBC9),
                    hintText: widget.hintText ?? 'representative_guest_name'.tr(),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    isDense: true,
                  ),
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                ),
              ),
              if (widget.obscureText == true)
                GestureDetector(
                  onTap: () {
                    togglePassword();
                  },
                  child: Icon(
                    _isShowPassword ? Icons.visibility : Icons.visibility_off_outlined,
                    size: 24.0,
                    color: _isShowPassword ? AppColors.colorGreyB4BBC9 : AppColors.primary,
                  ),
                ),
            ],
          ).wrapCard(
            radius: 7,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            boxBorder: Border.all(width: 1, color: AppColors.colorGreyB4BBC9),
          ),
    );
  }
}

class NexInputSearch extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final String? hintText;
  final bool? isShowShadow;

  const NexInputSearch({super.key, this.textEditingController, this.onChanged, this.onSubmit, this.hintText, this.isShowShadow = false});

  @override
  Widget build(BuildContext context) {
    return isShowShadow == true
        ? Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              border: Border.all(width: 1, color: AppColors.colorGreyB4BBC9),
              boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 8, offset: const Offset(0, 5), color: Colors.grey.shade50)],
              color: Colors.white,
            ),
            child: TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintStyle: textTheme.bodyMedium!.size(14).textColor(AppColors.colorGreyB4BBC9),
                suffix: const SvgPictureImageCustom(svgPath: 'ic_search_nex', color: AppColors.colorGreyB4BBC9).paddingOnly(right: 12),
                hintText: hintText ?? 'searching_Locations'.tr(),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              onSaved: (_) => onSubmit,
              onChanged: onChanged,
            ),
          )
        : TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintStyle: textTheme.bodyMedium!.size(14).textColor(AppColors.colorGreyB4BBC9),
              suffix: const SvgPictureImageCustom(svgPath: 'ic_search_nex', color: AppColors.colorGreyB4BBC9).paddingOnly(right: 12),
              hintText: hintText ?? 'searching_Locations'.tr(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 1, color: AppColors.colorGreyB4BBC9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 1, color: AppColors.colorGreyB4BBC9),
              ),
            ),
            onSaved: (_) => onSubmit,
            onChanged: onChanged,
          );
  }
}

class DropdownTextFiled<T> extends StatefulWidget {
  final String? labelText;
  final Widget? label;
  final List<T> options;
  final T? initValue;
  final String Function(T) getLabel;
  final Widget Function(T)? buildLabel;
  final void Function(T?)? onChanged;
  final FormFieldValidator<T>? validator;
  final String? helpText;
  final String? hintText;
  final bool? enabled;
  final double? menuMaxHeight;
  final Widget? icon;
  final Widget? prefixIcon;
  final InputBorder? customBorder;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const DropdownTextFiled({
    super.key,
    this.labelText,
    this.options = const [],
    required this.getLabel,
    this.initValue,
    this.onChanged,
    this.helpText,
    this.hintText,
    this.validator,
    this.label,
    this.enabled,
    this.menuMaxHeight,
    this.icon,
    this.customBorder,
    this.buildLabel,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
  });

  @override
  DropdownTextFiledState<T> createState() => DropdownTextFiledState<T>();
}

class DropdownTextFiledState<T> extends State<DropdownTextFiled<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  @override
  void didUpdateWidget(covariant DropdownTextFiled<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !(widget.enabled ?? true),
      child: DropdownButtonFormField<T>(
        validator: widget.validator,
        menuMaxHeight: widget.menuMaxHeight,
        style: widget.hintStyle,
        decoration: InputDecoration(
          helperText: widget.helpText,
          contentPadding: const EdgeInsets.only(left: 20, right: 10),
          label: widget.label,
          labelText: widget.labelText,
          hintText: widget.hintText,
          focusedBorder: widget.customBorder,
          enabledBorder: widget.customBorder,
          prefixIcon: widget.prefixIcon,
          border: widget.customBorder,
          labelStyle: widget.labelStyle,
          hintStyle: widget.hintStyle,
        ),
        items: widget.options.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: widget.buildLabel?.call(value) ?? Text(widget.getLabel(value), style: widget.labelStyle),
          );
        }).toList(),
        selectedItemBuilder: (_) {
          return widget.options.map((T value) {
            return Text(widget.getLabel(value), maxLines: 1, style: widget.labelStyle);
          }).toList();
        },
        value: _value,
        isDense: true,
        isExpanded: true,
        icon: widget.icon ?? const Icon(Icons.keyboard_arrow_down_outlined, size: 16),
        onChanged: (val) {
          widget.onChanged?.call(val);
          setState(() {
            _value = val;
          });
        },
      ),
    );
  }
}
