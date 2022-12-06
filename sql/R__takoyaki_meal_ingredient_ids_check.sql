alter table takoyaki.meals drop constraint if exists ck_takoyaki_meals_ingredient_ids;
alter table takoyaki.meals add constraint ck_takoyaki_meals_ingredient_ids check ( meals.ingredient_ids = array_sort(takoyaki.meals.ingredient_ids) );
