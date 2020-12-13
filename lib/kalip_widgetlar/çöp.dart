ListView.builder(
itemBuilder: (_, index) {
return IndstryBuildingWidgeti(index);
},
itemCount: IndustryBuilding.industry_building.length),
ListView.builder(
itemBuilder: (_, index) {
return FoodBuildingWidgeti(context, index);
},
itemCount: FoodBuilding.food_building.length),