CREATE TABLE "clientes" (
	"id" SERIAL PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"senha" TEXT NOT NULL
);



CREATE TABLE "categorias" (
	"id" SERIAL PRIMARY KEY,
	"nome" TEXT NOT NULL UNIQUE
);


CREATE TABLE "itens" (
	"id" SERIAL PRIMARY KEY,
	"categoriaId" INTEGER NOT NULL REFERENCES "categorias"("id"),
	"tamanhoId" INTEGER NOT NULL REFERENCES "tamanhos"("id"),
	"nome" TEXT NOT NULL UNIQUE,
	"img_url" TEXT NOT NULL,
	"preco" REAL NOT NULL
);


CREATE TABLE "tamanhos" (
	"id" SERIAL PRIMARY KEY,
	"tamanho" TEXT NOT NULL UNIQUE
);



CREATE TABLE "endereço" (
	"id" SERIAL PRIMARY KEY,
	"clienteId" INTEGER NOT NULL REFERENCES "clientes"("id"),
	"rua" TEXT NOT NULL,
	"numero" INTEGER NOT NULL,
	"complemento" TEXT NOT NULL
);



CREATE TABLE "compras" (
	"id" SERIAL PRIMARY KEY,
	"clienteId" INTEGER NOT NULL REFERENCES "clientes"("id"),
	"status" TEXT CHECK ("status" IN('criada','paga','entregue','cancelada')),
	"dataCompra" DATE DEFAULT NULL
);



CREATE TABLE "itensSelecionados" (
	"id" SERIAL PRIMARY KEY,
	"compraId" INTEGER NOT NULL REFERENCES "compras"("id"),
	"itensId" INTEGER NOT NULL REFERENCES "itens"("id"),
	"quantidade" INTEGER NOT NULL
);