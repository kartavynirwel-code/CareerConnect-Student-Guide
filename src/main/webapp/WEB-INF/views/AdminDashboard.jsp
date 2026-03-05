<%@ page import="com.careerconnect.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Users user = (Users) session.getAttribute("loggedInUser");
    if(user == null){
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerConnect · Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
<body>

<div class="admin-dashboard-container">

    <!-- ========== SIDEBAR ========== -->
    <aside class="admin-sidebar">
        <div class="admin-sidebar-header">
            <div class="admin-logo">
                <span class="admin-logo-icon">AD</span>
                <span class="admin-logo-text">Career<span>Connect</span></span>
            </div>
            <div class="admin-sidebar-badge">Admin Portal</div>
        </div>

        <div class="admin-sidebar-user">
            <div class="admin-user-avatar">
                ${fn:substring(sessionScope.adminUser != null ? sessionScope.adminUser.username : 'A', 0, 1)}
            </div>
            <div class="admin-user-info">
                <div class="admin-user-name">${sessionScope.adminUser != null ? sessionScope.adminUser.username : 'Admin'}</div>
                <div class="admin-user-role">Administrator</div>
            </div>
        </div>

        <nav class="admin-sidebar-nav">
            <ul class="admin-nav-list">
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/dashboard" class="admin-nav-link active">
                        <span class="admin-nav-icon">📊</span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/students" class="admin-nav-link">
                        <span class="admin-nav-icon">👥</span>
                        <span>Students</span>
                        <span class="admin-nav-badge">245</span>
                    </a>
                </li>
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/colleges" class="admin-nav-link">
                        <span class="admin-nav-icon">🏛️</span>
                        <span>Colleges</span>
                        <span class="admin-nav-badge">52</span>
                    </a>
                </li>
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/inquiries" class="admin-nav-link">
                        <span class="admin-nav-icon">📩</span>
                        <span>Inquiries</span>
                        <span class="admin-nav-badge admin-badge-warning">12</span>
                    </a>
                </li>
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/courses" class="admin-nav-link">
                        <span class="admin-nav-icon">📚</span>
                        <span>Courses</span>
                        <span class="admin-nav-badge">86</span>
                    </a>
                </li>
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/reports" class="admin-nav-link">
                        <span class="admin-nav-icon">📈</span>
                        <span>Reports</span>
                    </a>
                </li>
                <li class="admin-nav-item">
                    <a href="${pageContext.request.contextPath}/admin/settings" class="admin-nav-link">
                        <span class="admin-nav-icon">⚙️</span>
                        <span>Settings</span>
                    </a>
                </li>
            </ul>
        </nav>

        <div class="admin-sidebar-footer">
            <a href="${pageContext.request.contextPath}/admin/logout" class="admin-logout-btn" onclick="return confirm('Logout from admin panel?')">
                <span class="admin-nav-icon">🚪</span>
                <span>Logout</span>
            </a>
            <div class="admin-copyright">
                © 2026 CareerConnect<br>v2.0.1
            </div>
        </div>
    </aside>

    <!-- ========== MAIN CONTENT ========== -->
    <main class="admin-main-content">

        <!-- Top Bar -->
        <header class="admin-top-bar">
            <div class="admin-top-bar-left">
                <button class="admin-menu-toggle" id="menuToggle">☰</button>
                <div class="admin-page-title">
                    <span class="admin-title-main">Dashboard</span>
                    <span class="admin-title-separator">/</span>
                    <span class="admin-title-sub">Overview</span>
                </div>
            </div>

            <div class="admin-top-bar-right">
                <div class="admin-search">
                    <span class="admin-search-icon">🔍</span>
                    <input type="text" class="admin-search-input" placeholder="Search...">
                </div>

                <div class="admin-notifications">
                    <span class="admin-notification-icon">🔔</span>
                    <span class="admin-notification-badge">3</span>
                </div>

                <div class="admin-profile">
                    <div class="admin-profile-avatar">
                        ${fn:substring(sessionScope.adminUser != null ? sessionScope.adminUser.username : 'A', 0, 1)}
                    </div>
                    <div class="admin-profile-dropdown">
                        <span>${sessionScope.adminUser != null ? sessionScope.adminUser.username : 'Admin'}</span>
                        <span class="admin-dropdown-icon">▼</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- Content Area -->
        <div class="admin-content">

            <!-- Welcome Banner -->
            <div class="admin-welcome-banner">
                <div class="admin-welcome-text">
                    <h2>Welcome back, ${sessionScope.adminUser != null ? sessionScope.adminUser.username : 'Admin'}! 👋</h2>
                    <p>Here's what's happening with your platform today.</p>
                </div>
                <div class="admin-welcome-stats">
                    <div class="admin-welcome-stat">
                        <span class="admin-welcome-stat-value">${lastLoginDate}</span>
                        <span class="admin-welcome-stat-label">Last Login</span>
                    </div>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="admin-stats-grid">
                <div class="admin-stat-card">
                    <div class="admin-stat-icon" style="background: rgba(124, 58, 237, 0.15); color: #7c3aed;">
                        👥
                    </div>
                    <div class="admin-stat-content">
                        <div class="admin-stat-value">${totalStudents != null ? totalStudents : '1,284'}</div>
                        <div class="admin-stat-label">Total Students</div>
                        <div class="admin-stat-trend positive">↑ 12% this month</div>
                    </div>
                </div>

                <div class="admin-stat-card">
                    <div class="admin-stat-icon" style="background: rgba(16, 185, 129, 0.15); color: #10b981;">
                        🏛️
                    </div>
                    <div class="admin-stat-content">
                        <div class="admin-stat-value">${totalColleges != null ? totalColleges : '52'}</div>
                        <div class="admin-stat-label">Active Colleges</div>
                        <div class="admin-stat-trend positive">↑ 3 new this month</div>
                    </div>
                </div>

                <div class="admin-stat-card">
                    <div class="admin-stat-icon" style="background: rgba(245, 158, 11, 0.15); color: #f59e0b;">
                        📩
                    </div>
                    <div class="admin-stat-content">
                        <div class="admin-stat-value">${totalInquiries != null ? totalInquiries : '156'}</div>
                        <div class="admin-stat-label">Total Inquiries</div>
                        <div class="admin-stat-trend warning">${pendingInquiries != null ? pendingInquiries : '12'} pending</div>
                    </div>
                </div>

                <div class="admin-stat-card">
                    <div class="admin-stat-icon" style="background: rgba(59, 130, 246, 0.15); color: #3b82f6;">
                        📚
                    </div>
                    <div class="admin-stat-content">
                        <div class="admin-stat-value">${totalCourses != null ? totalCourses : '86'}</div>
                        <div class="admin-stat-label">Active Courses</div>
                        <div class="admin-stat-trend">8 streams</div>
                    </div>
                </div>
            </div>

            <!-- Quick Navigation -->
            <div class="admin-quick-nav">
                <h3 class="admin-section-title">Quick Navigation</h3>
                <div class="admin-quick-nav-grid">
                    <a href="${pageContext.request.contextPath}/admin/students" class="admin-quick-nav-card">
                        <span class="admin-quick-nav-icon">👥</span>
                        <span class="admin-quick-nav-text">Manage Students</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/colleges" class="admin-quick-nav-card">
                        <span class="admin-quick-nav-icon">🏛️</span>
                        <span class="admin-quick-nav-text">Manage Colleges</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/inquiries" class="admin-quick-nav-card">
                        <span class="admin-quick-nav-icon">📩</span>
                        <span class="admin-quick-nav-text">View Inquiries</span>
                        <span class="admin-quick-nav-badge">${pendingInquiries != null ? pendingInquiries : '12'}</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/courses" class="admin-quick-nav-card">
                        <span class="admin-quick-nav-icon">📚</span>
                        <span class="admin-quick-nav-text">Manage Courses</span>
                    </a>
                </div>
            </div>

            <!-- Recent Inquiries Table -->
            <div class="admin-table-section">
                <div class="admin-table-header">
                    <h3 class="admin-section-title">Recent Student Inquiries</h3>
                    <a href="${pageContext.request.contextPath}/admin/inquiries" class="admin-view-all">View All →</a>
                </div>

                <div class="admin-table-responsive">
                    <table class="admin-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student</th>
                            <th>College</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="inq" items="${recentInquiries}" varStatus="status" end="4">
                            <tr>
                                <td>#${inq.id}</td>
                                <td>
                                    <div class="admin-table-user">
                                        <div class="admin-table-avatar">${fn:substring(inq.studentName, 0, 1)}</div>
                                        <div>
                                            <div>${inq.studentName}</div>
                                            <small>${inq.studentEmail}</small>
                                        </div>
                                    </div>
                                </td>
                                <td>${inq.collegeName}</td>
                                <td><span class="admin-badge admin-badge-primary">${inq.queryType}</span></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${inq.status == 'Pending'}">
                                            <span class="admin-status-badge admin-status-pending">⏳ Pending</span>
                                        </c:when>
                                        <c:when test="${inq.status == 'In Progress'}">
                                            <span class="admin-status-badge admin-status-progress">🔄 In Progress</span>
                                        </c:when>
                                        <c:when test="${inq.status == 'Resolved'}">
                                            <span class="admin-status-badge admin-status-resolved">✅ Resolved</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>${inq.date}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/inquiry-details?id=${inq.id}" class="admin-action-btn">View</a>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty recentInquiries}">
                            <tr>
                                <td colspan="7" class="admin-text-center admin-text-muted">No recent inquiries</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Two Column Layout -->
            <div class="admin-two-column">
                <!-- Recent Students -->
                <div class="admin-column">
                    <div class="admin-table-header">
                        <h3 class="admin-section-title">Recently Joined Students</h3>
                        <a href="${pageContext.request.contextPath}/admin/students" class="admin-view-all">View All →</a>
                    </div>

                    <div class="admin-student-list">
                        <c:forEach var="student" items="${recentStudents}" varStatus="status" end="3">
                            <div class="admin-student-item">
                                <div class="admin-student-avatar">${fn:substring(student.name, 0, 1)}</div>
                                <div class="admin-student-details">
                                    <div class="admin-student-name">${student.name}</div>
                                    <div class="admin-student-meta">${student.email} · Joined ${student.joinDate}</div>
                                </div>
                                <span class="admin-badge admin-badge-success">Active</span>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- System Status -->
                <div class="admin-column">
                    <div class="admin-table-header">
                        <h3 class="admin-section-title">System Status</h3>
                    </div>

                    <div class="admin-system-status">
                        <div class="admin-status-item">
                            <span class="admin-status-label">Server Status</span>
                            <span class="admin-status-value admin-status-online">● Online</span>
                        </div>
                        <div class="admin-status-item">
                            <span class="admin-status-label">Database</span>
                            <span class="admin-status-value admin-status-online">● Connected</span>
                        </div>
                        <div class="admin-status-item">
                            <span class="admin-status-label">Last Backup</span>
                            <span class="admin-status-value">Today, 02:30 AM</span>
                        </div>
                        <div class="admin-status-item">
                            <span class="admin-status-label">Active Sessions</span>
                            <span class="admin-status-value">24 users</span>
                        </div>
                        <div class="admin-status-item">
                            <span class="admin-status-label">Storage Used</span>
                            <span class="admin-status-value">45% (4.5 GB)</span>
                        </div>
                    </div>

                    <div class="admin-progress-section">
                        <div class="admin-progress-item">
                            <div class="admin-progress-header">
                                <span>CPU Usage</span>
                                <span>32%</span>
                            </div>
                            <div class="admin-progress-bar">
                                <div class="admin-progress-fill" style="width: 32%; background: #7c3aed;"></div>
                            </div>
                        </div>
                        <div class="admin-progress-item">
                            <div class="admin-progress-header">
                                <span>Memory Usage</span>
                                <span>48%</span>
                            </div>
                            <div class="admin-progress-bar">
                                <div class="admin-progress-fill" style="width: 48%; background: #10b981;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script>
    // Toggle sidebar on mobile
    document.getElementById('menuToggle')?.addEventListener('click', function() {
        document.querySelector('.admin-sidebar').classList.toggle('active');
    });

    // Close sidebar when clicking outside on mobile
    document.addEventListener('click', function(event) {
        const sidebar = document.querySelector('.admin-sidebar');
        const menuToggle = document.getElementById('menuToggle');

        if (window.innerWidth <= 768) {
            if (!sidebar.contains(event.target) && !menuToggle.contains(event.target)) {
                sidebar.classList.remove('active');
            }
        }
    });
</script>

</body>
</html>