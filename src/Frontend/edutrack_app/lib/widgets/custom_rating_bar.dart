import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:luis_s_application/core/app_export.dart';

class CustomRatingBar extends StatefulWidget {
  CustomRatingBar({
    Key? key,
    this.alignment,
    this.ignoreGestures,
    this.controller,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.unselectedColor,
    this.onRatingUpdate,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final bool? ignoreGestures;
  final RatingController? controller;
  final double? initialRating;
  final double? itemSize;
  final int? itemCount;
  final Color? unselectedColor;
  final Function(double)? onRatingUpdate;

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildRatingBarWidget(),
          )
        : _buildRatingBarWidget();
  }

  Widget _buildRatingBarWidget() {
    return RatingBar.builder(
      ignoreGestures: widget.ignoreGestures ?? false,
      initialRating: widget.initialRating ?? 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemSize: widget.itemSize ?? 27.v,
      unratedColor: widget.unselectedColor,
      itemCount: widget.itemCount ?? 5,
      updateOnDrag: true,
      itemBuilder: (
        context,
        index,
      ) {
        return Icon(
          Icons.star,
          color: Colors.yellow[700],
        );
      },
      onRatingUpdate: (rating) {
        widget.controller?.updateRating(rating);
        widget.onRatingUpdate?.call(rating);
      },
    );
  }
}

class RatingController {
  var initialRating;

  RatingController({this.initialRating = 0}) : rating = initialRating ?? 0;

  double rating;

  RatingController copyWith({
    double? rating,
  }) {
    return RatingController(
      initialRating: rating ?? this.rating,
    );
  }

  void updateRating(double value) {
    setState(() {
      rating = value;
    });
  }

  void setState(VoidCallback fn) {
    // Perform any additional logic before updating the rating state if needed.
    fn();
  }
}
