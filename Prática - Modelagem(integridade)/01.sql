CREATE TYPE "typePhone" AS ENUM ('landline', 'mobile');
CREATE TYPE "typeTransactions" AS ENUM ('deposit', 'withdraw');

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "number" INTEGER NOT NULL,
    "type" typePhone 
);

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    "stateId" INTEGER NOT NULL
);

CREATE TABLE "customerAddresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" VARCHAR(30) NOT NULL,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" VARCHAR(11) NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" INTEGER NOT NULL,
    "agency" INTEGER NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE NOT NULl
);

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "type" typeTransactions,
    "time" DATE NOT NULL,
    "description" TEXT NOT NULL,
    "cancelled" BOOLEAN NOT NULL
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "number" INTEGER NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" INTEGER NOT NULL,
    "expirationYear" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);


ALTER TABLE "customerPhone" ADD CONSTRAINT "cp_fk0" FOREIGN KEY ("customersId") REFERENCES "customers"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "ca_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "ca_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "ba_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "cc_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");




