<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Send Inquiry – CareerConnect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inquiry.css">
</head>
<body>

<!-- SIDEBAR -->
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
        <a href="${pageContext.request.contextPath}/inquiry" class="nav-link active">
            Send Inquiry
        </a>
    </nav>

    <div class="sidebar-bottom">
        <a href="${pageContext.request.contextPath}/logout" class="nav-link">
            Logout
        </a>
    </div>

</aside>

<!-- MAIN -->
<div class="main-area">

    <header class="topbar">
        <div class="topbar-title">Send Inquiry</div>
        <div class="topbar-user">
            Welcome, <strong>${sessionScope.loggedInUser.username}</strong>
        </div>
    </header>

    <main class="page-content">

        <div class="section-title">College Inquiry Form</div>

        <div class="form-wrap">

            <form action="${pageContext.request.contextPath}/submitInquiry" method="post">

                <div class="form-row">
                    <div class="field-group">
                        <label>Full Name</label>
                        <input type="text" name="name"
                               value="${sessionScope.loggedInUser.username}"
                               required>
                    </div>

                    <div class="field-group">
                        <label>Email</label>
                        <input type="email" name="email"
                               value="${sessionScope.loggedInUser.email}"
                               required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="field-group">
                        <label>Phone</label>
                        <input type="tel" name="phone" placeholder="+91 99999 99999">
                    </div>

                    <div class="field-group">
                        <label>Select College</label>
                        <select name="collegeId" required>
                            <option value="">-- Choose College --</option>

                            <!-- Dynamic Colleges -->
                            <c:forEach var="college" items="${colleges}">
                                <option value="${college.id}">
                                    ${college.name} - ${college.city}
                                </option>
                            </c:forEach>

                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="field-group">
                        <label>Course of Interest</label>
                        <input type="text" name="course"
                               placeholder="e.g. B.Tech Computer Science" required>
                    </div>

                    <div class="field-group">
                        <label>Admission Year</label>
                        <select name="year">
                            <option>2026</option>
                            <option>2027</option>
                            <option>2028</option>
                        </select>
                    </div>
                </div>

                <div class="field-group" style="margin-bottom:1.2rem">
                    <label>Message</label>
                    <textarea name="message" rows="4"
                              placeholder="Your questions about admission, fees, hostel..."></textarea>
                </div>

                <button type="submit" class="btn-submit">Send Inquiry</button>

            </form>

            <!-- Success message -->
            <c:if test="${param.success == 'true'}">
                <div class="success-msg" style="display:block;">
                    Inquiry sent successfully! We will contact you soon.
                </div>
            </c:if>

        </div>

    </main>

</div>

</body>
</html>