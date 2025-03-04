-- CreateEnum
CREATE TYPE "CollegeStatus" AS ENUM ('PENDING', 'REJECTED', 'ACTIVE');

-- AlterTable
ALTER TABLE "College" ADD COLUMN     "status" "CollegeStatus" NOT NULL DEFAULT 'PENDING';
