<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CareerConnect ? Student Login</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<div class="login-container">

    <div class="brand-panel">
        <div class="brand-header">
            <div class="logo-area">
                <span class="logo-icon">CC</span>
                <span>CareerConnect</span>
            </div>
            <div class="brand-tagline">
                map your future.
                <span>student guidance portal</span>
            </div>
        </div>

        <div class="testimonial-mini">
            <p>"The career roadmaps and mentorship helped me land my first internship. Secure login keeps everything personal."</p>
            <div class="student">
                <span class="avatar-placeholder" role="img" aria-label="student avatar">
                    <!-- person icon -->
                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 2.4c-3.2 0-9.6 1.6-9.6 4.8v2.4h19.2v-2.4c0-3.2-6.4-4.8-9.6-4.8z"/>
                    </svg>
                </span>
                <strong>Anjali Sharma</strong> · computer science
            </div>
        </div>

        <div class="stats-row">
            <div class="stat">
                <!-- graduation cap icon -->
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 3L1 9l11 6 9-4.91V17h2V9L12 3zM5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82z"/>
                </svg>
                10k+ students
            </div>
            <div class="stat">
                <!-- trophy icon -->
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19 5h-2V3H7v2H5c-1.1 0-2 .9-2 2v1c0 2.55 1.92 4.63 4.39 4.94.63 1.5 1.98 2.63 3.61 2.96V19H7v2h10v-2h-4v-3.1c1.63-.33 2.98-1.46 3.61-2.96C19.08 12.63 21 10.55 21 8V7c0-1.1-.9-2-2-2zM5 8V7h2v3.82C5.84 10.4 5 9.3 5 8zm14 0c0 1.3-.84 2.4-2 2.82V7h2v1z"/>
                </svg>
                300+ careers
            </div>
        </div>
    </div>

    <!-- ?? RIGHT: Login form ?? -->
    <div class="form-panel">
        <div class="form-header">
            <h2>welcome back</h2>
            <p>sign in to continue your journey · <a href="#">register</a></p>
        </div>

        <form class="login-form" action="verify" method="post">

            <!-- Email field -->
            <div class="input-group">
                <label for="student-email">
                    <span class="label-icon">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                        </svg>
                    </span>
                    email / student ID
                </label>
                <div class="input-field">
                    <span class="field-icon">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/>
                        </svg>
                    </span>
                    <input type="email" id="student-email" name="email"
                           placeholder="name@student.college.edu" required>
                </div>
            </div>

            <!-- Password field -->
            <div class="input-group">
                <label for="student-password">
                    <span class="label-icon">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/>
                        </svg>
                    </span>
                    password
                </label>
                <div class="input-field">
                    <span class="field-icon">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/>
                        </svg>
                    </span>
                    <input type="password" id="student-password" name="password"
                           placeholder="enter your password" required>
                    <!-- show / hide toggle -->
                    <button type="button" class="toggle-pw" aria-label="Toggle password visibility"
                            onclick="(function(btn){
                                var inp = btn.closest('.input-field').querySelector('input');
                                var isHidden = inp.type === 'password';
                                inp.type = isHidden ? 'text' : 'password';
                                btn.querySelector('.eye-open').style.display  = isHidden ? 'none'  : 'block';
                                btn.querySelector('.eye-close').style.display = isHidden ? 'block' : 'none';
                            })(this)">
                        <!-- eye-open icon (visible by default) -->
                        <svg class="eye-open" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                        </svg>
                        <!-- eye-close icon (hidden by default) -->
                        <svg class="eye-close" style="display:none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46C3.08 8.3 1.78 10.02 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z"/>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Options row -->
            <div class="form-options">
                <label class="checkbox">
                    <input type="checkbox" name="remember"> keep me signed in
                </label>
                <a href="#" class="forgot-link">forgot password?</a>
            </div>

            <!-- Submit -->
            <button type="submit" class="login-btn">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10 17l5-5-5-5v10z"/>
                </svg>
                log in to dashboard
            </button>

            <div class="signup-redirect">
                new here? <a href="register">create student account</a> it's free
            </div>
        </form>
        <c:if test="${not empty success}">
    <div class="success-msg">
        ${success}
    </div>
</c:if>

        <div class="copyright">
            &copy; CareerConnect
            <span class="separator">&middot;</span>
            student guidance portal
            <span class="separator">&middot;</span>
            secured by SSL
        </div>
    </div>

</div>
</body>
</html>
