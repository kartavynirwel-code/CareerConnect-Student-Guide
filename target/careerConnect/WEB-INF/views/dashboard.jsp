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
    <title>CareerConnect – Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Syne:wght@400;600;700;800&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>

<aside class="sidebar" id="sidebar">
    <div class="sidebar-logo">Career<span>Connect</span></div>
    <ul class="nav-list">
        <li><button class="nav-link active" onclick="showPanel('home', this)">
            <span class="nav-icon">🏠</span><span>Home</span></button></li>
        <li><button class="nav-link" onclick="showPanel('colleges', this)">
            <span class="nav-icon">🏛️</span><span>Colleges</span></button></li>
        <li><button class="nav-link" onclick="showPanel('search', this); initSearch()">
            <span class="nav-icon">🔍</span><span>Search</span></button></li>
        <li><button class="nav-link" onclick="showPanel('courses', this)">
            <span class="nav-icon">📚</span><span>Courses</span></button></li>
        <li><button class="nav-link" onclick="goToInquiry()">
            <span class="nav-icon">📩</span><span>Inquire</span></button></li>
        <li><button class="nav-link" onclick="window.location.href='quiz'">
            <span class="nav-icon">🧠</span><span>Career Quiz</span></button></li>
    </ul>

    <div class="sidebar-footer">
        <button class="logout-btn" onclick="openLogoutModal()">
            <span class="nav-icon">🚪</span>
            <span>Logout</span>
        </button>
        <div class="copyright">© 2026 CareerConnect</div>
    </div>
</aside>

<div class="main-area">

    <header class="topbar">
        <div class="topbar-title" id="topbarTitle">Home</div>
        <div class="topbar-user">
            <div class="user-avatar">${fn:substring(sessionScope.loggedInUser.username,0,1)}</div>
            Welcome, <strong>${sessionScope.loggedInUser.username}</strong>
        </div>
    </header>

    <main class="page-content">

        <section class="panel active" id="panel-home">

            <div class="stats-row">
                <div class="stat-box">
                    <div class="stat-num">${collegesCount}</div>
                    <div class="stat-lbl">Colleges</div>
                </div>

                <div class="stat-box">
                    <div class="stat-num">${coursesCount}</div>
                    <div class="stat-lbl">Courses</div>
                </div>

                <div class="stat-box">
                    <div class="stat-num">${inquiriesCount}</div>
                    <div class="stat-lbl">My Inquiries</div>
                </div>

                <div class="stat-box">
                    <div class="stat-num">${careerPathsCount}</div>
                    <div class="stat-lbl">Career Paths</div>
                </div>
            </div>

            <div class="stream-overview">
                <div class="stream-overview-header">
                    <div class="stream-overview-title">📊 Colleges by Stream</div>
                    <div class="stream-legend" id="streamLegend"></div>
                </div>

                <div class="stream-bars" id="streamBars">
                    <div style="color:var(--muted);font-size:0.85rem;">Loading…</div>
                </div>
            </div>

            <div class="section-title">Recent Colleges</div>

            <table class="data-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>College Name</th>
                    <th>City</th>
                    <th>Stream</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="college" items="${colleges}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${college.name}</td>
                        <td>${college.city}</td>
                        <td>${college.stream}</td>
                        <td>${college.type}</td>
                        <td>
                            <button class="btn-primary" onclick="goToInquiry()">Inquire</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </section>

        <section class="panel" id="panel-colleges">

            <div class="section-title">All Colleges</div>

            <table class="data-table">

                <thead>
                <tr>
                    <th>#</th>
                    <th>College Name</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Stream</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="college" items="${colleges}" varStatus="status">

                    <tr>

                        <td>${status.index + 1}</td>
                        <td>${college.name}</td>
                        <td>${college.city}</td>
                        <td>${college.state}</td>
                        <td>${college.stream}</td>

                        <td>

                            <c:choose>

                                <c:when test="${college.type == 'Govt'}">
                                    <span class="badge-govt">Govt</span>
                                </c:when>

                                <c:when test="${college.type == 'Private'}">
                                    <span class="badge-pvt">Private</span>
                                </c:when>

                                <c:otherwise>
                                    <span class="badge-deemed">${college.type}</span>
                                </c:otherwise>

                            </c:choose>

                        </td>

                        <td>
                            <button class="btn-primary" onclick="goToInquiry()">Inquire</button>
                        </td>

                    </tr>

                </c:forEach>

                </tbody>
            </table>

        </section>

        <section class="panel" id="panel-search">

            <div class="section-title">Search Colleges</div>

            <div class="search-bar-row">

                <input type="text"
                       id="searchInput"
                       class="search-input"
                       placeholder="Search by name or city..."
                       oninput="filterColleges()">

                <select id="streamFilter" class="filter-sel" onchange="filterColleges()">
                    <option value="">All Streams</option>
                    <option>Engineering</option>
                    <option>Management</option>
                    <option>Medical</option>
                    <option>Science</option>
                    <option>Arts</option>
                </select>

                <select id="typeFilter" class="filter-sel" onchange="filterColleges()">
                    <option value="">All Types</option>
                    <option value="Govt">Government</option>
                    <option value="Private">Private</option>
                    <option value="Deemed">Deemed</option>
                </select>

                <button class="btn-primary" onclick="filterColleges()">Search</button>

            </div>

            <table class="data-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>College Name</th>
                    <th>City</th>
                    <th>Stream</th>
                    <th>Type</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody id="searchResults"></tbody>

            </table>

            <div id="noResults" style="display:none;" class="no-results">
                <span class="no-results-icon">🔍</span>
                No colleges match your search.
            </div>

        </section>

        <section class="panel" id="panel-courses">
            <div class="section-title">Courses</div>
        </section>

    </main>
