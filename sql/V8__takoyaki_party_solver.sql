

create schema takoyaki;

create table takoyaki.ingredients (
    ingredient_id serial primary key
    , name varchar(100) not null
    , kcal numeric not null
    , carb numeric not null
    , protein numeric not null
    , fat numeric not null
);

create table takoyaki.meals (
    meal_id serial primary key
    , name varchar(100) null
);

create table takoyaki.ingredients__meals (
    ingredient__meal_id serial primary key
    , meal_id int not null
    , ingredient_id int not null
);

create index ix_takoyaki_ingredients__meals_meal_id on takoyaki.ingredients__meals(meal_id);
create index ix_takoyaki_ingredients__meals_ingredient_id on takoyaki.ingredients__meals(ingredient_id);
create unique index ixu_ix_takoyaki_ingredients__meals_meal_id_ingredient_id on takoyaki.ingredients__meals(meal_id, ingredient_id);

alter table takoyaki.ingredients__meals add constraint fk_ingredients__meals_meal_id
    foreign key (meal_id) references takoyaki.meals(meal_id);
alter table takoyaki.ingredients__meals add constraint fk_ingredients__meals_ingredient_id
    foreign key (ingredient_id) references takoyaki.ingredients(ingredient_id);

-- what i have unlocked now
insert into takoyaki.ingredients (name, kcal, carb, protein, fat)
VALUES 
    ('octopus', 224, 21.0, 4.8, 0.3),
    ('beef', 263, 21.0, 3.6, 5.9),
    ('emmental', 274, 21.3, 5.3, 4.2),
    ('sausage', 246, 21.3, 3.4, 4.8),
    ('cucumber', 193, 24.4, 0.3, 0.0)
    ;


