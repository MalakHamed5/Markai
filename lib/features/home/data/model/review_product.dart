import 'package:ecommerse/core/api/urls.dart';

class ReviewProduct {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const ReviewProduct(
      {required this.rating,
      required this.comment,
      required this.date,
      required this.reviewerName,
      required this.reviewerEmail});

  factory ReviewProduct.fromJson(Map<String, dynamic> json) {
    return ReviewProduct(
      rating: json[ApiKeys.rating] ?? 0,
      comment: json[ApiKeys.comment] ?? "",
      date: json[ApiKeys.date] ?? "",
      reviewerName: json[ApiKeys.reviewerName] ?? "",
      reviewerEmail: json[ApiKeys.reviewerEmail] ?? "",
    );
  }
}
