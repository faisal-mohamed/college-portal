/* eslint-disable @typescript-eslint/no-explicit-any */

import { NextRequest, NextResponse } from "next/server";
import { getToken } from "next-auth/jwt";

const roleRoutes: Record<string, string[]> = {
  SUPER_ADMIN: ["/admin", "/admin/dashboard"],
  COLLEGE: ["/college", "/college/dashboard"],
  DEPARTMENT: ["/department", "/department/dashboard"],
  HOD: ["/hod", "/hod/dashboard"],
  FACULTY: ["/faculty", "/faculty/dashboard"],
  STUDENT: ["/student", "/student/dashboard"],
};

export async function middleware(req: NextRequest) {
  const token = await getToken({ req, secret: process.env.NEXTAUTH_SECRET });

  const pathname = req.nextUrl.pathname; 

    const publicRoutes = [
      "/", 
      "/auth/login", 
      "/api/auth/signin",
      "/auth/superadmin", 
      "/auth/college", 
      "/auth/department", 
      "/auth/hod", 
      "/auth/faculty", 
      "/auth/student"
    ];
  if (publicRoutes.includes(pathname)) {
    return NextResponse.next();
  }

  if (!token) {
    return NextResponse.redirect(new URL("/auth/login", req.url));
  }

  const userRole : any = token.role;

  const allowedRoutes = roleRoutes[userRole] || [];
  if (!allowedRoutes.some(route => pathname.startsWith(route))) {
    return NextResponse.redirect(new URL("/", req.url)); // Redirect unauthorized users
  }

  return NextResponse.next(); // ✅ Allow request to proceed
}

// ✅ Apply middleware only to protected routes
export const config = {
  matcher: [
    "/admin/:path*",
    "/college/:path*",
    "/department/:path*",
    "/hod/:path*",
    "/faculty/:path*",
    "/student/:path*",
  ],
};
