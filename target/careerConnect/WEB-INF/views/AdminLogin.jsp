<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerConnect · Admin Portal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <style>
        /* Admin-specific overrides */
        .admin-badge {
            background: linear-gradient(135deg, #2563eb, #7c3aed);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }

        .stats-row-admin .stat svg {
            fill: #7c3aed;
        }

        .login-btn-admin {
            background: linear-gradient(135deg, #2563eb, #7c3aed);
        }

        .login-btn-admin:hover {
            background: linear-gradient(135deg, #1d4ed8, #6d28d9);
        }

        .security-badge {
            background: rgba(124, 58, 237, 0.1);
            border: 1px solid rgba(124, 58, 237, 0.2);
        }
    </style>
</head>
<body>

<div class="login-container">

    <!-- LEFT: Admin Brand Panel -->
    <div class="brand-panel" style="background: linear-gradient(145deg, #0f172a, #1e1b4b);">
        <div class="brand-header">
            <div class="logo-area">
                <span class="logo-icon" style="background: #7c3aed;">AD</span>
                <span>CareerConnect <span class="admin-badge">Admin</span></span>
            </div>
            <div class="brand-tagline">
                manage · monitor · moderate
                <span>institutional control panel</span>
            </div>
        </div>

        <!-- Admin Features -->
        <div class="admin-features" style="margin: 2rem 0; padding: 0 2rem;">
            <div class="feature-item" style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1.5rem;">
                <div style="background: rgba(124, 58, 237, 0.2); padding: 0.75rem; border-radius: 12px;">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#7c3aed">
                        <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                    </svg>
                </div>
                <div>
                    <strong style="color: white; display: block;">200+ Active Students</strong>
                    <span style="color: #94a3b8; font-size: 0.85rem;">manage all student accounts</span>
                </div>
            </div>

            <div class="feature-item" style="display: flex; align-items: center; gap: 1rem; margin-bottom: 1.5rem;">
                <div style="background: rgba(124, 58, 237, 0.2); padding: 0.75rem; border-radius: 12px;">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#7c3aed">
                        <path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-3 10h-5v5h-2v-5H8v-2h5V6h2v5h5v2z"/>
                    </svg>
                </div>
                <div>
                    <strong style="color: white; display: block;">50+ Colleges</strong>
                    <span style="color: #94a3b8; font-size: 0.85rem;">manage college listings</span>
                </div>
            </div>

            <div class="feature-item" style="display: flex; align-items: center; gap: 1rem;">
                <div style="background: rgba(124, 58, 237, 0.2); padding: 0.75rem; border-radius: 12px;">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="#7c3aed">
                        <path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                    </svg>
                </div>
                <div>
                    <strong style="color: white; display: block;">150+ Inquiries</strong>
                    <span style="color: #94a3b8; font-size: 0.85rem;">manage student inquiries</span>
                </div>
            </div>
        </div>

        <!-- Admin Testimonial -->
        <div class="testimonial-mini" style="background: rgba(124, 58, 237, 0.1); border-left: 3px solid #7c3aed;">
            <p>"Full control over student data, college listings, and inquiry management. Secure admin dashboard with detailed analytics."</p>
            <div class="student">
                <span class="avatar-placeholder" style="background: #312e81;">
                    <svg viewBox="0 0 24 24" fill="white">
                        <path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 2.4c-3.2 0-9.6 1.6-9.6 4.8v2.4h19.2v-2.4c0-3.2-6.4-4.8-9.6-4.8z"/>
                    </svg>
                </span>
                <strong>Dr. Rajesh Kumar</strong> · Admin
            </div>
        </div>

        <!-- Stats Row for Admin -->
        <div class="stats-row stats-row-admin" style="margin-top: 2rem;">
            <div class="stat">
                <svg viewBox="0 0 24 24" fill="#7c3aed">
                    <path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-1 .05 1.16.84 2 1.87 2 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/>
                </svg>
                15+ Admins
            </div>
            <div class="stat">
                <svg viewBox="0 0 24 24" fill="#7c3aed">
                    <path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm0 4c2.76 0 5 2.24 5 5s-2.24 5-5 5-5-2.24-5-5 2.24-5 5-5z"/>
                </svg>
                24/7 Monitoring
            </div>
        </div>
    </div>

    <!-- RIGHT: Admin Login Form -->
    <div class="form-panel">
        <div class="form-header">
            <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem;">
                <div style="width: 4px; height: 24px; background: #7c3aed; border-radius: 4px;"></div>
                <h2 style="margin: 0;">admin access</h2>
            </div>
            <p>secure administrator login · <a href="${pageContext.request.contextPath}/" style="color: #7c3aed;">back to student portal</a></p>
        </div>

        <!-- Error Message Display -->
        <c:if test="${not empty error}">
            <div style="background: rgba(239, 68, 68, 0.1); border: 1px solid #ef4444; color: #ef4444; padding: 0.75rem; border-radius: 8px; margin-bottom: 1.5rem; font-size: 0.9rem;">
                ⚠️ ${error}
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div style="background: rgba(16, 185, 129, 0.1); border: 1px solid #10b981; color: #10b981; padding: 0.75rem; border-radius: 8px; margin-bottom: 1.5rem; font-size: 0.9rem;">
                ✓ ${success}
            </div>
        </c:if>

        <form class="login-form" action="${pageContext.request.contextPath}/adminverify" method="post">

            <!-- Admin ID / Email field -->
            <div class="input-group">
                <label for="admin-email">
                    <span class="label-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" fill="#7c3aed"/>
                        </svg>
                    </span>
                    admin email / ID
                </label>
                <div class="input-field">
                    <span class="field-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z" fill="#94a3b8"/>
                        </svg>
                    </span>
                    <input type="text" id="admin-email" name="email"
                           placeholder="admin@careerconnect.edu" required>
                </div>
            </div>

            <!-- Password field -->
            <div class="input-group">
                <label for="admin-password">
                    <span class="label-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z" fill="#7c3aed"/>
                        </svg>
                    </span>
                    password
                </label>
                <div class="input-field">
                    <span class="field-icon">
                        <svg viewBox="0 0 24 24">
                            <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z" fill="#94a3b8"/>
                        </svg>
                    </span>
                    <input type="password" id="admin-password" name="password"
                           placeholder="enter admin password" required>
                    <button type="button" class="toggle-pw" aria-label="Toggle password visibility"
                            onclick="(function(btn){
                                var inp = btn.closest('.input-field').querySelector('input');
                                var isHidden = inp.type === 'password';
                                inp.type = isHidden ? 'text' : 'password';
                                btn.querySelector('.eye-open').style.display  = isHidden ? 'none'  : 'block';
                                btn.querySelector('.eye-close').style.display = isHidden ? 'block' : 'none';
                            })(this)">
                        <svg class="eye-open" viewBox="0 0 24 24">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="#94a3b8"/>
                        </svg>
                        <svg class="eye-close" style="display:none" viewBox="0 0 24 24">
                            <path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46C3.08 8.3 1.78 10.02 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z" fill="#94a3b8"/>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Security Note -->
            <div class="security-badge" style="display: flex; align-items: center; gap: 0.75rem; padding: 0.75rem; border-radius: 8px; margin-bottom: 1.5rem;">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="#7c3aed">
                    <path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm0 10.99h7c-.53 4.12-3.28 7.79-7 8.94V12H5V6.3l7-3.11v8.8z"/>
                </svg>
                <span style="font-size: 0.85rem; color: #cbd5e1;">Two-factor authentication recommended for admin accounts</span>
            </div>

            <!-- Options row -->
            <div class="form-options">
                <label class="checkbox">
                    <input type="checkbox" name="remember"> keep me signed in
                </label>
                <a href="#" class="forgot-link" style="color: #7c3aed;">forgot password?</a>
            </div>

            <!-- Submit -->
            <button type="submit" class="login-btn login-btn-admin">
                <svg viewBox="0 0 24 24">
                    <path d="M10 17l5-5-5-5v10z" fill="white"/>
                </svg>
                access admin dashboard
            </button>

            <div class="signup-redirect" style="border-top-color: rgba(124, 58, 237, 0.2);">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="#7c3aed" style="margin-right: 0.5rem;">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/>
                </svg>
                <span style="color: #94a3b8;">Authorized personnel only · </span>
                <a href="${pageContext.request.contextPath}/admin/help" style="color: #7c3aed;">need help?</a>
            </div>
        </form>

        <!-- Admin Footer -->
        <div class="copyright" style="border-top-color: rgba(124, 58, 237, 0.2);">
            &copy; CareerConnect Admin Portal
            <span class="separator">&middot;</span>
            v2.0.1
            <span class="separator">&middot;</span>
            <span style="display: inline-flex; align-items: center; gap: 4px;">
                <svg width="14" height="14" viewBox="0 0 24 24" fill="#7c3aed">
                    <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2z"/>
                </svg>
                SSL Secured
            </span>
        </div>
    </div>

</div>

<!-- Additional script for password toggle (if not already in main JS) -->
<script>
    var error = "${error}";

    if(error && error > 0){
        alert(error);
    }
    // Password toggle functionality (backup)
    document.querySelectorAll('.toggle-pw').forEach(btn => {
        btn.addEventListener('click', function() {
            const input = this.closest('.input-field').querySelector('input');
            const isHidden = input.type === 'password';
            input.type = isHidden ? 'text' : 'password';
            this.querySelector('.eye-open').style.display = isHidden ? 'none' : 'block';
            this.querySelector('.eye-close').style.display = isHidden ? 'block' : 'none';
        });
    });
</script>

</body>
</html>