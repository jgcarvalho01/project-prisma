-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_SoccerPlayer" (
    "cpf" TEXT NOT NULL PRIMARY KEY,
    "number" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "teamId" INTEGER,
    CONSTRAINT "SoccerPlayer_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "Team" ("idTeam") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_SoccerPlayer" ("cpf", "name", "number", "teamId") SELECT "cpf", "name", "number", "teamId" FROM "SoccerPlayer";
DROP TABLE "SoccerPlayer";
ALTER TABLE "new_SoccerPlayer" RENAME TO "SoccerPlayer";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
