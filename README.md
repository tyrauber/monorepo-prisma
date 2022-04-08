# Prisma Monorepo Example

Simple Express API with Prisma and Postgresql.

# Features:

- [X] Yarn Workspaces
- [X] Prisma Postgres Package
- [X] Prisma Migrations 
- [X] Express API App
- [ ] Jest / Supertest Test Suite
- [ ] GitHub Actions CI/CD
- [ ] Fly.io Deployment

The goal is to keep this as simple as possible for demonstration and extensibility.

Fork! Bug Fixes welcome.

## Usage

```
git clone git@github.com:tyrauber/monorepo-prisma.git
cd monorepo-prisma
yarn
yarn build
yarn start
```

## Deploy

Signup for fly and install the flctl library.

`fly launch`

## Architecture

This architecture uses `yarn workspaces` with an `/apps/` and `/packages/`, for long running scripts and libraries respectively. The `PrismaClient` instance is created in the `prisma` package and can be accessed by other packages/apps. Migrations and data modeling is here. The typescript is compiled with a build script and exported and used as commonjs.




