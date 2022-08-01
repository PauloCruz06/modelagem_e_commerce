CREATE DATABASE "loja";

CREATE TABLE users (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE categories (
	id SERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TYPE "size" AS ENUM (
	'P', 'M', 'G', 'GG'
);

CREATE TABLE products (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	"categoryId" INTEGER NOT NULL REFERENCES categories(id),
	size VARCHAR(3) NOT NULL,
	price INTEGER NOT NULL,
	"mainImage" TEXT NOT NULL,
	"secondImage" TEXT,
	"thirdImage" TEXT
);

CREATE TYPE "purchaseStatus" AS ENUM (
	'create',
	'paid',
	'delivered',
	'canceled'
);

CREATE TABLE "purchases" (
	id SERIAL NOT NULL PRIMARY KEY,
	"userId" INTEGER NOT NULL REFERENCES users(id),
	"productId" INTEGER NOT NULL REFERENCES products(id),
	"quantity" INTEGER NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	"paymentMethod" VARCHAR(30) NOT NULL,
	"paymentValue" BIGINT NOT NULL,
	TYPE "purchaseStatus" NOT NULL DEFAULT 'create',
	"purchaseDate" DATE NOT NULL DEFAULT NOW()
);