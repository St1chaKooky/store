import 'dart:async';

import 'package:fake_store/theme/collections/colorCollection.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatefulWidget {
  final FutureOr<void> Function() onTap;
  final String text;

  const MyFilledButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  double? _childHeight;

  final _childBoxKey = GlobalKey();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => setState(
        () => _childHeight = _childBoxKey.currentContext?.size?.height));
  }

  Future<void> onTap() async {
    if (_isLoading) return;
    try {
      setState(() => _isLoading = true);
      await widget.onTap.call();
    } finally {
      setState(() => _isLoading = false);
    }  }

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shadowColor: Colors.amber.withOpacity(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.0,
              disabledBackgroundColor:
                  ColorCollection.primary.withOpacity(0.12),
              backgroundColor: ColorCollection.primary,
            ),
            onPressed: widget.onTap != null ? onTap : null,
            child: SizedBox(
              key: _childBoxKey,
              height: _childHeight,
              child: !_isLoading
                  ? Text(
                      widget.text,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: widget.onTap != null
                                ? ColorCollection.white
                                : ColorCollection.white.withOpacity(0.38),
                          ),
                    )
                  :  const FittedBox(
                      child: CircularProgressIndicator(
                        color: ColorCollection.white,
                        strokeWidth: 4,
                      ),
                    ),
            )));
  }
}
