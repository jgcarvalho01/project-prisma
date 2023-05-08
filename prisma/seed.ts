import { faker } from '@faker-js/faker';
import {PrismaClient} from '@prisma/client'
import pkg from 'gerador-validador-cpf'

const {generate} = pkg
const prisma = new PrismaClient()

const createPlayerSoccer = (timeId: number) => {
	return {
		cpf: generate(),
		name: faker.name.firstName(),
		number: +faker.random.numeric(2),
		teamId: timeId

	}
}

async function main(){
	//criando alguns times

	const teams = [
		'Botafogo',
		'Corinthians',
		'Flamengo',
		'Palmeiras',
		'São Paulo',
		'Santos',
		'Atlético-MG',
		'Vasco',
		'Goiás'
	]
	for(var i=0; i<teams.length;i++){
		await prisma.team.create({
			data:{
				name: teams[i]
			}
		})
	}
	
	const timeChoice = await prisma.team.findMany()
	//criando 100 jogadores e colocando em times aleatórios
	var size = 100
	while (size>0){
		await prisma.soccerPlayer.create({
			data: createPlayerSoccer(+(timeChoice[size%teams.length].idTeam))
		})
		size--
	}
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
  })