<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <!-- Bootstrap 5.3 (Phiên bản mới nhất & ổn định nhất của Bootstrap) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-card {
            max-width: 420px;
            border-radius: 1rem;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center min-vh-100">

    <div class="card login-card shadow-sm border-0 w-100 p-4">
        <div class="card-body">
            <div class="text-center mb-4">
                <i class="bi bi-person-circle display-4 text-primary"></i>
                <h3 class="fw-bold mt-2">Đăng Nhập</h3>
                <p class="text-muted small">Nhập tài khoản để tiếp tục</p>
            </div>

            <!-- Thông báo lỗi khi đăng nhập thất bại -->
            <% if ("true".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center" role="alert">
                    <i class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2"></i>
                    <div>Tài khoản hoặc mật khẩu không chính xác!</div>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <!-- Form gửi dữ liệu method POST đến /auth/login -->
            <form action="${pageContext.request.contextPath}/auth/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label fw-semibold">Tên đăng nhập</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Nhập username" required autofocus>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-semibold">Mật khẩu</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập password" required>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="rememberMe">
                        <label class="form-check-label text-muted small" for="rememberMe">Ghi nhớ tôi</label>
                    </div>
                    <a href="#" class="text-decoration-none small">Quên mật khẩu?</a>
                </div>

                <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">
                    Đăng nhập
                </button>
            </form>

            <div class="text-center mt-3">
                <small class="text-muted">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/auth/register" class="text-decoration-none">Đăng ký</a></small>
            </div>

            <div class="text-center mt-2">
                <small class="text-muted">Gợi ý: Tài khoản <b>admin</b> / Mật khẩu <b>admin</b></small>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5.3 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
