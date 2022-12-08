drop schema if exists recipe_builder cascade ;

create schema recipe_builder;

drop table if exists recipe_builder.users;
create table recipe_builder.users
(
    user_id bigserial primary key not null,
    username text not null,
    email text not null,
    password bytea not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by bigint null,
    updated_by bigint null
);

drop table if exists recipe_builder.recipes;
create table recipe_builder.recipes
(
    recipe_id bigserial not null primary key,
    name text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by bigint not null,
    updated_by bigint not null ,

    constraint fk_recipe_created_by
        foreign key(created_by)
        references recipe_builder.users(user_id),
    constraint fk_recipe_updated_by
        foreign key(updated_by)
        references recipe_builder.users(user_id)
);
create index ix_recipes_created_by on recipe_builder.recipes(created_by);
create index ix_recipes_updated_by on recipe_builder.recipes(updated_by);

drop table if exists recipe_builder.recipe_items;
create table recipe_builder.recipe_items(
    recipe_item_id bigserial not null primary key,
    name text not null,
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by bigint not null,
    updated_by bigint not null ,

    constraint fk_recipe_items_created_by
        foreign key(created_by)
        references recipe_builder.users(user_id),
    constraint fk_recipe_items_updated_by
        foreign key(updated_by)
        references recipe_builder.users(user_id)
);

create index ix_recipe_items_created_by on recipe_builder.recipe_items(created_by);
create index ix_recipe_items_updated_by on recipe_builder.recipe_items(updated_by);

drop table if exists recipe_builder.recipes__recipe_items;
create table recipe_builder.recipes__recipe_items(
    recipe_id bigint not null,
    recipe_item_id bigint not null,
    constraint fk_recipes__recipe_items_recipe_id
        foreign key (recipe_id)
        references recipe_builder.recipes(recipe_id),
    constraint fk_recipes__recipe_items_recipe_item_id
        foreign key (recipe_id)
        references recipe_builder.recipe_items(recipe_item_id),

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    created_by bigint not null,
    updated_by bigint not null ,

    constraint fk_recipes__recipe_items_created_by
        foreign key(created_by)
        references recipe_builder.users(user_id),
    constraint fk_recipes__recipe_items_updated_by
        foreign key(updated_by)
        references recipe_builder.users(user_id)
);
create index ix_recipes__recipe_items_recipe_id on recipe_builder.recipes__recipe_items(recipe_id);
create index ix_recipes__recipe_items_recipe_item_id on recipe_builder.recipes__recipe_items(recipe_item_id);
create index ix_recipes__recipe_items_created_by on recipe_builder.recipe_items(created_by);
create index ix_recipes__recipe_items_updated_by on recipe_builder.recipe_items(updated_by);

