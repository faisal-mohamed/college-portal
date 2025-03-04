-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('SUPER_ADMIN', 'COLLEGE', 'DEPARTMENT', 'HOD', 'FACULTY', 'STUDENT');

-- AlterTable
ALTER TABLE "College" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'COLLEGE';

-- AlterTable
ALTER TABLE "Department" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'DEPARTMENT';

-- AlterTable
ALTER TABLE "Faculty" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'FACULTY';

-- AlterTable
ALTER TABLE "HOD" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'HOD';

-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'STUDENT';

-- AlterTable
ALTER TABLE "SuperAdmin" ADD COLUMN     "role" "UserRole" NOT NULL DEFAULT 'SUPER_ADMIN';
