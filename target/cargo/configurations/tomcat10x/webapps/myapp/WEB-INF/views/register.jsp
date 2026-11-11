<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .register-card { max-width: 440px; border-radius: 1rem; }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center min-vh-100">

    <div class="card register-card shadow-sm border-0 w-100 p-4">
        <div class="card-body">
            <div class="text-center mb-4">
                <i class="bi bi-person-plus-fill display-4 text-success"></i>
                <h3 class="fw-bold mt-2">Đăng Ký</h3>
                <p class="text-muted small">Tạo tài khoản mới để bắt đầu</p>
            </div>

            <!-- Form gửi dữ liệu method POST đến /auth/register -->
            <form action="${pageContext.request.contextPath}/auth/register" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label fw-semibold">Tên đăng nhập</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required autofocus>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label fw-semibold">Email</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-semibold">Mật khẩu</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-success w-100 py-2 fw-semibold">
                    Đăng ký
                </button>
            </form>

            <div class="text-center mt-3">
                <small class="text-muted">Đã có tài khoản? <a href="${pageContext.request.contextPath}/auth/login" class="text-decoration-none">Đăng nhập</a></small>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
