CREATE TABLE "public.users" (
	"user_id" serial NOT NULL,
	"username" varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	"password" varchar(30) NOT NULL,
	"email" varchar(30) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipes" (
	"recipe_id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"instructions" varchar(500) NOT NULL,
	"public" BOOLEAN NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "recipes_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ingredients" (
	"ingredient_id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT "ingredients_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery_lists" (
	"grocery_list_id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"user_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "grocery_lists_pk" PRIMARY KEY ("grocery_list_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions" (
	"occasion_id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "occasions_pk" PRIMARY KEY ("occasion_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipe_ingredients" (
	"recipe_ingredients_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "recipe_ingredients_pk" PRIMARY KEY ("recipe_ingredients_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.grocery_list_ingredients" (
	"grocery_list_ingredients_id" serial NOT NULL,
	"grocery_list_id" integer NOT NULL,
	"ingredients_id" integer NOT NULL,
	CONSTRAINT "grocery_list_ingredients_pk" PRIMARY KEY ("grocery_list_ingredients_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasions_recipes" (
	"occasions_recipes_id" serial NOT NULL,
	"occasions_id" integer NOT NULL,
	"recipes_id" integer NOT NULL,
	CONSTRAINT "occasions_recipes_pk" PRIMARY KEY ("occasions_recipes_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");


ALTER TABLE "grocery_lists" ADD CONSTRAINT "grocery_lists_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");
ALTER TABLE "grocery_lists" ADD CONSTRAINT "grocery_lists_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredient_id");

ALTER TABLE "occasions" ADD CONSTRAINT "occasions_fk0" FOREIGN KEY ("user_id") REFERENCES "users"("user_id");
ALTER TABLE "occasions" ADD CONSTRAINT "occasions_fk1" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");

ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");
ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("ingredient_id");

ALTER TABLE "grocery_list_ingredients" ADD CONSTRAINT "grocery_list_ingredients_fk0" FOREIGN KEY ("grocery_list_id") REFERENCES "grocery_lists"("grocery_list_id");
ALTER TABLE "grocery_list_ingredients" ADD CONSTRAINT "grocery_list_ingredients_fk1" FOREIGN KEY ("ingredients_id") REFERENCES "ingredients"("ingredient_id");

ALTER TABLE "occasions_recipes" ADD CONSTRAINT "occasions_recipes_fk0" FOREIGN KEY ("occasions_id") REFERENCES "occasions"("occasion_id");
ALTER TABLE "occasions_recipes" ADD CONSTRAINT "occasions_recipes_fk1" FOREIGN KEY ("recipes_id") REFERENCES "recipes"("recipe_id");









