import {PrismaClient} from '@prisma/client'
import pkg from 'gerador-validador-cpf'

const {generate} = pkg
console.log('testing generate', generate())

const prisma = new PrismaClient()

async function main(){
    const deleteTeam = prisma.team.deleteMany()
	const deleteSoccerPlayer = prisma.soccerPlayer.deleteMany()

	await prisma.$transaction([deleteTeam, deleteSoccerPlayer])
}

main()
	.then(async()=>{
		await prisma.$disconnect()
	})
	.catch(async(e)=>{
		console.error(e)
		await prisma.$disconnect()
	})