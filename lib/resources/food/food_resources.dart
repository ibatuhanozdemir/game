class FoodResources {

  static List food_resources_name = ["food"];
  static List food_resources_count = [
    {"food": 0}
  ];

  static List food_resource_sublist_name = ['mushroom', 'raw meet'];
  static List food_resource_sublist_count = [
    {'mushroom': 0, 'kaysayı': 1},
    {'raw meet': 0, 'kaysayı': 2}
  ];

  void calculateFood() {
    food_resources_count[0]['food'] = 0;
    food_resource_sublist_name.forEach((element) {
      int aradeger = food_resource_sublist_count[
              food_resource_sublist_name.indexOf(element)][element] *
          food_resource_sublist_count[
              food_resource_sublist_name.indexOf(element)]['kaysayı'];
      food_resources_count[0]['food'] =
          food_resources_count[0]['food'] + aradeger;
    });
  }
}
