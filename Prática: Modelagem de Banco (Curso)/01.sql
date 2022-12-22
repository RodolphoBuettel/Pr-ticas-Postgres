CREATE TYPE "grade" AS ENUM( "Abaixo das expectativas", "Dentro das Expectativas", "Acima das Expectativas");

CREATE TABLE "public.students" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"class_id" integer NOT NULL,
);

CREATE TABLE "public.classes" (
	"id" serial NOT NULL,
	"code" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "public.transfer_history" (
	"id" serial PRIMARY KEY,
	"students_id" integer NOT NULL,
	"going_out_id" integer NOT NULL,
	"entering_id" integer NOT NULL,
	"start" DATE NOT NULL,
	"end" DATE NOT NULL,
);

CREATE TABLE "public.projects" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"released" DATE NOT NULL,
	"date_limit" DATE NOT NULL,
	"grade" grade,
	"students_id" integer NOT NULL,
	"module_id" integer NOT NULL,
);

CREATE TABLE "public.modules" (
	"id" serial PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
);

ALTER TABLE "students" ADD CONSTRAINT "students_fk0" FOREIGN KEY ("class_id") REFERENCES "classes"("id");

ALTER TABLE "transfer_history" ADD CONSTRAINT "transfer_history_fk0" FOREIGN KEY ("students_id") REFERENCES "students"("id");
ALTER TABLE "transfer_history" ADD CONSTRAINT "transfer_history_fk1" FOREIGN KEY ("going_out_id") REFERENCES "classes"("id");
ALTER TABLE "transfer_history" ADD CONSTRAINT "transfer_history_fk2" FOREIGN KEY ("entering_id") REFERENCES "classes"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("students_id") REFERENCES "students"("id");
ALTER TABLE "projects" ADD CONSTRAINT "projects_fk1" FOREIGN KEY ("module_id") REFERENCES "modules"("id");