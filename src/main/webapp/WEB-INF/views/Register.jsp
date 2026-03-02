<%-- 
    Document   : register
    Created on : 2 Mar 2026
    Author     : Kartavya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerConnect – Register</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>

        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        :root {
            --navy:   #1a2e3f;
            --blue:   #1d4e6f;
            --lt:     #d0e8f5;
            --bg:     #f4f7fb;
            --border: #dde6ef;
            --text:   #0b2b3b;
            --muted:  #5a7a8e;
        }

        body {
            background: linear-gradient(145deg, #f0f5fa 0%, #e6eef7 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            line-height: 1.5;
        }

        /* ── CARD ── */
        .register-container {
            width: 100%;
            max-width: 1000px;
            background: rgba(255,255,255,0.88);
            backdrop-filter: blur(10px);
            border-radius: 2rem;
            box-shadow: 0 30px 60px -20px rgba(0,40,80,0.3), 0 8px 20px -8px rgba(0,32,64,0.18);
            overflow: hidden;
            display: flex;
            flex-wrap: wrap;
            border: 1px solid rgba(255,255,255,0.5);
        }

        /* ── LEFT PANEL ── */
        .brand-panel {
            flex: 1 1 38%;
            background: linear-gradient(155deg, var(--navy) 0%, var(--blue) 100%);
            padding: 3rem 2.5rem;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            isolation: isolate;
        }

        .brand-panel::after {
            content: '';
            position: absolute; inset: 0;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100' opacity='0.07'%3E%3Cpath fill='white' d='M20 30 L30 20 L40 30 L50 15 L60 30 L70 25 L80 35 L75 45 L85 55 L70 60 L75 75 L60 70 L50 85 L40 70 L25 75 L30 55 L15 45 L28 35 L20 30 Z'/%3E%3C/svg%3E");
            background-size: 160px;
            background-repeat: repeat;
            z-index: -1;
        }

        .logo-area {
            display: flex; align-items: center; gap: 0.75rem;
            font-size: 1.6rem; font-weight: 600;
            letter-spacing: -0.02em; margin-bottom: 2rem;
        }

        .logo-box {
            background: white; color: var(--blue);
            width: 42px; height: 42px; border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-weight: 700; font-size: 0.85rem;
            box-shadow: 0 4px 14px rgba(0,0,0,0.25);
            flex-shrink: 0;
        }

        .brand-tagline {
            font-size: 2rem; font-weight: 500; line-height: 1.3;
            text-shadow: 0 2px 5px rgba(0,20,30,0.4);
        }

        .brand-tagline span {
            display: block; font-size: 1.05rem; font-weight: 400;
            margin-top: 0.6rem; opacity: 0.85; text-shadow: none;
        }

        .steps-box {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.18);
            border-radius: 20px;
            padding: 1.4rem 1.6rem;
            margin-top: 2rem;
        }

        .steps-box p {
            font-size: 0.82rem; font-weight: 600;
            text-transform: uppercase; letter-spacing: 1px;
            opacity: 0.65; margin-bottom: 1rem;
        }

        .step-item {
            display: flex; align-items: center; gap: 0.75rem;
            font-size: 0.88rem; padding: 0.45rem 0;
        }

        .step-item .num {
            width: 24px; height: 24px; border-radius: 50%;
            background: rgba(255,255,255,0.2);
            display: flex; align-items: center; justify-content: center;
            font-size: 0.75rem; font-weight: 700; flex-shrink: 0;
        }

        .brand-bottom {
            font-size: 0.8rem; opacity: 0.55; margin-top: 2rem;
        }

        /* ── RIGHT PANEL ── */
        .form-panel {
            flex: 1 1 55%;
            background: white;
            padding: 2.8rem 2.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-header { margin-bottom: 1.8rem; }

        .form-header h2 {
            font-size: 1.8rem; font-weight: 600;
            color: var(--text); letter-spacing: -0.02em;
            margin-bottom: 0.3rem;
        }

        .form-header p { color: var(--muted); font-size: 0.92rem; }
        .form-header a { color: var(--blue); font-weight: 500; text-decoration: none; border-bottom: 1px solid transparent; transition: border-color 0.2s; }
        .form-header a:hover { border-bottom-color: var(--blue); }

        /* Error / Success alerts */
        .alert {
            padding: 0.75rem 1rem;
            border-radius: 10px;
            font-size: 0.88rem;
            font-weight: 500;
            margin-bottom: 1.2rem;
        }
        .alert-error   { background: #fee2e2; border: 1px solid #fca5a5; color: #991b1b; }
        .alert-success { background: #d1fae5; border: 1px solid #6ee7b7; color: #065f46; }

        /* ── FORM ── */
        .reg-form { display: flex; flex-direction: column; gap: 1rem; }

        .form-row-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }

        .field-group { display: flex; flex-direction: column; gap: 0.3rem; }

        .field-group label {
            font-size: 0.83rem; font-weight: 600;
            color: #1f3c4c; display: flex; align-items: center; gap: 6px;
        }

        .field-group label svg { width: 14px; height: 14px; fill: var(--muted); }

        .field-group input,
        .field-group select {
            padding: 0.65rem 0.95rem;
            border: 1.5px solid var(--border);
            border-radius: 10px;
            font-size: 0.92rem; color: var(--text);
            background: var(--bg);
            outline: none; font-family: inherit;
            transition: border-color 0.2s, background 0.2s;
        }

        .field-group input::placeholder { color: #a6c0d2; font-weight: 300; }

        .field-group input:focus,
        .field-group select:focus {
            border-color: var(--blue);
            background: white;
            box-shadow: 0 0 0 3px rgba(29,78,111,0.08);
        }

        /* Role tabs */
        .role-tabs { display: flex; gap: 0.6rem; }

        .role-tab {
            flex: 1; padding: 0.65rem;
            border: 1.5px solid var(--border);
            border-radius: 10px;
            background: var(--bg);
            color: var(--muted);
            font-size: 0.88rem; font-weight: 500;
            cursor: pointer; text-align: center;
            transition: all 0.2s;
            display: flex; align-items: center; justify-content: center; gap: 6px;
        }

        .role-tab svg { width: 16px; height: 16px; fill: var(--muted); }

        .role-tab.selected {
            background: var(--blue); color: white;
            border-color: var(--blue);
        }

        .role-tab.selected svg { fill: white; }

        /* Password strength bar */
        .strength-bar {
            height: 4px;
            border-radius: 4px;
            background: var(--border);
            margin-top: 6px;
            overflow: hidden;
        }

        .strength-fill {
            height: 100%; border-radius: 4px;
            transition: width 0.3s, background 0.3s;
            width: 0;
        }

        .strength-text { font-size: 0.75rem; color: var(--muted); margin-top: 3px; }

        /* Submit button */
        .register-btn {
            background: var(--blue); color: white;
            border: none; border-radius: 40px;
            padding: 0.95rem;
            font-size: 1.05rem; font-weight: 600;
            cursor: pointer; transition: all 0.2s;
            display: flex; align-items: center; justify-content: center; gap: 8px;
            box-shadow: 0 6px 18px -8px rgba(14,40,65,0.45);
            margin-top: 0.4rem;
        }

        .register-btn svg { width: 18px; height: 18px; fill: white; }
        .register-btn:hover { background: var(--navy); transform: scale(1.01); }
        .register-btn:active { transform: scale(0.99); }

        /* Login redirect */
        .login-redirect {
            text-align: center; margin-top: 1.4rem;
            color: var(--muted); font-size: 0.9rem;
        }

        .login-redirect a {
            color: var(--blue); font-weight: 600;
            text-decoration: none;
            border-bottom: 2px solid var(--lt);
        }

        .login-redirect a:hover { border-bottom-color: var(--blue); }

        /* Footer */
        .form-footer {
            margin-top: 1.8rem; font-size: 0.74rem;
            color: #93adc2; text-align: center;
            border-top: 1px solid var(--border);
            padding-top: 1rem;
        }

        /* ── RESPONSIVE ── */
        @media (max-width: 760px) {
            .register-container { flex-direction: column; border-radius: 1.5rem; }
            .brand-panel { padding: 2rem 1.8rem; }
            .brand-tagline { font-size: 1.6rem; }
            .form-panel { padding: 2rem 1.8rem; }
            .form-row-2 { grid-template-columns: 1fr; }
        }

    </style>
</head>
<body>

<%-- Show error/success from RegisterServlet redirect --%>
<%
    String errorMsg   = (String) request.getAttribute("error");
    String successMsg = (String) request.getAttribute("success");
%>

<div class="register-container">

    <!-- ══ LEFT BRANDING ══ -->
    <div class="brand-panel">
        <div>
            <div class="logo-area">
                <span class="logo-box">CC</span>
                CareerConnect
            </div>
            <div class="brand-tagline">
                Start your journey.
                <span>Create a free student account and explore 48+ colleges & 120+ courses.</span>
            </div>
        </div>

        <div class="steps-box">
            <p>How it works</p>
            <div class="step-item"><span class="num">1</span> Register with your email</div>
            <div class="step-item"><span class="num">2</span> Browse colleges &amp; courses</div>
            <div class="step-item"><span class="num">3</span> Send inquiry directly</div>
            <div class="step-item"><span class="num">4</span> Get college response</div>
        </div>

        <div class="brand-bottom">&copy; CareerConnect &middot; student guidance portal &middot; secured by SSL</div>
    </div>


    <!-- ══ RIGHT FORM ══ -->
    <div class="form-panel">

        <div class="form-header">
            <h2>Create account</h2>
            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Sign in here</a></p>
        </div>

        <%-- Error / Success alerts --%>
        <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
            <div class="alert alert-error"><%= errorMsg %></div>
        <% } %>
        <% if (successMsg != null && !successMsg.isEmpty()) { %>
            <div class="alert alert-success"><%= successMsg %></div>
        <% } %>

        <%-- Form → posts to RegisterServlet --%>
        <form class="reg-form" method="POST"
              action="${pageContext.request.contextPath}/registerProcess"
              onsubmit="return validateForm()">

            <%-- Row 1: Username --%>
            <div class="field-group">
                <label>
                    <svg viewBox="0 0 24 24"><path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 2.4c-3.2 0-9.6 1.6-9.6 4.8v2.4h19.2v-2.4c0-3.2-6.4-4.8-9.6-4.8z"/></svg>
                    Username
                </label>
                <input type="text" name="username" id="username"
                       placeholder="e.g. kartavya_singh"
                       value="${param.username}"
                       required maxlength="50">
            </div>

            <%-- Row 2: Email + Phone (2 cols) --%>
            <div class="form-row-2">
                <div class="field-group">
                    <label>
                        <svg viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>
                        Email Address
                    </label>
                    <input type="email" name="email" id="email"
                           placeholder="you@example.com"
                           value="${param.email}"
                           required maxlength="100">
                </div>

                <div class="field-group">
                    <label>
                        <svg viewBox="0 0 24 24"><path d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.1.4 2.3.6 3.6.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1-9.4 0-17-7.6-17-17 0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.6.1.3 0 .7-.2 1L6.6 10.8z"/></svg>
                        Phone (optional)
                    </label>
                    <input type="tel" name="phone" id="phone"
                           placeholder="+91 99999 99999"
                           maxlength="15">
                </div>
            </div>

            <%-- Row 3: Password + Confirm Password --%>
            <div class="form-row-2">
                <div class="field-group">
                    <label>
                        <svg viewBox="0 0 24 24"><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/></svg>
                        Password
                    </label>
                    <input type="password" name="password" id="password"
                           placeholder="Min. 6 characters"
                           required oninput="checkStrength(this.value)">
                    <div class="strength-bar"><div class="strength-fill" id="strengthFill"></div></div>
                    <span class="strength-text" id="strengthText"></span>
                </div>

                <div class="field-group">
                    <label>
                        <svg viewBox="0 0 24 24"><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/></svg>
                        Confirm Password
                    </label>
                    <input type="password" id="confirmPassword"
                           placeholder="Re-enter password"
                           required>
                </div>
            </div>

            <%-- Row 4: Role selection --%>
            <div class="field-group">
                <label>
                    <svg viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 14.5v-9l6 4.5-6 4.5z"/></svg>
                    Register as
                </label>
                <div class="role-tabs">
                    <div class="role-tab selected" id="tab-student" onclick="selectRole('STUDENT')">
                        <svg viewBox="0 0 24 24"><path d="M12 3L1 9l4 2.18V17h2v-4.82l1 .55V17c0 2.21 3.58 4 8 4s8-1.79 8-4v-4.27L23 9 12 3z"/></svg>
                        Student
                    </div>
                </div>
                <%-- Hidden input that actually sends the role --%>
                <input type="hidden" name="role" id="roleInput" value="STUDENT">
            </div>

            <%-- Submit --%>
            <button type="submit" class="register-btn">
                <svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>
                Create Account
            </button>

        </form>

        <div class="login-redirect">
            Already registered? <a href="${pageContext.request.contextPath}/login">Login to dashboard</a>
        </div>

        <div class="form-footer">
            &copy; CareerConnect &middot; student guidance portal &middot; secured by SSL
        </div>

    </div><!-- /form-panel -->

</div><!-- /register-container -->


<script>
    var errorMsg = "${error}";
    if (errorMsg) {
        alert(errorMsg);
    }
    /* ── Role tab toggle ── */
    function selectRole(role) {
        document.getElementById('roleInput').value = role;
        document.getElementById('tab-student').classList.toggle('selected', role === 'STUDENT');
        document.getElementById('tab-admin').classList.toggle('selected',   role === 'ADMIN');
    }

    /* ── Password strength ── */
    function checkStrength(val) {
        const fill = document.getElementById('strengthFill');
        const txt  = document.getElementById('strengthText');
        if (!val) { fill.style.width = '0'; txt.textContent = ''; return; }

        let score = 0;
        if (val.length >= 6)                 score++;
        if (val.length >= 10)                score++;
        if (/[A-Z]/.test(val))               score++;
        if (/[0-9]/.test(val))               score++;
        if (/[^A-Za-z0-9]/.test(val))        score++;

        const levels = [
            { w: '20%', bg: '#ef4444', label: 'Very Weak' },
            { w: '40%', bg: '#f97316', label: 'Weak'      },
            { w: '60%', bg: '#eab308', label: 'Fair'      },
            { w: '80%', bg: '#22c55e', label: 'Strong'    },
            { w: '100%',bg: '#16a34a', label: 'Very Strong'}
        ];
        const l = levels[Math.min(score - 1, 4)];
        fill.style.width      = l.w;
        fill.style.background = l.bg;
        txt.textContent       = l.label;
        txt.style.color       = l.bg;
    }

    /* ── Form validation before submit ── */
    function validateForm() {
        const pwd  = document.getElementById('password').value;
        const cpwd = document.getElementById('confirmPassword').value;
        const user = document.getElementById('username').value.trim();

        if (user.length < 3) {
            alert('Username must be at least 3 characters.');
            return false;
        }
        if (pwd.length < 6) {
            alert('Password must be at least 6 characters.');
            return false;
        }
        if (pwd !== cpwd) {
            alert('Passwords do not match!');
            return false;
        }
        return true;
    }

</script>

</body>
</html>
