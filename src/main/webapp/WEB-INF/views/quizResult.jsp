<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Career Result – CareerConnect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inquiry.css">
    <style>
        /* ══════════════════════════════════════
           Quiz Result – Extra Styles
           (same dark theme, no conflicts)
        ═══════════════════════════════════════ */

        /* ── Hero result banner ── */
        .result-hero {
            background: linear-gradient(135deg, rgba(79,195,247,0.12), rgba(79,195,247,0.04));
            border: 1px solid rgba(79,195,247,0.35);
            border-radius: 12px;
            padding: 28px 30px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .result-icon {
            width: 56px;
            height: 56px;
            background: rgba(79,195,247,0.15);
            border: 1px solid rgba(79,195,247,0.4);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            flex-shrink: 0;
        }

        .result-label {
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #8b949e;
            margin-bottom: 6px;
        }

        .result-title {
            font-size: 1.6rem;
            font-weight: 700;
            color: #4fc3f7;
            line-height: 1.2;
        }

        .result-sub {
            margin-top: 6px;
            font-size: 0.85rem;
            color: #8b949e;
        }

        /* ── Section heading ── */
        .colleges-heading {
            font-size: 0.95rem;
            font-weight: 600;
            color: #e6edf3;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .colleges-heading::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #30363d;
        }

        /* ── Table ── */
        .college-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.875rem;
        }

        .college-table thead tr {
            background: #0d1117;
            border-bottom: 2px solid #30363d;
        }

        .college-table th {
            padding: 12px 14px;
            text-align: left;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            color: #8b949e;
        }

        .college-table tbody tr {
            border-bottom: 1px solid #21262d;
            transition: background 0.15s;
        }

        .college-table tbody tr:last-child {
            border-bottom: none;
        }

        .college-table tbody tr:hover {
            background: rgba(79,195,247,0.04);
        }

        .college-table td {
            padding: 13px 14px;
            color: #c9d1d9;
            vertical-align: middle;
        }

        .college-table td:first-child {
            color: #8b949e;
            font-size: 0.8rem;
            width: 40px;
        }

        .college-name {
            font-weight: 600;
            color: #e6edf3;
        }

        /* Type badge */
        .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.72rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.04em;
        }

        .badge-govt {
            background: rgba(63,185,80,0.12);
            color: #3fb950;
            border: 1px solid rgba(63,185,80,0.3);
        }

        .badge-private {
            background: rgba(79,195,247,0.1);
            color: #4fc3f7;
            border: 1px solid rgba(79,195,247,0.25);
        }

        .badge-deemed {
            background: rgba(210,153,34,0.12);
            color: #d2991e;
            border: 1px solid rgba(210,153,34,0.3);
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #8b949e;
            font-size: 0.9rem;
        }

        .empty-state span {
            font-size: 2rem;
            display: block;
            margin-bottom: 10px;
        }

        /* Back link */
        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-top: 24px;
            padding: 10px 18px;
            background: #161b22;
            border: 1px solid #30363d;
            border-radius: 6px;
            color: #8b949e;
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            transition: 0.2s;
        }

        .back-btn:hover {
            border-color: #4fc3f7;
            color: #4fc3f7;
            background: rgba(79,195,247,0.05);
        }
    </style>
</head>
<body>

<!-- ═══════════ SIDEBAR ═══════════ -->
<aside class="sidebar">

    <a href="${pageContext.request.contextPath}/student/dashboard" class="sidebar-logo">
        <span class="logo-box">CC</span>
        CareerConnect
    </a>

    <div class="sidebar-user">
        <div class="avatar">
            ${sessionScope.loggedInUser.username.substring(0,1)}
        </div>
        <div>
            <div class="user-name">${sessionScope.loggedInUser.username}</div>
            <div class="user-role">${sessionScope.loggedInUser.role}</div>
        </div>
    </div>

    <nav class="sidebar-nav">
        <a href="${pageContext.request.contextPath}/student/dashboard" class="nav-link">
            Home
        </a>
        <a href="${pageContext.request.contextPath}/student/dashboard#colleges" class="nav-link">
            View Colleges
        </a>
        <a href="${pageContext.request.contextPath}/student/Inquiry" class="nav-link">
            Send Inquiry
        </a>
        <a href="${pageContext.request.contextPath}/student//quiz" class="nav-link active">
            Career Quiz
        </a>
    </nav>

    <div class="sidebar-bottom">
        <a href="${pageContext.request.contextPath}/login#" class="nav-link">
            Logout
        </a>
    </div>

</aside>

<!-- ═══════════ MAIN ═══════════ -->
<div class="main-area">

    <header class="topbar">
        <div class="topbar-title">Career Quiz – Result</div>
        <div class="topbar-user">
            Welcome, <strong>${sessionScope.loggedInUser.username}</strong>
        </div>
    </header>

    <main class="page-content">

        <div class="section-title">Your Career Analysis</div>

        <!-- ── Result Hero ── -->
        <div class="result-hero">
            <div class="result-icon">🎯</div>
            <div>
                <div class="result-label">Recommended Career Stream</div>
                <div class="result-title">${result}</div>
                <div class="result-sub">
                    Based on your answers, the best-fit career path for you is <strong style="color:#e6edf3;">${result}</strong>.
                    Explore the colleges below to get started.
                </div>
            </div>
        </div>

        <!-- ── Suggested Colleges Table ── -->
        <div class="form-wrap" style="max-width:100%;">

            <div class="colleges-heading">🏫 Suggested Colleges</div>

            <c:choose>
                <c:when test="${not empty colleges}">
                    <table class="college-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>College Name</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Type</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="college" items="${colleges}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>
                                    <span class="college-name">${college.name}</span>
                                </td>
                                <td>${college.city}</td>
                                <td>${college.state}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${college.type == 'Government' || college.type == 'Govt'}">
                                            <span class="badge badge-govt">${college.type}</span>
                                        </c:when>
                                        <c:when test="${college.type == 'Deemed'}">
                                            <span class="badge badge-deemed">${college.type}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-private">${college.type}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <span>🔍</span>
                        No colleges found for this career stream yet.
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

        <a href="${pageContext.request.contextPath}/student/quiz" class="back-btn">
            ← Retake Quiz
        </a>
        <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn" style="margin-left:10px;">
            ⬅ Back to Dashboard
        </a>

    </main>

</div>

</body>
</html>
