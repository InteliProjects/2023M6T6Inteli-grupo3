import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:luis_s_application/core/app_export.dart';

class CustomRatingBar extends StatefulWidget {
  CustomRatingBar({
    Key? key,
    this.alignment,
    this.ignoreGestures,
    this.initialRating,
    this.itemSize,
    this.itemCount,
    this.color,
    this.onRatingUpdate,
  }) : super(
          key: key,
        );

  final Alignment? alignment;
  final bool? ignoreGestures;
  final double? initialRating;
  final double? itemSize;
  final int? itemCount;
  final Color? color;
  final Function(double)? onRatingUpdate;

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  late RatingController _ratingController;

  @override
  void initState() {
    super.initState();
    _ratingController =
        RatingController(initialRating: widget.initialRating ?? 0);
  }

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
      ignoreGestures: true,
      initialRating: widget.initialRating ?? 0,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: widget.itemSize ?? 27.v,
      unratedColor: Colors.grey[700],
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
        _ratingController.updateRating(rating);
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
