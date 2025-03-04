/*
  Warnings:

  - Added the required column `affiliated_university` to the `College` table without a default value. This is not possible if the table is not empty.
  - Added the required column `council_issuing_code` to the `College` table without a default value. This is not possible if the table is not empty.
  - Added the required column `deemed_university` to the `College` table without a default value. This is not possible if the table is not empty.
  - Added the required column `recognition_status` to the `College` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "College" ADD COLUMN     "affiliated_university" TEXT NOT NULL,
ADD COLUMN     "council_issuing_code" TEXT NOT NULL,
ADD COLUMN     "deemed_university" TEXT NOT NULL,
ADD COLUMN     "institute_code" TEXT,
ADD COLUMN     "recognition_status" TEXT NOT NULL;
