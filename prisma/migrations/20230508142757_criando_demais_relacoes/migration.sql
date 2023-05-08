-- CreateTable
CREATE TABLE "Color" (
    "idColor" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "color" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ColorTime" (
    "colorId" INTEGER NOT NULL,
    "teamId" INTEGER NOT NULL,

    PRIMARY KEY ("colorId", "teamId"),
    CONSTRAINT "ColorTime_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color" ("idColor") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "ColorTime_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team" ("idTeam") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Match" (
    "idMatch" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "local" TEXT NOT NULL,
    "data" DATETIME NOT NULL,
    "scoreHouse" INTEGER NOT NULL DEFAULT 0,
    "scoreVisitor" INTEGER NOT NULL DEFAULT 0,
    "visitorTeamId" INTEGER NOT NULL,
    "houseTeamId" INTEGER NOT NULL,
    CONSTRAINT "Match_visitorTeamId_fkey" FOREIGN KEY ("visitorTeamId") REFERENCES "Team" ("idTeam") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "Match_houseTeamId_fkey" FOREIGN KEY ("houseTeamId") REFERENCES "Team" ("idTeam") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SoccerMatch" (
    "matchId" INTEGER NOT NULL,
    "cpfPlayer" TEXT NOT NULL,
    "entry" INTEGER NOT NULL DEFAULT 0,
    "position" TEXT NOT NULL,

    PRIMARY KEY ("matchId", "cpfPlayer"),
    CONSTRAINT "SoccerMatch_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match" ("idMatch") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "SoccerMatch_cpfPlayer_fkey" FOREIGN KEY ("cpfPlayer") REFERENCES "SoccerPlayer" ("cpf") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Color_color_key" ON "Color"("color");
