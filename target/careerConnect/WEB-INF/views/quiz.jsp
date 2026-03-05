<%--
  Created by IntelliJ IDEA.
  User: Kartavya
  Date: 05-03-2026
  Time: 11:38 pm
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Career Quiz – CareerConnect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inquiry.css">
    <style>
        /* ── Quiz-specific overrides ── */
        .quiz-question {
            margin-bottom: 24px;
        }

        .quiz-question h3 {
            font-size: 0.95rem;
            font-weight: 600;
            color: #e6edf3;
            margin-bottom: 14px;
        }

        .radio-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .radio-option {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 14px;
            background: #0d1117;
            border: 1px solid #30363d;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
            font-size: 0.9rem;
            color: #c9d1d9;
        }

        .radio-option:hover {
            border-color: #4fc3f7;
            background: rgba(79,195,247,0.05);
        }

        .radio-option input[type="radio"] {
            accent-color: #4fc3f7;
            width: 16px;
            height: 16px;
            cursor: pointer;
        }

        .radio-option input[type="radio"]:checked + span {
            color: #4fc3f7;
            font-weight: 600;
        }

        .result-card {
            margin-top: 28px;
            padding: 20px 24px;
            background: rgba(79,195,247,0.08);
            border: 1px solid rgba(79,195,247,0.3);
            border-radius: 10px;
        }

        .result-card h2 {
            font-size: 0.85rem;
            color: #8b949e;
            font-weight: 600;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .result-card h1 {
            font-size: 1.4rem;
            color: #4fc3f7;
            font-weight: 700;
        }

        .divider {
            border: none;
            border-top: 1px solid #30363d;
            margin: 28px 0;
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
        <a href="${pageContext.request.contextPath}/student/quiz" class="nav-link active">
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
        <div class="topbar-title">Career Quiz</div>
        <div class="topbar-user">
            Welcome, <strong>${sessionScope.loggedInUser.username}</strong>
        </div>
    </header>

    <main class="page-content">

        <div class="section-title">Discover Your Career Path</div>

        <div class="form-wrap">

            <form action="quizResult" method="post">

                <!-- Q1 -->
                <div class="quiz-question">
                    <h3>1️⃣ Which subject do you enjoy most?</h3>
                    <div class="radio-group">
                        <label class="radio-option">
                            <input type="radio" name="q1" value="maths" required>
                            <span>Mathematics</span>
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="q1" value="bio">
                            <span>Biology</span>
                        </label>
                    </div>
                </div>

                <!-- Q2 -->
                <div class="quiz-question">
                    <h3>2️⃣ What interests you most?</h3>
                    <div class="radio-group">
                        <label class="radio-option">
                            <input type="radio" name="q2" value="technology" required>
                            <span>Technology</span>
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="q2" value="human">
                            <span>Helping People</span>
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="q2" value="business">
                            <span>Business</span>
                        </label>
                    </div>
                </div>

                <!-- Q3 -->
                <div class="quiz-question">
                    <h3>3️⃣ What is your greatest strength?</h3>
                    <div class="radio-group">
                        <label class="radio-option">
                            <input type="radio" name="q3" value="logic" required>
                            <span>Logical Thinking</span>
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="q3" value="care">
                            <span>Caring for People</span>
                        </label>
                        <label class="radio-option">
                            <input type="radio" name="q3" value="leader">
                            <span>Leadership</span>
                        </label>
                    </div>
                </div>

                <button type="submit" class="btn-submit">Get Career Suggestion →</button>

            </form>

            <!-- ── Result (shown after form submission) ── -->
            <c:if test="${not empty result}">
                <hr class="divider">
                <div class="result-card">
                    <h2>Your Suggested Career Path</h2>
                    <h1>${result}</h1>
                </div>
            </c:if>

        </div>

    </main>

</div>

</body>
</html>
