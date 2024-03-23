class MealsDetails {
  int? id;
  String mealName;
  String mealImg;
  String ingredientsAndMeasurements;
  String instruction;

  MealsDetails(
      {this.id,
      required this.mealName,
      required this.mealImg,
      required this.ingredientsAndMeasurements,
      required this.instruction});

  factory MealsDetails.fromMap(Map<String, dynamic> map) {
    return MealsDetails(
      id: map["id"],
      mealName: map['mealName'],
      mealImg: map['mealImg'],
      ingredientsAndMeasurements: map['ingredientsAndMeasurements'],
      instruction: map['instruction'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "mealName": mealName,
      "mealImg": mealImg,
      "ingredientsAndMeasurements": ingredientsAndMeasurements,
      "instruction": instruction,
    };
  }
}
