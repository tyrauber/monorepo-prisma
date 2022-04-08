# Monorepo Prisma example

The goal of this example to show a simple monorepo setup with Prisma. The `PrismaClient` instance is created in the `prisma` package and can be accessed by other packages in the monorepo.

## Usage

```
git clone git@github.com:nikolasburk/monorepo-prisma.git
cd monorepo-prisma
yarn
yarn build
yarn start
```

## Architecture

This architecture uses `yarn workspaces` with an `/apps/` and `/packages/`, for long running scripts and libraries respectively.