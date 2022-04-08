import { prisma, PrismaClient, Prisma } from './index'
import { faker } from '@faker-js/faker';

async function main() {
  console.log(`Start seeding ...`)

  const userData = Array.from({ length: 3 }, (x, i) => ({
    name: faker.name.findName(),
    email: faker.internet.email()
  }));
  for (const u of userData) {
    const user = await prisma.user.create({
      data: u,
    })
    console.log(`Created user with id: ${user.id}`)
  }
  console.log(`Seeding finished.`)
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