</div>

<div id="logoutModal" class="logout-modal">

    <div class="logout-box">

        <h3>Confirm Logout</h3>

        <p>Are you sure you want to logout?</p>

        <div class="logout-actions">

            <button class="cancel-btn" onclick="closeLogoutModal()">Cancel</button>

            <a href="${pageContext.request.contextPath}/logout">
                <button class="confirm-btn">Logout</button>
            </a>

        </div>

    </div>

</div>

<script>

    var colleges = [

        <c:forEach var="c" items="${colleges}" varStatus="status">

        {
            n: "${fn:escapeXml(c.name)}",
            city: "${fn:escapeXml(c.city)}",
            stream: "${fn:escapeXml(c.stream)}",
            type: "${fn:escapeXml(c.type)}"
        }

        <c:if test="${!status.last}">,</c:if>

        </c:forEach>

    ];

    var ctx = "${pageContext.request.contextPath}";

    function goToInquiry(){
        window.location.href = ctx + "/student/Inquiry";
    }

    function openLogoutModal(){
        document.getElementById("logoutModal").style.display="flex";
    }

    function closeLogoutModal(){
        document.getElementById("logoutModal").style.display="none";
    }

    var panelTitles={
        home:'Home',
        colleges:'All Colleges',
        search:'Search',
        courses:'Courses'
    };

    function showPanel(id,btn){

        document.querySelectorAll('.panel').forEach(function(p){
            p.classList.remove('active');
        });

        document.querySelectorAll('.nav-link').forEach(function(l){
            l.classList.remove('active');
        });

        var panel=document.getElementById('panel-'+id);
        if(panel)panel.classList.add('active');
        if(btn)btn.classList.add('active');

        var title=document.getElementById('topbarTitle');
        if(title)title.textContent=panelTitles[id]||id;

    }

    var STREAM_COLORS={
        Engineering:'#4fc3f7',
        Management:'#a78bfa',
        Medical:'#3fb950',
        Science:'#f78166',
        Arts:'#d29922',
        Other:'#8b949e'
    };

    function buildStreamChart(){

        var counts={};

        colleges.forEach(function(c){
            var s=(c.stream&&c.stream.trim())?c.stream.trim():'Other';
            counts[s]=(counts[s]||0)+1;
        });

        var entries=Object.entries(counts).sort(function(a,b){return b[1]-a[1]});
        var max=entries.length?entries[0][1]:1;

        var legendEl=document.getElementById('streamLegend');

        if(legendEl){

            legendEl.innerHTML=entries.map(function(e){

                var color=STREAM_COLORS[e[0]]||STREAM_COLORS.Other;

                return '<div class="legend-item">'+
                    '<div class="legend-dot" style="background:'+color+'"></div>'+
                    e[0]+
                    '</div>';

            }).join('');

        }

        var barsEl=document.getElementById('streamBars');

        if(!barsEl)return;

        if(!entries.length){

            barsEl.innerHTML='<div style="color:var(--muted);font-size:0.85rem;">No data available.</div>';

            return;

        }

        barsEl.innerHTML=entries.map(function(e){

            var color=STREAM_COLORS[e[0]]||STREAM_COLORS.Other;
            var pct=Math.round((e[1]/max)*100);

            return '<div class="stream-bar-row">'+
                '<div class="stream-bar-label">'+e[0]+'</div>'+
                '<div class="stream-bar-track">'+
                '<div class="stream-bar-fill" style="background:'+color+';width:0" data-target="'+pct+'"></div>'+
                '</div>'+
                '<div class="stream-bar-count">'+e[1]+'</div>'+
                '</div>';

        }).join('');

        setTimeout(function(){

            barsEl.querySelectorAll('.stream-bar-fill').forEach(function(el){
                el.style.width=el.getAttribute('data-target')+'%';
            });

        },80);

    }

    function initSearch(){

        var si=document.getElementById('searchInput');
        var sf=document.getElementById('streamFilter');
        var tf=document.getElementById('typeFilter');

        if(si)si.value='';
        if(sf)sf.value='';
        if(tf)tf.value='';

        renderSearch(colleges);

    }

    function filterColleges(){

        var q=document.getElementById('searchInput').value.toLowerCase().trim();
        var s=document.getElementById('streamFilter').value;
        var t=document.getElementById('typeFilter').value;

        var res=colleges.filter(function(c){

            var matchQ=!q||(c.n&&c.n.toLowerCase().includes(q))||(c.city&&c.city.toLowerCase().includes(q));
            var matchS=!s||c.stream===s;
            var matchT=!t||c.type===t;

            return matchQ&&matchS&&matchT;

        });

        renderSearch(res);

    }

    function renderSearch(list){

        var tb=document.getElementById('searchResults');
        var np=document.getElementById('noResults');

        if(!tb)return;

        if(!list||list.length===0){

            tb.innerHTML='';
            if(np)np.style.display='block';
            return;

        }

        if(np)np.style.display='none';

        var badgeMap={Govt:'badge-govt',Private:'badge-pvt',Deemed:'badge-deemed'};

        tb.innerHTML=list.map(function(c,i){

            var badge=badgeMap[c.type]||'badge-deemed';

            return '<tr>'+
                '<td>'+(i+1)+'</td>'+
                '<td>'+(c.n||'—')+'</td>'+
                '<td>'+(c.city||'—')+'</td>'+
                '<td>'+(c.stream||'—')+'</td>'+
                '<td><span class="'+badge+'">'+(c.type||'—')+'</span></td>'+
                '<td><button class="btn-primary" onclick="goToInquiry()">Inquire</button></td>'+
                '</tr>';

        }).join('');

    }

    document.addEventListener('DOMContentLoaded',function(){
        buildStreamChart();
    });

</script>

</body>
</html>