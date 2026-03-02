<%-- 
    Document   : error
    Created on : 3 Mar 2026, 1:30:46 am
    Author     : Kartavya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops! Something went wrong</title>
    <!-- Font Awesome for icons (optional but adds nice touch) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, system-ui, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(145deg, #f6f9fc 0%, #e9f2f9 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .error-card {
            max-width: 580px;
            width: 100%;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 48px 48px 40px 40px;
            box-shadow: 0 30px 50px -20px rgba(0, 20, 40, 0.25),
                        0 0 0 1px rgba(255,255,255,0.6) inset,
                        0 10px 20px -10px rgba(0,30,50,0.1);
            padding: 2.8rem 2.5rem 2.8rem 2.5rem;
            text-align: center;
            transition: transform 0.2s ease;
        }

        .error-card:hover {
            transform: scale(1.01);
        }

        .icon-wrapper {
            background: #ffffffd9;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            margin: 0 auto 1.8rem;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 20px 30px -10px rgba(180, 70, 70, 0.25),
                        0 4px 8px rgba(0,0,0,0.02);
            border: 2px solid white;
        }

        .icon-wrapper i {
            font-size: 64px;
            color: #c83b3b;
            filter: drop-shadow(0 6px 8px rgba(200, 50, 50, 0.2));
        }

        h1 {
            font-size: 2.8rem;
            font-weight: 700;
            letter-spacing: -0.02em;
            background: linear-gradient(130deg, #2c3e50, #3a4e62);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 0.5rem;
            line-height: 1.2;
        }

        .subtitle {
            font-size: 1.2rem;
            color: #4d6379;
            margin-bottom: 1.2rem;
            font-weight: 400;
            background: rgba(255,255,240,0.3);
            padding: 0.2rem 1rem;
            display: inline-block;
            border-radius: 60px;
            backdrop-filter: blur(2px);
        }

        .message-box {
            background: rgba(255, 255, 250, 0.7);
            border-radius: 40px;
            padding: 1.2rem 1.8rem;
            margin: 2rem 0 2.4rem 0;
            border: 1px solid rgba(255,255,255,0.8);
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.02);
        }

        .message-box p {
            font-size: 1.1rem;
            color: #2e4057;
            line-height: 1.6;
            word-break: break-word;
        }

        .message-box p i {
            color: #bb6b4a;
            margin-right: 6px;
        }

        .action-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
            justify-content: center;
            margin-top: 0.5rem;
        }

        .btn {
            border: none;
            background: white;
            padding: 1rem 2.2rem;
            border-radius: 70px;
            font-size: 1.1rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            cursor: pointer;
            transition: 0.2s ease;
            box-shadow: 0 5px 18px rgba(0, 20, 40, 0.08), 0 1px 2px rgba(0,0,0,0.02);
            border: 1px solid rgba(255,255,255,0.7);
            flex: 1 1 auto;
            min-width: 170px;
            color: #24425c;
            text-decoration: none; /* for anchor consistency */
            line-height: 1.4;
        }

        .btn i {
            font-size: 1.2rem;
            color: inherit;
        }

        .btn-home {
            background: #ffffff;
            color: #1f3b4f;
            border: 1px solid rgba(70, 130, 200, 0.3);
        }

        .btn-home:hover {
            background: #ecf5ff;
            border-color: #7aa9d2;
            box-shadow: 0 10px 18px -6px #7aa9d25e;
            transform: translateY(-2px);
        }

        .btn-refresh {
            background: #1f3b4f;
            color: white;
            border: 1px solid #244c66;
            box-shadow: 0 8px 16px -6px #1f3b4f80;
        }

        .btn-refresh:hover {
            background: #254e67;
            border-color: #2d627e;
            transform: translateY(-2px);
            box-shadow: 0 12px 22px -8px #1f3b4f;
        }

        .btn-refresh i {
            color: #b5d6f0;
        }

        .footer-note {
            margin-top: 2.2rem;
            font-size: 0.9rem;
            color: #62778b;
            border-top: 1px dashed rgba(120,150,180,0.2);
            padding-top: 1.2rem;
        }

        .footer-note span {
            background: #e1ecf5;
            padding: 0.2rem 0.8rem;
            border-radius: 30px;
            font-weight: 500;
        }

        /* make it extra responsive */
        @media (max-width: 450px) {
            .error-card {
                padding: 2rem 1.2rem;
            }
            h1 {
                font-size: 2.2rem;
            }
            .btn {
                padding: 0.9rem 1.2rem;
                min-width: 130px;
            }
        }
    </style>
</head>
<body>
    <div class="error-card" role="alert" aria-labelledby="error-heading">
        <div class="icon-wrapper">
            <i class="fas fa-exclamation-triangle" aria-hidden="true"></i>
        </div>

        <h1 id="error-heading">Something went wrong</h1>
        <div class="subtitle">••• error 5xx / glitch in the matrix •••</div>

        <div class="message-box">
            <p>
                <i class="fas fa-robot" aria-hidden="true"></i>
                An unexpected hiccup occurred. Our team has been notified.<br>
                <span style="font-size:0.95rem; opacity:0.8;">(but feel free to try again)</span>
            </p>
        </div>

        <div class="action-buttons">
            <!-- BUTTON 1: Back to Home (acts like a link to the home page) -->
            <a href="#" class="btn btn-home" onclick="simulateHome(event)" title="Return to the homepage">
                <i class="fas fa-home" aria-hidden="true"></i> Back to Home
            </a>

            <!-- BUTTON 2: Refresh / Try again (my choice – "Reload page") -->
            <button class="btn btn-refresh" onclick="handleRefresh(event)" title="Reload the current page">
                <i class="fas fa-sync-alt" aria-hidden="true"></i> Reload page
            </button>
        </div>

        <div class="footer-note">
            <span><i class="far fa-life-ring" aria-hidden="true"></i>  if problem persists, contact support</span>
        </div>
    </div>

    <script>
        (function() {
            // Optional: simulate smooth "back to home" demo behaviour.
            // Because this is a demo and there is no actual index.html,
            // we use a gentle fallback with a polite message.
            window.simulateHome = function(event) {
                event.preventDefault();  // prevent the '#' from jumping
                // In a real deployment, you'd set the href to your actual home URL.
                // For this demo, we show a friendly alert, but still give a visual click effect.
                alert("🚀 Back to home clicked");
                // optionally you can uncomment for actual navigation (for demo only, it reloads page)
               window.location.href = 'login';   // <-- real redirect
            };

            // Button 2: reload page with a tiny extra flair
            window.handleRefresh = function(event) {
                // optional tiny user feedback before reload
                const btn = event.currentTarget;
                const originalHtml = btn.innerHTML;
                btn.innerHTML = '<i class="fas fa-spinner fa-pulse"></i> reloading...';
                btn.disabled = true;  // prevent double clicks

                // simulate slight delay to show feedback (just for demo)
                setTimeout(function() {
                    window.location.reload();
                }, 200);
            };

            // Also provide a secondary global to avoid any "undefined function" if buttons tapped.
        })();
    </script>

    <!-- add a fallback for really old browsers (no JS) but we keep it unobtrusive -->
    <noscript>
        <div style="background:#fff3cd; padding:1rem; border-radius:30px; margin-top:1rem;">
            ⚠️ JavaScript is off — buttons will act as regular links.
        </div>
    </noscript>
</body>
</html>