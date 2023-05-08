-- CreateTable
CREATE TABLE "Team" (
    "idTeam" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "SoccerPlayer" (
    "cpf" TEXT NOT NULL PRIMARY KEY,
    "number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "teamId" INTEGER NOT NULL,
    CONSTRAINT "SoccerPlayer_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team" ("idTeam") ON DELETE RESTRICT ON UPDATE CASCADE
);
