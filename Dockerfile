FROM node:lts AS base
WORKDIR /app/
RUN apt-get update && apt-get install openssl
ADD package.json yarn.lock tsconfig.json ./
COPY /apps/ ./apps/
COPY /packages/ ./packages/

FROM base as deps
WORKDIR /app/

RUN yarn install && yarn build

RUN npx prisma generate --schema /app/packages/prisma/schema.prisma

FROM base as runner
WORKDIR /app/
RUN yarn install --production --pure-lockfile --non-interactive --cache-folder ./ycache; rm -rf ./ycache

COPY --from=deps /app/node_modules/.prisma /app/node_modules/.prisma
COPY --from=deps /app/apps/ /app/apps/
COPY --from=deps /app/packages/ /app/packages/

EXPOSE 8080
ARG PORT 8080
ENV NODE_ENV production

CMD ["yarn", "start"]
