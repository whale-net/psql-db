
alter table takoyaki.meals add column ingredient_ids integer[];

-- because this uses a function in a repeatable migration, moving it to a repeatable migration file
--alter table takoyaki.meals add constraint ck_takoyaki_meals_ingredient_ids check ( meals.ingredient_ids = array_sort(takoyaki.meals.ingredient_ids) );

create unique index ixu_takoyaki_meals_name on takoyaki.meals(name);
create unique index ixu_takoyaki_meals_ingredient_ids on takoyaki.meals(ingredient_ids);
