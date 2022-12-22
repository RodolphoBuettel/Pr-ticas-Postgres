CREATE TABLE "companies" (
	"id" serial PRIMARY KEY,
	"name" varchar(50) NOT NULL UNIQUE,
	"acronym" varchar(3) NOT NULL UNIQUE
);

CREATE TABLE "flights" (
	"id" serial PRIMARY KEY,
	"companies_id" integer NOT NULL REFERENCES "companies"("id"),
	"acronym" varchar(7) NOT NULL UNIQUE,
	"going_out_id" integer NOT NULL REFERENCES "airports"("id"),
	"destiny_id" integer NOT NULL REFERENCES "airports"("id"),
	"exit" DATE NOT NULL,
	"arrival" DATE NOT NULL,
);

CREATE TABLE "airports" (
	"id" serial PRIMARY KEY,
	"acronym" varchar(3) NOT NULL UNIQUE,
	"name" varchar(50) NOT NULL UNIQUE,
);




